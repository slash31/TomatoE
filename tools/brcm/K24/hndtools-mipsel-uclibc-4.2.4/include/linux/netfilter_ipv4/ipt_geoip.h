/* ipt_geoip.h header file for libipt_geoip.c and ipt_geoip.c
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * Copyright (c) 2004 Cookinglinux
 */
#ifndef _IPT_GEOIP_H
#define _IPT_GEOIP_H

#define IPT_GEOIP_SRC         0x01     /* Perform check on Source IP */
#define IPT_GEOIP_DST         0x02     /* Perform check on Destination IP */
#define IPT_GEOIP_INV         0x04     /* Negate the condition */

#define IPT_GEOIP_MAX         15       /* Maximum of countries */

struct geoip_subnet {
   u_int32_t begin;
   u_int32_t end;
};

struct geoip_info {
   struct geoip_subnet *subnets;
   u_int32_t count;
   u_int32_t ref;
   u_int16_t cc;
   struct geoip_info *next;
   struct geoip_info *prev;
};

struct ipt_geoip_info {
   u_int8_t flags;
   u_int8_t count;
   u_int16_t cc[IPT_GEOIP_MAX];

   /* Used internally by the kernel */
   struct geoip_info *mem[IPT_GEOIP_MAX];
   u_int8_t *refcount;

   /* not implemented yet:
   void *fini;
   */
};

#define COUNTRY(cc) (cc >> 8), (cc & 0x00FF)

#endif

/* End of ipt_geoip.h */
