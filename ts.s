.code 32
.section   StringCopy, "ax"
.balign    4

    .global    mystrcopy, _start, enable_scu
_start:
// get CPU ID and keep it in R11
MRC p15, 0, r11, c0, c0, 5 // read CPU ID register into R11
AND r11, r11, #0x03 // mask in only CPUID
// set SVC stack
LDR r0, =svc_stack // r0->svc_stack (16KB area in t.ld)
mov r1, r11 // r1 = cpuid
add r1, r1, #1 // cpuid++
lsl r2, r1, #12 // (cpuid+1)* 4096
add r0, r0, r2
mov sp, r0 // SVC sp=svc_stack[cpuid] high end
// go in IRQ mode with interrupts OFF
MSR cpsr, #0x92
// set IRQ stack
LDR r0, =irq_stack // r0->irq_stack (16KB area in t.ld)
mov r1, r11
add r1, r1, #1
lsl r2, r1, #12 // (cpuid+1) * 4096
add r0, r0, r2
mov sp, r0 // IRQ sp=irq_stack[cpuid] high end
// go back to SVC mode with IRQ ON
MSR cpsr, #0x13
cmp r11, #0
BL main // CPU0 call main() in C
B .

.type      mystrcopy, "function"
mystrcopy:
    ldrb       r2, [r1], #1
    strb       r2, [r0], #1
    cmp        r2, #0
    bne        mystrcopy
    bx         lr

