//
// rip.c
//
// Quagga RIP daemon service written by Aaron Finney, 2013
//
//

#include <rc.h>
#include <sys/stat.h>
#include <arpa/inet.h>

void start_r(void)
{
	if (nvram_match("drr_enable","1"))
	{
		FILE *fp;
		
		// create the rip daemon config file
		if ((fp = fopen("/etc/ripd.conf", "w")) != NULL) 
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

			//set up top section
			if (strlen(nvram_safe_get("drr_pwd")) > 0)
                       		fprintf(fp, "password %s\n\n", nvram_safe_get("drr_pwd"));

			// SET UP ENCRYPTION KEYS FOR ALL INTERFACES WITH MD5 ENABLED
			// ADD KEYS FOR LAN INTERFACES
	        	for(br=0 ; br<=3 ; br++) {
        	        	char bridge[2] = "0";
                		if (br!=0)
                        		bridge[0]+=br;
                		else
                        		strcpy(bridge, "");

                		sprintf(lanN_ifname, "lan%s_ifname", bridge);
                       		sprintf(lanN, "lan%s", bridge);
                       		sprintf(ParamKey1, "drr_lan%s", bridge);

                		if (strcmp(nvram_safe_get(lanN_ifname), "")!=0 && nvram_match(ParamKey1,"1") ) 
				{
					sprintf(ParamKey1, "drr_lan%s_md5", bridge);
					sprintf(ParamKey2, "drr_lan%s_pwd", bridge);
					if (nvram_match(ParamKey1,"1") && strcmp(nvram_safe_get(ParamKey2),"")!=0) 
					{
						fprintf(fp,"key chain lan%s\n", bridge);
						fprintf(fp,"    key 1\n");
						fprintf(fp, "        key-string %s\n\n", nvram_safe_get(ParamKey2));
					}
				}
			}
			// ADD KEYS FOR WAN INTERFACE IF ENABLED
                	if ( strcmp(nvram_safe_get("wan_ifname"), "")!=0 && nvram_match("drr_wan","1") ) 
			{
                		if (strcmp(nvram_safe_get("wan_ifname"), "")!=0 && nvram_match(ParamKey1,"1") ) 
                                {
					sprintf(ParamKey1, "drr_wan_md5");
					sprintf(ParamKey2, "drr_wan_pwd");
					if ( nvram_match(ParamKey1,"1") && strcmp(nvram_safe_get(ParamKey2),"")!=0 ) 
					{
						fprintf(fp,"key chain wan\n");
						fprintf(fp,"    key 1\n");
						fprintf(fp, "        key-string %s\n\n", nvram_safe_get(ParamKey2));
					}
				}
			}

			// loop through the interfaces and create the interface configurations
	        	for(br=0 ; br<=3 ; br++) {
        	        	char bridge[2] = "0";
                		if (br!=0)
                        		bridge[0]+=br;
                		else
                        		strcpy(bridge, "");

                		sprintf(lanN_ifname, "lan%s_ifname", bridge);
                       		sprintf(lanN, "lan%s", bridge);
                       		sprintf(ParamKey1, "drr_lan%s", bridge);

                		if (strcmp(nvram_safe_get(lanN_ifname), "")!=0 && nvram_match(ParamKey1,"1") ) 
				{
                       			fprintf(fp,"interface %s\n", nvram_safe_get(lanN_ifname));

					sprintf(ParamKey1, "drr_lan%s_shz", bridge);
					if (nvram_match(ParamKey1,"1")) 
						fprintf(fp, "    ip rip split-horizon\n");
					else
						fprintf(fp, "    no ip rip split-horizon\n");

					sprintf(ParamKey1, "drr_lan%s_txv", bridge);
					fprintf(fp, "    ip rip send version %s\n", nvram_safe_get(ParamKey1));				
					sprintf(ParamKey1, "drr_lan%s_rxv", bridge);
					fprintf(fp, "    ip rip receive version %s\n", nvram_safe_get(ParamKey1));				

					sprintf(ParamKey1, "drr_lan%s_md5", bridge);
					sprintf(ParamKey2, "drr_lan%s_pwd", bridge);
					if (nvram_match(ParamKey1,"1") && strcmp(nvram_safe_get(ParamKey2),"")!=0) 
					{
						fprintf(fp,"    ip rip authentication mode md5\n");
						fprintf(fp, "    ip rip authentication key-chain lan%s\n", bridge);
					} else if (nvram_match(ParamKey1,"0") && strcmp(nvram_safe_get(ParamKey2),"")!=0) {
						fprintf(fp,"    ip rip authentication mode text\n");
						fprintf(fp, "    ip rip authentication string %s\n", nvram_safe_get(ParamKey2));
					}
                		}
        		}

			// ADD WAN INTERFACE IF ENABLED
			sprintf(ParamKey1, "drr_wan");
                	if (strcmp(nvram_safe_get("wan_ifname"), "")!=0 && nvram_match(ParamKey1,"1") ) 
			{
				fprintf(fp,"interface %s\n", nvram_safe_get("wan_ifname"));

				sprintf(ParamKey1, "drr_wan_shz");
				if (nvram_match(ParamKey1,"1")) 
					fprintf(fp, "    ip rip split-horizon\n");
				else
					fprintf(fp, "    no ip rip split-horizon\n");

				sprintf(ParamKey1, "drr_wan_txv");
				fprintf(fp, "    ip rip send version %s\n", nvram_safe_get(ParamKey1));				
				sprintf(ParamKey1, "drr_wan_rxv");
				fprintf(fp, "    ip rip receive version %s\n", nvram_safe_get(ParamKey1));				

				sprintf(ParamKey1, "drr_wan_md5");
				sprintf(ParamKey2, "drr_wan_pwd");
				if (nvram_match(ParamKey1,"1") && strcmp(nvram_safe_get(ParamKey2),"")!=0) 
				{
					fprintf(fp,"    ip rip authentication mode md5\n");
					fprintf(fp, "    ip rip authentication key-chain wan %s\n", nvram_safe_get(ParamKey2));
				} else if (nvram_match(ParamKey1,"0") && strcmp(nvram_safe_get(ParamKey2),"")!=0) {
					fprintf(fp,"    ip rip authentication mode text\n");
					fprintf(fp, "    ip rip authentication string %s\n", nvram_safe_get(ParamKey2));
				}
                	}
        		
			// 
			// SET UP ROUTER RIP SECTION
			//
			fprintf(fp, "\n\n");
			fprintf(fp, "router rip\n");
			if(nvram_match("drr_rdst_d","1")) 
				fprintf(fp, "    default-information originate\n");
			if(nvram_match("drr_rdst_c","1")) 
				fprintf(fp, "    redistribute connected metric %s\n", nvram_safe_get("drr_rdst_c_mt"));
			if(nvram_match("drr_rdst_k","1")) 
				fprintf(fp, "    redistribute kernel metric %s\n", nvram_safe_get("drr_rdst_k_mt"));
#ifdef TCONFIG_OSPF
			if(nvram_match("drr_rdst_ospf","1")) 
				fprintf(fp, "    redistribute ospf metric %s\n", nvram_safe_get("drr_rdst_o_mt"));
#endif
			fprintf(fp, "    timers basic %s %s %s\n", nvram_safe_get("drr_tmr_ud"), nvram_safe_get("drr_tmr_to"), nvram_safe_get("drr_tmr_gb") );	

			// loop through the interfaces to check if rip is enabled
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
                       		sprintf(ParamKey1, "drr_lan%s", bridge);

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

					fprintf(fp,"    network %s/%d\n", inet_ntoa(network), cidr );
                       			sprintf(ParamKey1, "drr_lan%s_psv", bridge);
					if (nvram_match(ParamKey1,"1")) fprintf(fp, "    passive-interface %s\n", nvram_safe_get(lanN_ifname));
                		}
        		}

			//add network statement for the wan interface if enabled
                       	sprintf(ParamKey1, "drr_wan");
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
				fprintf(fp,"    network %s/%d\n", inet_ntoa(network), cidr );
                       		sprintf(ParamKey1, "drr_wan_psv");
				if (nvram_match(ParamKey1,"1")) fprintf(fp, "    passive-interface %s\n", nvram_safe_get("wan_ifname"));
			}

			// Add extra Distribute List Configuration
			char *buf;

			if ((buf = strdup(nvram_safe_get("drr_dlist_cfg"))) != NULL)
			{
				char *cline, *saved;
				for (cline = strtok_r(buf, "\n", &saved); cline; cline = strtok_r(NULL, "\n", &saved))
				{
					fprintf(fp, "    %s\n",cline);
				}
			}
			free(buf);

			fprintf(fp, "\n\n");

			// Add Access List Entries
			fprintf(fp, "%s\n",nvram_safe_get("drr_addl_cfg"));

			fclose(fp);
		}

		xstart("ripd",  "-d");
	}
	return;
}
	
void stop_r(void)
{
	killall("ripd", SIGTERM);
	unlink("/etc/ripd.conf");
	return;
}
