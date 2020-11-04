#include <machine/display.h>
#include <time.h>
#include <synchronizer.h>
#include <process.h>
#include <utility/ostream.h>

using namespace EPOS;

OStream cout;
void func_a()
{
    cout << "aaaaaaaaaaa" <<endl;
}

void func_b(void)
{
    cout << "bbbbbbbbbbb" <<endl;
}

int main()
{
    cout << "Main" << endl;

    cout << "create func_a" << endl;
    Function_Handler handler_a(&func_a);
    Alarm a(2000000, &handler_a, 10);

    cout << "create func_b" << endl;
    Function_Handler handler_b(&func_b);
    Alarm b(1000000, &handler_b, 10);


    Alarm::delay(2000000 * (10 + 2));

    cout << "fiim da main" << endl;
   
    
    return 0;
}

