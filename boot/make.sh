riscv64-unknown-elf-as -o boot.o boot.s trap.s mem.s
riscv64-unknown-elf-gcc -c -Wno-implicit-function-declaration -mcmodel=medany main.c -o main.o
riscv64-unknown-elf-ld virts.ld boot.o main.o -o main.elf
riscv64-unknown-elf-objcopy -O binary main.elf main.bin
