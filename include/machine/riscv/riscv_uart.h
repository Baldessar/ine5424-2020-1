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
    
    // conferir
    static const unsigned int CLOCK = Traits<UART>::CLOCK;

    // typedef UART_Engine Engine;

    // uart offsets
    // https://github.com/riscv/riscv-pk/blob/master/machine/uart16550.c
    // https://www.xilinx.com/support/documentation/ip_documentation/axi_uart16550/v2_0/pg143-axi-uart16550.pdf
    // Peguei aqui, deem uma conferida se funciona certo
    enum {
        UART_REG                = 0x00,
        UART_REG_STATUS_RX      = 0x01, // acho que não precisa desse
        UART_REG_STATUS_TX      = 0x20,
        UART_LINE_STATUS        = 0x14,
        UART_FIFO_CONTROL       = 0x08, // não sei se usaremos
        UART_LINE_CONTROL       = 0x0C, // não sei se usaremos 
        UART_MODEM_STATUS       = 0x18, // usar no txd_ok, rxd_ok, etc
        FR                      = 0x18,
        UART_MODEM_CONTROL      = 0x10,

        INTERRUPT_ENABLE        = 0x001, // Interrupt Enable	R/W, DLAB = 0 [0=DR,1=THRE,2=LI,3=MO]
        
    };

    // uart useful bits
    enum {

        // receive fifo empty bit
        RXFE                    = 1 <<  4,  // 00010000
        // receive fifo full bit
        RXFF                    = 1 <<  6,  // 01000000
        // transmit fifo empty bit
        TXFE                    = 1 <<  7,  // 10000000
        // transmit fifo full bit
        TXFF                    = 1 <<  5,  // 00100000
        // busy transmiting data bit
        BUSY                    = 1 <<  3,  // 00001000


        DIVISOR_LATCH_LSB       = 0, // Divisor Latch LSB	R/W, DLAB = 1
        FIFO_CONTROL            = 2, // FIFO Control	W   [0=EN,1=RC,2=XC,3=RDY,67=TRG]
        LINE_CONTROL            = 3, // Line Control	R/W [01=DL,2=SB,345=P,6=BRK,7=DLAB]
        MODEM_CONTROL           = 4, // Modem Control	R/W [0=DTR,1=RTS,2=OUT1,3=OUT2,4=LB]
        DIVISOR_LATCH_MSB       = 1  // Divisor Latch MSB	R/W, DLAB = 1
             

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

    // Baseado no include/machine/pc_uart.h
    void config(unsigned int baud_rate, unsigned int data_bits, unsigned int parity, unsigned int stop_bits)
    {
        // Disable all interrupts
        reg(INTERRUPT_ENABLE) = 0;

        // Set clock divisor
        Reg32 div = CLOCK / baud_rate;
        dlab(true);
        reg(DIVISOR_LATCH_LSB) = div;
        reg(DIVISOR_LATCH_LSB) = div >> 8;
        dlab(false);

        // Set data word length (5, 6, 7 or 8)
        Reg8 lcr = data_bits - 5;

        // Set parity (0 [no], 1 [odd], 2 [even])
        if (parity)
        {
            lcr |= 1 << 3;
            lcr |= (parity - 1) << 4;
        }

        // Set stop-bits (1, 2 or 3 [1.5])
        lcr |= (stop_bits > 1) ? (1 << 2) : 0;

        reg(LINE_CONTROL) = lcr;
        
        // Enables Tx and Rx FIFOs, clear them, set trigger to 14 bytes
        reg(FIFO_CONTROL) = 0xc7;

        // Set DTR, RTS and OUT2 of MCR
        reg(MODEM_CONTROL) = reg(MODEM_CONTROL) | 0x0b;
    }

    // Baseado no include/machine/pc_uart.h
    void config(unsigned int * baud_rate, unsigned int * data_bits, unsigned int * parity, unsigned int * stop_bits) 
    {
        // Get clock divisor
        dlab(true);
        *baud_rate = CLOCK * ((reg(DIVISOR_LATCH_MSB) << 8) | reg(DIVISOR_LATCH_LSB));
        dlab(false);

        Reg8 lcr = reg(LINE_CONTROL);

        // Get data word length (LCR bits 0 and 1)
        *data_bits = (lcr & 0x03) + 5;

        // Get parity (LCR bits 3 [enable] and 4 [odd/even])
        *parity = (lcr & 0x08) ? ((lcr & 0x10) ? 2 : 1 ) : 0;

        // Get stop-bits  (LCR bit 2 [0 - >1, 1&D5 -> 1.5, 1&!D5 -> 2)
        *stop_bits = (lcr & 0x04) ? ((*data_bits == 5) ? 3 : 2 ) : 1;
    }

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
        unsigned int o = UART_MODEM_STATUS;
        volatile Reg32 &uart = reinterpret_cast<volatile Reg32 *>(this)[o / sizeof(Reg32)];
        //volatile Reg32 *uart = reinterpret_cast<volatile Reg32 *>(UART_BUFFER);
        return !(uart & RXFE);
    }

    bool txd_ok() {
        unsigned int o = UART_MODEM_STATUS;
        volatile Reg32 &uart = reinterpret_cast<volatile Reg32 *>(this)[o / sizeof(Reg32)];
        //volatile Reg32 *uart = reinterpret_cast<volatile Reg32 *>(UART_BUFFER);
        return !(uart & TXFF);
    }

    bool rxd_full() { 
        unsigned int o = UART_MODEM_STATUS;
        volatile Reg32 &uart = reinterpret_cast<volatile Reg32 *>(this)[o / sizeof(Reg32)];
        //volatile Reg32 *uart = reinterpret_cast<volatile Reg32 *>(UART_BUFFER);
        return (uart & RXFF); 
    } 
    
    bool txd_empty() { 
        unsigned int o = UART_MODEM_STATUS;
        volatile Reg32 &uart = reinterpret_cast<volatile Reg32 *>(this)[o / sizeof(Reg32)];
        //volatile Reg32 *uart = reinterpret_cast<volatile Reg32 *>(UART_BUFFER);
        return ((uart & TXFE) && !(uart & BUSY));
    }

    bool busy() {
        unsigned int o = UART_MODEM_STATUS;
        volatile Reg32 &uart = reinterpret_cast<volatile Reg32 *>(this)[o / sizeof(Reg32)];
        //volatile Reg32 *uart = reinterpret_cast<volatile Reg32 *>(UART_BUFFER);
        return (uart & BUSY);
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
    volatile Reg8 & reg(unsigned int o) { return reinterpret_cast<volatile Reg8 *>(reinterpret_cast<void *>(this))[o]; }
    void dlab(bool f) { reg(LINE_CONTROL) = ((reg(LINE_CONTROL) & 0x7f) | (f << 7)); }
};

__END_SYS

#endif
