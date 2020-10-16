// EPOS ARMv7 CPU Mediator Implementation

#include <architecture/riscv/riscv_cpu.h>
#include <system.h>

__BEGIN_SYS

// Class attributes
unsigned int CPU::_cpu_clock;
unsigned int CPU::_bus_clock;

// Class methods
void CPU::Context::save() volatile
{
    
}

void CPU::Context::load() const volatile
{

}

// This function assumes A[T]PCS (i.e. "o" is in r0/a0 and "n" is in r1/a1)
void CPU::switch_context(Context ** o, Context * n)
{

}

__END_SYS
