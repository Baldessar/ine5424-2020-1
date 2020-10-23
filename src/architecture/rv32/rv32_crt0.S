# EPOS RISC-V Program Starter

        .file "rv32_crt0.S"

        .section .text
        .align  4
        .global _start
        .type   _start, function
_start:
        csrr t0, mhartid # reading CSR mhartid
	bnez t0, 4f
        csrw satp, zero  # SATP should be zero, but let's make sure


        la a0, __bss_start
	la a1, __BSS_END__
	bgeu a0, a1, 2f
1:
        sw	zero, (a0)
	addi	a0, a0, 8
	bltu	a0, a1, 1b

2:
        # Set all bytes in the BSS section to zero.
        # la sp, _stack_end
        la t2, _vector_table
        la t1, _init

        csrw	mepc, t1
        csrw mtvec, t2
        la	ra, 4f
        # implement

        # Call _init
        mret

        # Call main
        .align  4
        .globl  __epos_app_entry
        .type   __epos_app_entry, function
4:
        wfi
	j 4b
__epos_app_entry:
        call      main
        lw        a0, 0(sp)         #save main's return value to be used by exit()
        call      _fini
        call      _exit
