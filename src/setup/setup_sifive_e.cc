// EPOS RISC-V sifive SETUP

#include <system/config.h>

extern "C" { void _vector_table() __attribute__ ((used, naked, section(".init"))); }

// Interrupt Vector Table
void _vector_table()
{   
    
    ASM("\t\n\
        # Initialize and go to _start                                           \t\n\
        j _start                                                                \t\n\
    ");
    

    //*************ATENÇÃO RAPAZEADA*****************//
    // TEM QUE CONFERIR SE É ASSIM MESMO ************//
    // FOI SEGUIDO A TABELA DO VECTOR TABLE DO CLINT //

    // Informação obtida em https://sifive.cdn.prismic.io/sifive/0d163928-2128-42be-a75a-464df65e04e0_sifive-interrupt-cookbook.pdf
//     ASM("\t\n\
//         .word _vector_table + 1     # mtvec + 0x00 Reserved             \t\n\
//         .word _vector_table + 1     # mtvec + 0x04 Reserved             \t\n\
//         .word _vector_table + 1     # mtvec + 0x08 Reserved             \t\n\
//         .word _vector_table + 1     # mtvec + 0x0c Software Interrupt   \t\n\
//         .word _vector_table + 1     # mtvec + 0x10 Reserved             \t\n\
//         .word _vector_table + 1     # mtvec + 0x14 Reserved             \t\n\
//         .word _vector_table + 1     # mtvec + 0x18 Reserved             \t\n\
//         .word _vector_table + 1     # mtvec + 0x1c Timer Interrupt      \t\n\
//         .word _vector_table + 1     # mtvec + 0x20 Reserved             \t\n\
//         .word _vector_table + 1     # mtvec + 0x24 Reserved             \t\n\
//         .word _vector_table + 1     # mtvec + 0x28 Reserved             \t\n\
//         .word _vector_table + 1     # mtvec + 0x2c External Interrupt   \t\n\
//         .word _vector_table + 1     # mtvec + 0x30 Reserved             \t\n\
//         .word _vector_table + 1     # mtvec + 0x34 Reserved             \t\n\
//         .word _vector_table + 1     # mtvec + 0x38 Reserved             \t\n\
//         .word _vector_table + 1     # mtvec + 0x3c Reserved             \t\n\
//         .word _vector_table + 1     # mtvec + 0x40 Local Interrupt      \t\n\
//         .word _vector_table + 1     # mtvec + 0x44 Local Interrupt      \t\n\
//         .word _vector_table + 1     # mtvec + 0x48 Local Interrupt      \t\n\
//         .word _vector_table + 1     # mtvec + 0x4c Local Interrupt      \t\n\
//         .word _vector_table + 1     # mtvec + 0x50 Local Interrupt      \t\n\
//         .word _vector_table + 1     # mtvec + 0x54 Local Interrupt      \t\n\
//         .word _vector_table + 1     # mtvec + 0x58 Local Interrupt      \t\n\
//         .word _vector_table + 1     # mtvec + 0x5c Local Interrupt      \t\n\
//         .word _vector_table + 1     # mtvec + 0x60 Local Interrupt      \t\n\
//         .word _vector_table + 1     # mtvec + 0x64 Local Interrupt      \t\n\
//         .word _vector_table + 1     # mtvec + 0x68 Local Interrupt      \t\n\
//         .word _vector_table + 1     # mtvec + 0x6c Local Interrupt      \t\n\
//         .word _vector_table + 1     # mtvec + 0x70 Local Interrupt      \t\n\
//         .word _vector_table + 1     # mtvec + 0x74 Local Interrupt      \t\n\
//         .word _vector_table + 1     # mtvec + 0x78 Local Interrupt      \t\n\
//         .word _vector_table + 1     # mtvec + 0x7c Local Interrupt      \t\n\
//         ");
}
