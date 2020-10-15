#ifndef CACHE
#define CACHE
#include <stdint.h>
#include "barrier.h"
/* Register offsets */
#define L2_CACHE_CONFIG	0x000
#define L2_CACHE_ENABLE	0x008
#define L2_LIM_BASE 0x2010000
#define readl(a) (*(unsigned int*)(a))

#define MASK_NUM_WAYS	0xff00 
#define NUM_WAYS_SHIFT	8


int cache_enable_ways(void)
{
	unsigned int base;
	unsigned int config;
	unsigned int ways;

	volatile unsigned int *enable;

	base = L2_LIM_BASE;

	// config = readl((unsigned int *)base + L2_CACHE_CONFIG);
    config = 0x400;
	ways = (config & MASK_NUM_WAYS) >> NUM_WAYS_SHIFT;

	enable = (volatile unsigned int *)(base + L2_CACHE_ENABLE);
    mb();
	(*enable) = ways - 1;
    mb();
	return 0;
}

#endif