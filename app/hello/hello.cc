#include <utility/ostream.h>
#include <process.h>

using namespace EPOS;

OStream cout;

int main()
{
    cout << "Hello world!" << endl;
    int x = 1;
    cout << "Int: " << x << endl;
    char c = 'a';
    cout << "Char: " << c << endl;
    return 0;
}
