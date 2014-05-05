/*
 * tcpdump.c
 *
 * Copyright (C) 2013 Aaron Finney
 *
 */
#include <rc.h>
#include <sys/stat.h>


void start_tcpdump(void)
{
	char cmdstring[128];
	if (nvram_match("tcpdump_on","1") && strcmp(nvram_safe_get("tcpdump_file"),"")!=0)
        {
		if (nvram_safe_get("tcpdump_flval") > 0)
			sprintf(cmdstring, "-%s %s", nvram_safe_get("tcpdump_fltype"),nvram_safe_get("tcpdump_flval"));
		if (nvram_safe_get("tcpdump_numf") > 0)
			sprintf(cmdstring, "%s -W %s", cmdstring, nvram_safe_get("tcpdump_flval"));
		sprintf(cmdstring, "%s -i %s", cmdstring, nvram_safe_get("tcpdump_int"));
		if  (strcmp(nvram_safe_get("tcpdump_loghost"), "") != 0)
			sprintf(cmdstring, "%s 'not host %s'", cmdstring, nvram_safe_get("tcpdump_loghost")); 
		xstart( "tcpdump", "-n", cmdstring, "-w", nvram_safe_get("tcpdump_file") ); 
		return;
	} else if (nvram_match("tcpdump_on","0")) {
		killall("tcpdump", SIGTERM);
		return;
	}
}

void stop_tcpdump(void)
{
	killall("tcpdump", SIGTERM);
	return;
}
