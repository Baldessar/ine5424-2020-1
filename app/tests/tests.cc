// EPOS Semaphore Component Test Program

#include <machine/display.h>
#include <time.h>
#include <synchronizer.h>
#include <process.h>

using namespace EPOS;

const int iterations = 10;


Thread * phil[2];

OStream cout;

int philosopher(int n, int l, int c);

int main()
{
    cout << "The Philosopher's Dinner:" << endl;


    phil[0] = new Thread(&philosopher, 0,  5, 32);
    phil[1] = new Thread(&philosopher, 1, 10, 44);


    cout << "The Philosopher's Dinner2:" << endl;
    for(int i = 0; i < 2; i++) {
        int ret = phil[i]->join();
    }
    cout << "The end!" << endl;

    return 0;
}

int philosopher(int n, int l, int c)
{
     cout << "The end!" << n << endl;

    
    return n;
}
