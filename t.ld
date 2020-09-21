ENTRY(_start)
SECTIONS
{
. = 0x10000; /* loading address */
.text : { ts.o *(.text) }
.data : { *(.data) }
.bss : { *(.bss) }
. = ALIGN(8);
. = . + 0x1000; /* 4kB of SVC stack space */
svc_stack = .;
. = . + 0x1000; /* 4kB of IRQ stack space */
irq_stack = .;
}
