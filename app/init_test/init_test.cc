#include <machine/display.h>
#include <time.h>
#include <synchronizer.h>
#include <process.h>
#include <utility/ostream.h>

using namespace EPOS;

OStream cout;


int main()
{
    cout << "Interruption test" << endl;

    Alarm::delay(1000000);

    cout << "-" << endl;
    cout << "-" << endl;
    cout << "-" << endl;
    cout << "-" << endl;
    cout << "-" << endl;
    cout << "Esse teste 'e para o tratamento das interrupcoes de timer e esta funcionando com a trait INFO ligada para mostrar as interrupcoes" << endl;
    cout << "-" << endl;
    cout << "-" << endl;
    cout << "-" << endl;
    cout << "-" << endl;
    cout << "-" << endl;
    cout << "-" << endl;

    return 0;
}

