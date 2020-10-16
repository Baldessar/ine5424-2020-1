// EPOS LM3S811 (ARM Cortex-M3) SETUP

#include <system/config.h>

extern "C" { void _vector_table() __attribute__ ((used, naked, section(".init"))); }

// Interrupt Vector Table
void _vector_table()
{
    // LSB must be 1 in thumb mode, so add 1 to all symbols
    ASM("nop");
}
