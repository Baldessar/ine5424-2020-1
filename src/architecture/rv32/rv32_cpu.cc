// EPOS RISC-V 32 CPU Mediator Implementation

#include <architecture/rv32/rv32_cpu.h>
#include <system.h>

__BEGIN_SYS

// Class attributes
unsigned int CPU::_cpu_clock;
unsigned int CPU::_bus_clock;

// Class methods
void CPU::Context::save() volatile
{ASM("c_save:                                \n"
        "       .set NUM_GP_REGS, 32                     \n"
        "       .set REG_SIZE, 8                     \n"
        "       .altmacro                   \n"
        "       .macro save_gp i, basereg=t6                   \n"
        "           sw x\\i, ((\\i)*REG_SIZE)(\\basereg)                     \n"
        "       .endm                    \n"
        "       .macro save_fp i, basereg=t6                   \n"
        "           fsw x\\i, ((NUM_GP_REGS+(\\i))*REG_SIZE)(\\basereg)                     \n"
        "       .endm                    \n"
        "       csrrw t6, mscratch, t6                      \n"
        "       .set i, 0                      \n"
        "       .rept 31                      \n"
        "           save_gp %i                      \n"
        "           set i, i+1                     \n"
        "       .endr                      \n"
        "       mv t5, t6                      \n"
        "       csrr t6, mscratch                      \n"
        "       save_gp 31, t5                      \n" 
        "       csrw mscratch, t5                    \n"
        "                             \n"
        "       csrr t1, mstatus                      \n"
        "       srli t0, t1, 13                      \n"
        "       andi t0, t0, 3                     \n"
        "       li t3, 3                     \n"
        "       bne t0, t3, 1f                      \n"
        "                             \n"
        "       .set i, 0                     \n"
        "       .rept 32                     \n"
        "           save_fp %i, t5                   \n"
        "           .set i, i+1                     \n"
        "       .endr                     \n"
        " 1:                            \n"
        "                             \n");
}

void CPU::Context::load() const volatile
{
    ASM("c_load:                                \n"
        "       j   c_load                      \n");
    // implement
}

void CPU::switch_context(Context ** o, Context * n)
{
    ASM("c_switch:                              \n"
        "       j   c_switch                    \n");
    // implement
}

__END_SYS
