#include <stdio.h>
#include "uart.c"
#include "defines.h"

const char *source = "String to copy.";
char *dest;
extern void mystrcopy(char *dest, const char *source);


int main(void) {
uart_init(); // initialize UARTs
uprintf("CPU0 started\n");
uprintf("CPU0 WFI loop: press any key from UART\n");

}