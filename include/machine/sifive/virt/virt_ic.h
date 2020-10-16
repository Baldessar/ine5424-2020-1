// EPOS Virt (ARM Cortex-M3) IC Mediator Declarations

#ifndef __virt_ic_h
#define __virt_ic_h

#include <machine/ic.h>
#include <system/memory_map.h>

__BEGIN_SYS

class IC_Engine: public IC_Common
{
public:
    // Interrupts
    static const unsigned int INTS = Traits<IC>::INTS;
    static const unsigned int HARD_INT = -1;
    static const unsigned int SOFT_INT = 1;
    enum {
        // INT_SYS_TIMER   = RISCV::EXC_SYSTICK,
        // INT_USER_TIMER0 = HARD_INT + NVIC::IRQ_GPT0A,
        // INT_USER_TIMER1 = HARD_INT + NVIC::IRQ_GPT1A,
        // INT_USER_TIMER2 = HARD_INT + NVIC::IRQ_GPT2A,
        // INT_USER_TIMER3 = HARD_INT + NVIC::IRQ_GPT3A,
        // INT_GPIOA       = HARD_INT + NVIC::IRQ_GPIOA,
        // INT_GPIOB       = HARD_INT + NVIC::IRQ_GPIOB,
        // INT_GPIOC       = HARD_INT + NVIC::IRQ_GPIOC,
        // INT_GPIOD       = HARD_INT + NVIC::IRQ_GPIOD,
        // INT_NIC0_RX     = HARD_INT + NVIC::IRQ_RFTXRX,
        // INT_NIC0_TX     = HARD_INT + NVIC::IRQ_RFTXRX,
        // INT_NIC0_ERR    = HARD_INT + NVIC::IRQ_RFERR,
        // INT_NIC0_TIMER  = HARD_INT + NVIC::IRQ_MACTIMER,
        // INT_USB0        = HARD_INT + NVIC::IRQ_USB,
        // INT_FIRST_HARD  = HARD_INT,
        // INT_LAST_HARD   = HARD_INT + NVIC::IRQS,
        // INT_RESCHEDULER = SOFT_INT,
        // LAST_INT        = INT_RESCHEDULER
    };

public:
    // static void enable() { nvic()->enable(); }
    // static void enable(Interrupt_Id id)  { nvic()->enable(id); }
    // static void disable() { nvic()->disable(); }
    // static void disable(Interrupt_Id id) { nvic()->disable(); }

    // Only works in handler mode (inside IC::entry())
    static Interrupt_Id int_id() { return 1; }
    // static Interrupt_Id irq2int(Interrupt_Id id) { return nvic()->irq2int(id); }
    // static Interrupt_Id int2irq(Interrupt_Id irq) { return nvic()->int2irq(irq); }

    static void ipi(unsigned int cpu, Interrupt_Id id) {} // NVIC is always single-core

    static void init() ;

private:
    // static NVIC * nvic() { return reinterpret_cast<NVIC *>(Memory_Map::SCB_BASE); }
};

__END_SYS

#endif
