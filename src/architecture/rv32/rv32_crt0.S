// EPOS RISC-V Program Starter

        .file "rv32_crt0.S"
        // Entry point called by SETUP for processors
        .section .text
        .align  4
        .global _exception_handling
        .type   _exception_handling, function
_exception_handling:
li      t0, (0b11 << 11) | (0 << 7) | (0 << 3)
	csrw    mstatus, t0  
	
	sw      x31, -120(sp)            
    sw      x31,   -4(sp)            
    lw      x31, -120(sp)        
    sw       x5,   -8(sp)         
    sw       x6,  -12(sp)       
    sw       x7,  -16(sp)       
    sw       x8,  -20(sp)       
    sw       x9,  -24(sp)       
    sw      x10,  -28(sp)       
    sw      x11,  -32(sp)       
    sw      x12,  -36(sp)       
    sw      x13,  -40(sp)       
    sw      x14,  -44(sp)       
    sw      x15,  -48(sp)       
    sw      x16,  -52(sp)       
    sw      x17,  -56(sp)       
    sw      x18,  -60(sp)       
    sw      x19,  -64(sp)       
    sw      x20,  -68(sp)       
    sw      x21,  -72(sp)       
    sw      x22,  -76(sp)       
    sw      x23,  -80(sp)       
    sw      x24,  -84(sp)       
    sw      x25,  -88(sp)       
    sw      x26,  -92(sp)       
    sw      x27,  -96(sp)       
    sw      x28, -100(sp)       
    sw      x29, -104(sp)       
    sw      x30, -108(sp)       
    sw      x31, -112(sp)       
    sw       ra, -116(sp)          
	addi     sp, sp, -120


	# Set arguments and call m_trap
	csrr	a0, mepc     # Machine exception pc

    sw       ra, -120(sp)          
	
	csrr	a1, mtval    # Machine bad address or instruction
	csrr	a2, mcause   # Machine trap cause
	csrr	a3, mhartid  # Machine hart id
	csrr	a4, mstatus  # Machine status
	csrr	a5, mscratch # Scratch resgister for machine trap handlers
	call	m_trap

	addi    sp,  sp, 116      
	lw      x5,    -8(sp)    
	lw      x6,   -12(sp)     
	lw      x7,   -16(sp)     
	lw      x8,   -20(sp)     
	lw      x9,   -24(sp)     
	lw      x10,  -28(sp)     
	lw      x11,  -32(sp)     
	lw      x12,  -36(sp)     
	lw      x13,  -40(sp)     
	lw      x14,  -44(sp)     
	lw      x15,  -48(sp)     
	lw      x16,  -52(sp)     
	lw      x17,  -56(sp)     
	lw      x18,  -60(sp)     
	lw      x19,  -64(sp)     
	lw      x20,  -68(sp)     
	lw      x21,  -72(sp)     
	lw      x22,  -76(sp)     
	lw      x23,  -80(sp)     
	lw      x24,  -84(sp)     
	lw      x25,  -88(sp)     
	lw      x26,  -92(sp)     
	lw      x27,  -96(sp)     
	lw      x28, -100(sp)     
	lw      x29, -104(sp)     
	lw      x30, -108(sp)     
	lw      x31, -112(sp)     
	lw       ra, -116(sp)         
	lw      x31,   -4(sp)       

	csrw	mepc, a0
	
	li      t0, (0b11 << 11) | (0 << 7) | (0 << 3)
	csrw    mstatus, t0  


	mret
        // Entry point called by SETUP for processors
        .section .text
        .align  4
        .global _start
        .type   _start, function
_start:
        // Temporary stack(s) for INIT are created and configure by SETUP

        // Only hart (core) 0 cleans cache
        // IMPLEMENT

        // Set all bytes in the BSS section to zero.
        la      a0, __bss_start
        la      a1, _end
        bgeu    a0, a1, 2f
1:
        sw      zero, (a0)
        addi    a0, a0, 4
        bltu    a0, a1, 1b
2:
        // Call _init
        call      _init

        // Call main
        .align  4
        .globl  __epos_app_entry
        .type   __epos_app_entry, function
__epos_app_entry:
        call      main
        lw        a0, 0(sp)         // save main's return value to be used by exit()
        call      _fini
        call      _exit
