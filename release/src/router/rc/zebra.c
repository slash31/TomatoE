//
// zebra.c
//
// Quagga zebra daemon service written by Aaron Finney, 2013
//

#include <rc.h>
#include <sys/stat.h>

void start_zebra(void)
{
	FILE *fp;

	//  only run zebra if one of the dynamic routing protocols are enabled
	if( nvram_match( "drr_enable", "1" ) || nvram_match( "dro_enable","1" ) )
    	{

	// create the config file
	if( !( fp = fopen( "/etc/zebra.conf", "w" ) ) )
	{
		perror( "/etc/zebra.conf" );
		return;
	}
	if (strlen(nvram_safe_get("lan_hostname")) != 0)
		fprintf(fp,"hostname %s\n", nvram_safe_get("lan_hostname"));
	if (strlen(nvram_safe_get("dro_pwd")) != 0)
	{
		fprintf(fp, "password %s\n", nvram_safe_get( "dro_pwd" ) );
	} else if (strlen(nvram_safe_get("drr_pwd")) != 0) {
		fprintf(fp, "password %s\n", nvram_safe_get( "drr_pwd" ) );
	}		 
	if (nvram_match( "drz_log", "1"))
		fprintf(fp, "log syslog");

	fclose( fp );

	chmod( "/etc/zebra.conf", 0644 );

	xstart( "zebra", "-d");

	}

	return;
}

void stop_zebra(void)
{
	killall("zebra", SIGTERM);
	unlink("/etc/zebra.conf");
	return;
}
