// EPOS Virt (ARM Cortex-M3) UART Mediator Declarations

#ifndef __virt_uart_h
#define __virt_uart_h

#include <machine/uart.h>
#include <system/memory_map.h>

__BEGIN_SYS

class UART_Engine: public UART_Common
{
private:
    static const unsigned int UNITS = Traits<UART>::UNITS;

public:
    UART_Engine(unsigned int unit, unsigned int baud_rate, unsigned int data_bits, unsigned int parity, unsigned int stop_bits);
    void config(unsigned int baud_rate, unsigned int data_bits, unsigned int parity, unsigned int stop_bits) ;
    void config(unsigned int * baud_rate, unsigned int * data_bits, unsigned int * parity, unsigned int * stop_bits);
    char rxd();
    void txd(char c);

    bool rxd_ok();
    bool txd_ok();

    bool rxd_full();
    bool txd_empty();

    void int_enable(bool receive = true, bool transmit = true, bool line = true, bool modem = true) ;
    void int_disable(bool receive = true, bool transmit = true, bool line = true, bool modem = true) ;
    void reset();
    void loopback(bool flag);

    void power(const Power_Mode & mode) {}

    static void init() {}

private:
    unsigned int _unit;
};

__END_SYS

#endif
