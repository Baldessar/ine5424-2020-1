#include "c/uart.c"
int mult() {
    int a = 1000;
    int b = 3;
    return a*b;
}

int main() {
    uart_init();
    char c = 'c';
    while (true){
        uputc(c);
    }
    return 0;
}