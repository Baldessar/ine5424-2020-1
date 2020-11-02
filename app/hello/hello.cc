#include <machine/display.h>
#include <time.h>
#include <synchronizer.h>
#include <process.h>
#include <utility/ostream.h>

using namespace EPOS;

OStream cout;
int worker(int delay){
    int counter = 0;
    while(counter < 3){

        cout << "Thread 1 => Working\n";

            
        Delay working(delay);
        counter++;
    }
    cout << "Thread 1 => Finished\n";

    return 0;
}

int worker2(int delay){
    int counter = 0;
    while(counter < 3){

        cout << "Thread 2 => Working\n";

            
        Delay working(delay);
        counter++;
    }
    cout << "Thread 2 => Finished\n";

    return 0;
}

int worker3(int delay){
    int counter = 0;
    while(counter < 3){

        cout << "Thread 3 => Working\n";

            
        Delay working(delay);
        counter++;
    }
    cout << "Thread 3 => Finished\n";

    return 0;
}

const int iterations = 10;

void func_a(void);
void func_b(void);

int main()
{
    cout << "Alarm test" << endl;

    cout << "I'm the first thread of the first task created in the system." << endl;
    cout << "I'll now create two alarms and put myself in a delay ..." << endl;

    Function_Handler handler_a(&func_a);
    Alarm alarm_a(2000000, &handler_a, iterations);

    Function_Handler handler_b(&func_b);
    Alarm alarm_b(1000000, &handler_b, iterations);

    // Note that in case of idle-waiting, this thread will go into suspend
    // and the alarm handlers above will trigger the functions in the context
    // of the idle thread!
    Alarm::delay(2000000 * (iterations + 2));

    cout << "I'm done, bye!" << endl;



    cout << "Hello world!" << endl;
    Thread* t1 = new Thread(&worker, 2000);
    Thread* t2 = new Thread(&worker2, 1000000);
    Thread* t3 = new Thread(&worker3, 50000);    
    
    return 0;
}

void func_a()
{
    for(int i = 0; i < 79; i++)
        cout << "a";
    cout << endl;
}

void func_b(void)
{
    for(int i = 0; i < 79; i++)
        cout << "b";
    cout << endl;
}