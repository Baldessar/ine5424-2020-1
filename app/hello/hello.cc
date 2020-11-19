#include <utility/ostream.h>
#include <process.h>

using namespace EPOS;

OStream cout;
char buffer[2];

int func(int n)
{
    bool enable_0 = true;
    bool enable_1 = true;
    bool enable_2 = true;
    bool enable_3 = true;
    for(;;)
    {
        int j = 5;
        if (CPU::id() == 0 && enable_0)
        {
            cout << "0 ";
            enable_0 = false;
            CPU::smp_barrier();
            return 0;
        }
        if (CPU::id() == 1 && enable_1)
        {
            cout << "1 ";
            enable_1 = false;
            CPU::smp_barrier();
            return 0;
        }
        if (CPU::id() == 2 && enable_2)
        {
            cout << "2 ";
            enable_2 = false;
            CPU::smp_barrier();
            return 0;
        }
        if (CPU::id() == 3 && enable_3)
        {
            cout << "3 ";
            enable_3 = false;
            CPU::smp_barrier();
            return 0;
        }
        j = j*j;
        Thread::yield();
        if (! (enable_0 && enable_1 && enable_2 && enable_3))
            break;
    }
    return 0;
}

int main()
{
    cout << "Teste 1" << endl;

    cout << "Inicializacao do sistema e dos cores, e uso das barriers" << endl;

    cout << "Esse teste cria quatro threads" << endl;

    Thread * t1 = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func, 1);
    Thread * t2 = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func, 2);
    Thread * t3 = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func, 3);
    Thread * t4 = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func, 4);

    cout << endl;
    t1->join();
    t2->join();
    t3->join();
    t4->join();
    cout << "The end!" << endl;

    delete t1;
    delete t2;
    delete t3;
    delete t4;

    return 0;
}