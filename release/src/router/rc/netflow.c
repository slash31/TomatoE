/*
 * netflow.c
 *
 * Copyright (C) 2013 Aaron Finney
 *
 */
#include <rc.h>
#include <sys/stat.h>

void start_netflow(void)
{
	if( nvram_match("nflow_enable", "1" ))
    	{
		modprobe("ipt_ULOG");
    		xstart( "fprobe-ulog", "-n", nvram_safe_get("nflow_ver"), "-a",nvram_safe_get("nflow_saddr"),nvram_safe_get("nflow_args"), nvram_safe_get("nflow_dst") );
    	}

	return;
}

void stop_netflow(void)
{
killall("fprobe-ulog", SIGTERM);
return;
}
