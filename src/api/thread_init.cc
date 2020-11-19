// EPOS Thread Initialization

#include <machine/timer.h>
#include <machine/ic.h>
#include <system.h>
#include <process.h>

__BEGIN_SYS

extern "C" { void __epos_app_entry(); }

void Thread::init()
{    
    db<Init, Thread>(TRC) << "Thread::init()" << endl;

    CPU::smp_barrier(); // 3/4
    if(CPU::id() == 0){
        //create thread for main
        new (SYSTEM) Thread(Thread::Configuration(Thread::RUNNING, Thread::MAIN), reinterpret_cast<int (*)()>(__epos_app_entry));
    }
    CPU::smp_barrier(); // 4/5
    // Idle thread creation does not cause rescheduling (see Thread::constructor_epilogue)
    new (SYSTEM) Thread(Thread::Configuration(Thread::READY, Thread::IDLE), &Thread::idle);
    
    CPU::smp_barrier();//5/6

    // The installation of the scheduler timer handler does not need to be done after the
    // creation of threads, since the constructor won't call reschedule() which won't call
    // dispatch that could call timer->reset()
    // Letting reschedule() happen during thread creation is also harmless, since MAIN is
    // created first and dispatch won't replace it nor by itself neither by IDLE (which
    // has a lower priority)
    if(Criterion::timed)
        _timer = new (SYSTEM) Scheduler_Timer(QUANTUM, time_slicer);


    // Transition from CPU-based locking to thread-based locking
    This_Thread::not_booting();

}

__END_SYS
