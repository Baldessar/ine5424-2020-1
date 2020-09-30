#include "c/uart.c"

int mult() {
    int a = 1000;
    int b = 3;
    return a*b;
}

int main() {
    uart_init();
    char * joao = "AAAAA" ;
    uprints(joao);
    return 0;
}
