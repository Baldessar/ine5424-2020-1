# boot.s
# bootloader

.option norvc
.section .data
.global TOTAL_NUM_HARTS
TOTAL_NUM_HARTS: .byte 1

.section .text.init
.global _start
_start:
	csrr t0, mhartid # reading CSR mhartid
	bnez t0, 3f
	csrw satp, zero # seta supervisor address translation and protection register to 0. MMU related

1:

2:

3:

4:
	wfi
	j 4b
