// EPOS ARMv7 Time-Stamp Counter Mediator Declarations

#ifndef __riscv_tsc_h
#define __riscv_tsc_h

#include <architecture/cpu.h>
#include <architecture/tsc.h>

#define __ic_common_only__
#include <machine/ic.h>
#undef __ic_common_only__


__BEGIN_SYS

class TSC: private TSC_Common
{

    friend class CPU;
    friend class IC;
    
    static volatile Time_Stamp _overflow;
public:
    using TSC_Common::Time_Stamp;
public:
    TSC() {}

    static Hertz frequency() { return CPU::clock(); }
    static PPB accuracy() { return 50; }

    static void init();

    static Time_Stamp time_stamp() {
        Time_Stamp ts(0);
        ASM("nop"); // must be volatile!
        return ts;
    }
    
    static void int_handler(IC_Common::Interrupt_Id int_id) { _overflow++; }

    static void time_stamp(const Time_Stamp & ts) ;
    
};

__END_SYS

#endif
