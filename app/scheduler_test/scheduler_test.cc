#include <utility/ostream.h>
#include <process.h>

using namespace EPOS;

OStream cout;
char buffer[2];

int func(int n)
{
    for (int i = 0; i < n; i++){
        cout << "THread executada pela CPU: " << CPU::id() << endl;
        Thread::yield();
    }
    return 0;
}

int main()
{
    cout << "Teste 2" << endl;

    cout << "Escalonador global e preemptivo" << endl;

    cout << "Cada thread roda 10 vezes, e eventualmente elas preemptam e trocam de cpu" << endl;

    Thread * t1 = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func, 10);
    Thread * t2 = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func, 10);
    Thread * t3 = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func, 10);
    Thread * t4 = new Thread(Thread::Configuration(Thread::READY, Thread::Criterion(10000000)), &func, 10);

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