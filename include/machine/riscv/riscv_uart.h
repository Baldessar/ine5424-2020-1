// EPOS RISC-V UART Mediator Declarations

#ifndef __riscv_uart_h
#define __riscv_uart_h

#include <architecture/cpu.h>
#include <machine/uart.h>
#include <system/memory_map.h>

__BEGIN_SYS

class UART: private UART_Common
{
private:

    typedef CPU::Reg8 Reg8;
    typedef CPU::Reg32 Reg32;

    static const unsigned int UNIT = Traits<UART>::DEF_UNIT;
    static const unsigned int BAUD_RATE = Traits<UART>::DEF_BAUD_RATE;
    static const unsigned int DATA_BITS = Traits<UART>::DEF_DATA_BITS;
    static const unsigned int PARITY = Traits<UART>::DEF_PARITY;
    static const unsigned int STOP_BITS = Traits<UART>::DEF_STOP_BITS;

    // typedef UART_Engine Engine;

    // uart offsets
    // https://github.com/riscv/riscv-pk/blob/master/machine/uart16550.c
    // https://www.xilinx.com/support/documentation/ip_documentation/axi_uart16550/v2_0/pg143-axi-uart16550.pdf
    // Peguei aqui, deem uma conferida se funciona certo
    enum {
        UART_REG                = 0x00,
        UART_REG_STATUS_RX      = 0x01,
        UART_REG_STATUS_TX      = 0x20,
        UART_LINE_STATUS        = 0x14,
        UART_FIFO_CONTROL       = 0x08, // não sei se usaremos
        UART_LINE_CONTROL       = 0x0C, // não sei se usaremos 
        UART_MODEM_STATUS       = 0x18, // usar no txd_ok, rxd_ok, etc
        UART_MODEM_CONTROL      = 0x10 
        
    };

    // uart useful bits
    enum {

        // receive fifo empty bit
        RXFE                    = 16,  // 00010000
        // receive fifo full bit
        RXFF                    = 64,  // 01000000
        // transmit fifo empty bit
        TXFE                    = 128, // 10000000
        // transmit fifo full bit
        TXFF                    = 32,  // 00100000
        // busy transmiting data bit
        BUSY                    = 8,   // 00001000
             

    };

    enum {
        UART_BASE       = Memory_Map::UART_BASE,
        UART_BUFFER     = UART_BASE
    };

public:
    using UART_Common::NONE;
    using UART_Common::EVEN;
    using UART_Common::ODD;

public:
    UART(unsigned int unit = UNIT, unsigned int baud_rate = BAUD_RATE, unsigned int data_bits = DATA_BITS, unsigned int parity = PARITY, unsigned int stop_bits = STOP_BITS) 
    {
        config(baud_rate, data_bits, parity, stop_bits);
    }

    void config(unsigned int baud_rate, unsigned int data_bits, unsigned int parity, unsigned int stop_bits)
    {
        // Implement
    }

    void config(unsigned int * baud_rate, unsigned int * data_bits, unsigned int * parity, unsigned int * stop_bits) {}

    Reg8 rxd() { 
        volatile Reg8 *ch = reinterpret_cast<Reg8 *>(UART_BUFFER);
        return ch[UART_REG];
    }

    // transmit data
    void txd(Reg8 c) { 
        volatile Reg8 *ch = reinterpret_cast<Reg8 *>(UART_BUFFER);
        ch[UART_REG] = c;
    }

    bool rxd_ok() { 
        Reg8 *uart = reinterpret_cast<Reg8 *>(UART_BUFFER);
        return !(uart[UART_MODEM_STATUS] & RXFE);
    }

    bool txd_ok() {
        Reg8 *uart = reinterpret_cast<Reg8 *>(UART_BUFFER);
        return !(uart[UART_LINE_STATUS] & TXFF);
    }

    bool rxd_full() { 
        Reg8 *uart = reinterpret_cast<Reg8 *>(UART_BUFFER);
        return (uart[UART_MODEM_STATUS] & RXFF); 
    } 
    
    bool txd_empty() { 
        Reg8 *uart = reinterpret_cast<Reg8 *>(UART_BUFFER);
        return ((uart[UART_MODEM_STATUS] & TXFE) && !(uart[UART_MODEM_STATUS] & BUSY));
    }

    bool busy() {
        Reg8 *uart = reinterpret_cast<Reg8 *>(UART_BUFFER);
        return (uart[UART_MODEM_STATUS] & BUSY);
    }

    void enable() {}
    void disable() {}

    void reset() {}

    void loopback(bool flag) {}


    char get() { while(!rxd_ok()); return rxd(); }
    void put(char c) { while(!txd_ok()); txd(c); }

    void flush() { while(!txd_empty()); }
    bool ready_to_get() { return rxd_ok(); }
    bool ready_to_put() { return txd_ok(); }

    void int_enable(bool receive = true, bool transmit = true, bool line = true, bool modem = true) {}
    void int_disable(bool receive = true, bool transmit = true, bool line = true, bool modem = true) {}

    void power(const Power_Mode & mode) {}

private:
    static void init() {}
};

__END_SYS

#endif
