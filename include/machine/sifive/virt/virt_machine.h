// EPOS Virt (ARM Cortex-M3) Mediator Declarations

#ifndef __virt_machine_h
#define __virt_machine_h

#include <machine/machine.h>
#include <system/memory_map.h>
#include <system.h>

__BEGIN_SYS

class Virt: public Machine_Common
{
    friend Machine;

private:
    typedef CPU::Reg32 Reg32;
    typedef CPU::Log_Addr Log_Addr;

public:
    Virt() {}

    static void delay(const Microsecond & time) {
        assert(Traits<TSC>::enabled);
        TSC::Time_Stamp end = TSC::time_stamp() + time * (TSC::frequency() / 1000000);
        while(end > TSC::time_stamp());
    }

    static void reboot();
    static void poweroff() { reboot(); }

    static const UUID & uuid() { return System::info()->bm.uuid; } // TODO: System_Info is not populated in this machine

    static void smp_barrier() {}

    static void smp_barrier_init(unsigned int n_cpus) { assert(n_cpus == 1); }

    static void power(const Power_Mode & mode) {}
    
private:
    static void pre_init();
    static void init();

private:
    // static SCB * scb() { return reinterpret_cast<SCB *>(Memory_Map::SCB_BASE); }
    // static SysCtrl * scr() { return reinterpret_cast<SysCtrl *>(Memory_Map::SCR_BASE); }
};

typedef Virt Machine_Model;

__END_SYS

#endif
