// EPOS RISC-V UART Mediator Declarations

#ifndef __riscv_uart_h
#define __riscv_uart_h

#include <architecture/cpu.h>
#include <machine/uart.h>
#include __HEADER_MMOD(uart)

__BEGIN_SYS

class UART: private UART_Engine
{
private:
    static const unsigned int UNIT = Traits<UART>::DEF_UNIT;
    static const unsigned int BAUD_RATE = Traits<UART>::DEF_BAUD_RATE;
    static const unsigned int DATA_BITS = Traits<UART>::DEF_DATA_BITS;
    static const unsigned int PARITY = Traits<UART>::DEF_PARITY;
    static const unsigned int STOP_BITS = Traits<UART>::DEF_STOP_BITS;

    typedef UART_Engine Engine;

public:
    using UART_Common::NONE;
    using UART_Common::EVEN;
    using UART_Common::ODD;

public:
    UART(unsigned int unit = UNIT, unsigned int baud_rate = BAUD_RATE, unsigned int data_bits = DATA_BITS, unsigned int parity = PARITY, unsigned int stop_bits = STOP_BITS)
    : Engine(unit, baud_rate, data_bits, parity, stop_bits) {}

    using Engine::config;

    char get() { while(!rxd_ok()); return rxd(); }
    void put(char c) { while(!txd_ok()); txd(c); }

    bool ready_to_get() { return rxd_ok(); }
    bool ready_to_put() { return txd_ok(); }

    using Engine::int_enable;
    using Engine::int_disable;

    using Engine::power;

private:
    using Engine::init;
};

__END_SYS

#endif