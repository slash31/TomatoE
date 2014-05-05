//
// ospf.c
//
// Quagga ospf daemon service written by Aaron Finney, 2013
//
//

#include <rc.h>
#include <sys/stat.h>
#include <arpa/inet.h>

void start_ospf(void)
{
	if (nvram_match("dro_enable","1"))
	{
		FILE *fp;
		
		// create the ospf daemon config file
		if ((fp = fopen("/etc/ospfd.conf", "w")) != NULL) 
		{

			struct in_addr ipaddr, netmask, network;
        		char lanN_ifname[] = "lanXX_ifname";
        		char lanN_ipaddr[] = "lanXX_ipaddr";
        		char lanN_netmask[] = "lanXX_netmask";
        		char lanN[] = "lanXX";
			int cidr = 0;
        		char br;
			char ParamKey1[32];
			char ParamKey2[32];

			if (strlen(nvram_safe_get("dro_pwd")) > 0)
                       		fprintf(fp, "password %s\n", nvram_safe_get("dro_pwd"));
                       	fprintf(fp, "agentx\n\n");
			// loop through the interfaces and create the interface configurations
	        	for(br=0 ; br<=3 ; br++) {
        	        	char bridge[2] = "0";
                		if (br!=0)
                        		bridge[0]+=br;
                		else
                        		strcpy(bridge, "");

                		sprintf(lanN_ifname, "lan%s_ifname", bridge);
                       		sprintf(lanN, "lan%s", bridge);
                       		sprintf(ParamKey1, "dro_lan%s", bridge);

                		if (strcmp(nvram_safe_get(lanN_ifname), "")!=0 && nvram_match(ParamKey1,"1") ) 
				{
                       			fprintf(fp,"interface %s\n", nvram_safe_get(lanN_ifname));

					sprintf(ParamKey1, "dro_lan%s_mt", bridge);
					fprintf(fp, "	ip ospf cost %s\n", nvram_safe_get(ParamKey1));

					sprintf(ParamKey1, "dro_lan%s_md5", bridge);
					sprintf(ParamKey2, "dro_lan%s_pwd", bridge);
					if (nvram_match(ParamKey1,"1") && strcmp(nvram_safe_get(ParamKey2),"")!=0) 
					{
						fprintf(fp,"	ip ospf authentication message-digest\n");
						fprintf(fp, "	ip ospf message-digest-key 1 md5 %s\n", nvram_safe_get(ParamKey2));
					} else if (nvram_match(ParamKey1,"0") && strcmp(nvram_safe_get(ParamKey2),"")!=0) {
						fprintf(fp, "	ip ospf authentication-key %s\n", nvram_safe_get(ParamKey2));
					}

					sprintf(ParamKey1, "dro_lan%s_pr", bridge);
					fprintf(fp, "	ip ospf priority %s\n", nvram_safe_get(ParamKey1));				

					sprintf(ParamKey1, "dro_lan%s_hl", bridge);
					fprintf(fp, "	ip ospf hello-interval %s\n", nvram_safe_get(ParamKey1));				
					
					sprintf(ParamKey1, "dro_lan%s_rt", bridge);
					fprintf(fp, "	ip ospf retransmit-interval %s\n", nvram_safe_get(ParamKey1));				

					sprintf(ParamKey1, "dro_lan%s_dt", bridge);
					fprintf(fp, "	ip ospf dead-interval %s\n", nvram_safe_get(ParamKey1));				
                		}
        		}

			// ADD WAN INTERFACE IF ENABLED
			sprintf(ParamKey1, "dro_wan");
                	if (strcmp(nvram_safe_get("wan_ifname"), "")!=0 && nvram_match(ParamKey1,"1") ) 
			{
                       		fprintf(fp,"interface %s\n", nvram_safe_get("wan_ifname"));

				sprintf(ParamKey1, "dro_wan_mt");
				fprintf(fp, "	ip ospf cost %s\n", nvram_safe_get(ParamKey1));

				sprintf(ParamKey1, "dro_wan_md5");
				sprintf(ParamKey2, "dro_wan_pwd");
				if (nvram_match(ParamKey1,"1") && strcmp(nvram_safe_get(ParamKey2),"")!=0) 
				{
					fprintf(fp,"	ip ospf authentication message-digest\n");
					fprintf(fp, "	ip ospf message-digest-key 1 md5 %s\n", nvram_safe_get(ParamKey2));
				} else if (nvram_match(ParamKey1,"0") && strcmp(nvram_safe_get(ParamKey2),"")!=0) {
					fprintf(fp, "	ip ospf authentication-key %s\n", nvram_safe_get(ParamKey2));
				}

				sprintf(ParamKey1, "dro_wan_pr");
				fprintf(fp, "	ip ospf priority %s\n", nvram_safe_get(ParamKey1));				

				sprintf(ParamKey1, "dro_wan_hl");
				fprintf(fp, "	ip ospf hello-interval %s\n", nvram_safe_get(ParamKey1));				

				sprintf(ParamKey1, "dro_wan_rt");
				fprintf(fp, "	ip ospf retransmit-interval %s\n", nvram_safe_get(ParamKey1));				

				sprintf(ParamKey1, "dro_wan_dt");
				fprintf(fp, "	ip ospf dead-interval %s\n", nvram_safe_get(ParamKey1));				
                	}
        		


			// 
			// SET UP ROUTER OSPF SECTION
			//
			fprintf(fp, "\n\n");
			fprintf(fp, "router ospf\n");
			fprintf(fp, "	ospf router-id %s\n", nvram_safe_get("dro_id"));
			if(nvram_match("dro_log_adj","1")) 
				fprintf(fp, "	log-adjacency-changes detail\n");
			if(nvram_match("dro_rdst_d","1")) 
				fprintf(fp, "	default-information originate\n");
			if(nvram_match("dro_rdst_c","1")) 
				fprintf(fp, "	redistribute connected metric-type %s metric %s\n", nvram_safe_get("dro_rdst_c_mtype"), nvram_safe_get("dro_rdst_c_mt"));
			if(nvram_match("dro_rdst_k","1")) 
				fprintf(fp, "	redistribute kernel metric-type %s metric %s\n", nvram_safe_get("dro_rdst_k_mtype"), nvram_safe_get("dro_rdst_k_mt"));
#ifdef TCONFIG_RIP
			if(nvram_match("dro_rdst_r","1")) 
				fprintf(fp, "	redistribute rip metric-type %s metric %s\n", nvram_safe_get("dro_rdst_r_mtype"), nvram_safe_get("dro_rdst_r_mt"));
#endif
			if(nvram_match("dro_rfc1583","1")) 
				fprintf(fp, "	ospf rfc1583compatibility\n");
			fprintf(fp, "	timers throttle spf %s %s %s\n", nvram_safe_get("dro_spf_del"), nvram_safe_get("dro_spf_hold"), nvram_safe_get("dro_spf_mhold") );	
			fprintf(fp, "	auto-cost reference-bandwidth %s\n", nvram_safe_get("dro_ac_bw"));

			if (strlen(nvram_safe_get("dro_abr_type")) > 0)
				fprintf(fp, "	ospf abr-type %s\n", nvram_safe_get("dro_abr_type"));

			// loop through the interfaces to check if ospf is enabled
			// and add network statements if so

	        	for(br=0 ; br<=3 ; br++) {
        	        	char bridge[2] = "0";
				cidr = 0;
                		if (br!=0)
                        		bridge[0]+=br;
                		else
                        		strcpy(bridge, "");

                		sprintf(lanN_ifname, "lan%s_ifname", bridge);
                       		sprintf(lanN, "lan%s", bridge);
                       		sprintf(ParamKey1, "dro_lan%s", bridge);

                		if (strcmp(nvram_safe_get(lanN_ifname), "")!=0 && nvram_match(ParamKey1,"1") ) 
				{

                        		sprintf(lanN_ipaddr, "lan%s_ipaddr", bridge);
                        		sprintf(lanN_netmask, "lan%s_netmask", bridge);

                        		inet_aton(nvram_safe_get(lanN_ipaddr), &ipaddr);
                        		inet_aton(nvram_safe_get(lanN_netmask), &netmask);

                        		// bitwise AND of ip and netmask gives the network
                        		network.s_addr = ipaddr.s_addr & netmask.s_addr;
					while ( netmask.s_addr )
					{
    						cidr += ( netmask.s_addr & 0x01 );
    						netmask.s_addr >>= 1;
					}

                       			sprintf(ParamKey1, "dro_lan%s_ar", bridge);
					fprintf(fp,"	network %s/%d area %s\n", inet_ntoa(network), cidr, nvram_safe_get(ParamKey1) );
                       			sprintf(ParamKey1, "dro_lan%s_psv", bridge);
					if (nvram_match(ParamKey1,"1")) fprintf(fp, "	passive-interface %s\n", nvram_safe_get(lanN_ifname));
                		}
        		}


			//add network statement for the wan interface if enabled
                       	sprintf(ParamKey1, "dro_wan");
                	if (strcmp(nvram_safe_get("wan_ifname"), "")!=0 && nvram_match(ParamKey1,"1") ) 
			{
                        	inet_aton(nvram_safe_get("wan_ipaddr"), &ipaddr);
				inet_aton(nvram_safe_get("wan_netmask"), &netmask);

				// bitwise AND of ip and netmask gives the network
				network.s_addr = ipaddr.s_addr & netmask.s_addr;
				while ( netmask.s_addr )
				{
    					cidr += ( netmask.s_addr & 0x01 );
    					netmask.s_addr >>= 1;
				}
                       		sprintf(ParamKey1, "dro_wan_ar");
				fprintf(fp,"	network %s/%d area %s\n", inet_ntoa(network), cidr, nvram_safe_get(ParamKey1) );
                       		sprintf(ParamKey1, "dro_wan_psv");
				if (nvram_match(ParamKey1,"1")) fprintf(fp, "	passive-interface %s\n", nvram_safe_get("wan_ifname"));
			}

			// Add extra Area Directives
                        char *buf;

                        if ((buf = strdup(nvram_safe_get("dro_ar_cfg"))) != NULL)
                        {
                                char *cline, *saved;
                                for (cline = strtok_r(buf, "\n", &saved); cline; cline = strtok_r(NULL, "\n", &saved))
                                {
                                        fprintf(fp, "	%s\n",cline);
                                }
                        }
                        free(buf);

                        fprintf(fp, "\n\n");

			// Add Access List Entries
			fprintf(fp, "%s\n",nvram_safe_get("dro_addl_cfg"));

			fclose(fp);
		}

		xstart("ospfd",  "-d");
	}
	return;
}
	
void stop_ospf(void)
{
	killall("ospfd", SIGTERM);
	unlink("/etc/ospfd.conf");
	return;
}
