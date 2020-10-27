// EPOS RISC-V 32 CPU Mediator Implementation

#include <architecture/rv32/rv32_cpu.h>
#include <system.h>

__BEGIN_SYS

// Class attributes
unsigned int CPU::_cpu_clock;
unsigned int CPU::_bus_clock;

// Class methods
void CPU::Context::save() volatile
{ASM("c_save:                                                                               \n"
        "       .set NUM_GP_REGS, 32                                                        \n"
        "       .set REG_SIZE, 4                                                            \n"
        "       .altmacro                                                                   \n"
        "       .macro save_gp i, basereg=t6                                                \n"
        "           sw x\\i, ((\\i)*REG_SIZE)(\\basereg)                                    \n"
        "       .endm                                                                       \n"
        "       .macro save_fp i, basereg=t6                                                \n"
        "           fsw f\\i, ((NUM_GP_REGS+(\\i))*REG_SIZE)(\\basereg)                     \n"
        "       .endm                                                                       \n"
        "       csrrw t6, mscratch, t6                                                      \n"
        "       .set i, 0                                                                   \n"
        "       .rept 31                                                                    \n"
        "           save_gp %i                                                              \n"
        "           .set i, i+1                                                             \n"
        "       .endr                                                                       \n"
        "       mv t5, t6                                                                   \n"
        "       csrr t6, mscratch                                                           \n"
        "       save_gp 31, t5                                                              \n" 
        "       csrw mscratch, t5                                                           \n"
        "                                                                                   \n"
        "       csrr t1, mstatus                                                            \n"
        "       srli t0, t1, 13                                                             \n"
        "       andi t0, t0, 3                                                              \n"
        "       li t3, 3                                                                    \n"
        "       bne t0, t3, 1f                                                              \n"
        "                                                                                   \n"
        "       .set i, 0                                                                   \n"
        "       .rept 32                                                                    \n"
        "           save_fp %i, t5                                                          \n"
        "           .set i, i+1                                                             \n"
        "       .endr                                                                       \n"
        " 1:                                                                                \n"
        "                                                                                   \n");
}

void CPU::Context::load() const volatile
{
<<<<<<< HEAD
    ASM("c_load:                                                                               \n"
        "       .set NUM_GP_REGS, 32                                                        \n"
        "       .set REG_SIZE, 4                                                            \n"
        "       .altmacro                                                                   \n"
        "       .macro load_gp i, basereg=t6                                                \n"
        "           lw x\\i, ((\\i)*REG_SIZE)(\\basereg)                                    \n"
        "       .endm                                                                       \n"
        "       .macro load_fp i, basereg=t6                                                \n"
        "           flw f\\i, ((NUM_GP_REGS+(\\i))*REG_SIZE)(\\basereg)                     \n"
        "       .endm                                                                       \n"
        "       csrr t1, mstatus                                                            \n"
        "       srli t0, t1, 13                                                             \n"
        "       andi t0, t0, 3                                                              \n"
        "       li t3, 3                                                                    \n"
        "       bne t0, t3, 1f                                                              \n"
        "       .set i, 0                                                                   \n"
        "       .rept 32                                                                    \n"
        "           load_fp %i                                                              \n"
        "           .set i, i+1                                                             \n"
        "       .endr                                                                       \n"
        "1:                                                                                 \n"
        "       .set i, 1                                                                   \n"
        "       .rept 31                                                                    \n"
        "           load_gp %i                                                              \n"
        "           .set i, i+1                                                             \n"
        "       .endr                                                                       \n"
        "                                                                                   \n"
        "                                                                                   \n");
    // implement
=======
    System::_heap->free(reinterpret_cast<void *> (Memory_Map::SYS_STACK), Traits<System>::STACK_SIZE);
    ASM("c_load:                                \n"
        "       mv    sp, %0                    \n"
        "       addi  sp, sp, 116               \n" : : "r"(this));

    ASM("       lw    x5,    -8(sp)             \n"
        "       lw    x6,   -12(sp)             \n"
        "       lw    x7,   -16(sp)             \n"
        "       lw    x8,   -20(sp)             \n"
        "       lw    x9,   -24(sp)             \n"
        "       lw    x10,  -28(sp)             \n"
        "       lw    x11,  -32(sp)             \n"
        "       lw    x12,  -36(sp)             \n"
        "       lw    x13,  -40(sp)             \n"
        "       lw    x14,  -44(sp)             \n"
        "       lw    x15,  -48(sp)             \n"
        "       lw    x16,  -52(sp)             \n"
        "       lw    x17,  -56(sp)             \n"
        "       lw    x18,  -60(sp)             \n"
        "       lw    x19,  -64(sp)             \n"
        "       lw    x20,  -68(sp)             \n"
        "       lw    x21,  -72(sp)             \n"
        "       lw    x22,  -76(sp)             \n"
        "       lw    x23,  -80(sp)             \n"
        "       lw    x24,  -84(sp)             \n"
        "       lw    x25,  -88(sp)             \n"
        "       lw    x26,  -92(sp)             \n"
        "       lw    x27,  -96(sp)             \n"
        "       lw    x28, -100(sp)             \n"
        "       lw    x29, -104(sp)             \n"
        "       lw    x30, -108(sp)             \n"
        "       lw    x31, -112(sp)             \n"
        "       lw    x1,  -116(sp)             \n"
        "       lw    x31,   -4(sp)             \n");
    ASM("       jalr   x0,    (x31)               \n");
>>>>>>> 3e6f3e867eb95402cdbe9aed855c70ba8569d5fa
}

void CPU::switch_context(Context ** o, Context * n)
{
    ASM(" sw     x31,   -8(sp)          \n"  // push x31 into stack to use as temp register
		" la     x31,   .ret            \n"  // get return address
		" sw     x31,   -4(sp)          \n"  // push return address as PC
		" lw     x31,   -8(sp)          \n"  // pop x31
		" sw      x5,   -8(sp)          \n"  // push x5-x31
		" sw      x6,  -12(sp)          \n"
		" sw      x7,  -16(sp)          \n"
		" sw      x8,  -20(sp)          \n"
		" sw      x9,  -24(sp)          \n"
		" sw     x10,  -28(sp)          \n"
		" sw     x11,  -32(sp)          \n"
		" sw     x12,  -36(sp)          \n"
		" sw     x13,  -40(sp)          \n"
		" sw     x14,  -44(sp)          \n"
		" sw     x15,  -48(sp)          \n"
		" sw     x16,  -52(sp)          \n"
		" sw     x17,  -56(sp)          \n"
		" sw     x18,  -60(sp)          \n"
		" sw     x19,  -64(sp)          \n"
		" sw     x20,  -68(sp)          \n"
		" sw     x21,  -72(sp)          \n"
		" sw     x22,  -76(sp)          \n"
		" sw     x23,  -80(sp)          \n"
		" sw     x24,  -84(sp)          \n"
		" sw     x25,  -88(sp)          \n"
		" sw     x26,  -92(sp)          \n"
		" sw     x27,  -96(sp)          \n"
		" sw     x28, -100(sp)          \n"
		" sw     x29, -104(sp)          \n"
		" sw     x30, -108(sp)          \n"
		" sw     x31, -112(sp)          \n"
		" sw      x1, -116(sp)          \n"  // push lr
		" addi    sp, sp, -116          \n"  // adjusts SP
		" sw      sp, 0(a0)             \n"  // updates the saved context in a0
	   );

	ASM("      mv      sp,  a1          \n"  // gets the context to be loaded into SP
		"      addi    sp,  sp, 116     \n"  // adjusts stack pointer
		"      lw      x5,   -8(sp)     \n"  // pop x5-x31
		"      lw      x6,  -12(sp)     \n"
		"      lw      x7,  -16(sp)     \n"
		"      lw      x8,  -20(sp)     \n"
		"      lw      x9,  -24(sp)     \n"
		"      lw     x10,  -28(sp)     \n"
		"      lw     x11,  -32(sp)     \n"
		"      lw     x12,  -36(sp)     \n"
		"      lw     x13,  -40(sp)     \n"
		"      lw     x14,  -44(sp)     \n"
		"      lw     x15,  -48(sp)     \n"
		"      lw     x16,  -52(sp)     \n"
		"      lw     x17,  -56(sp)     \n"
		"      lw     x18,  -60(sp)     \n"
		"      lw     x19,  -64(sp)     \n"
		"      lw     x20,  -68(sp)     \n"
		"      lw     x21,  -72(sp)     \n"
		"      lw     x22,  -76(sp)     \n"
		"      lw     x23,  -80(sp)     \n"
		"      lw     x24,  -84(sp)     \n"
		"      lw     x25,  -88(sp)     \n"
		"      lw     x26,  -92(sp)     \n"
		"      lw     x27,  -96(sp)     \n"
		"      lw     x28, -100(sp)     \n"
		"      lw     x29, -104(sp)     \n"
		"      lw     x30, -108(sp)     \n"
		"      lw     x31, -112(sp)     \n"
		"      lw      x1, -116(sp)     \n"  // pop LR
		"      lw     x31,   -4(sp)     \n"  // pop PC
		"      jalr    x0,    (x31)     \n"  // return for the thread entering the CPU
		".ret: jalr    x0,     (x1)     \n"  // return for the thread leaving the CPU
	   );
}

__END_SYS
