
CC=riscv64-unknown-linux-gnu-g++
CFLAGS= -Wall -Wextra -pedantic -Wextra -O0 -g -std=c++17 -mcmodel=medany
CFLAGS+= -static -ffreestanding -nostdlib -fno-rtti -fno-exceptions
CFLAGS+= -march=rv64gc -mabi=lp64
SOURCES_ASM=$(wildcard asm/*.s)
SOURCES_C=$(wildcard c/*.c)
LINKER_SCRIPT=main.ld
INCLUDES=
OUT=main.elf
LIB= -lgcc
#####
## QEMU
#####
QEMU=qemu-system-riscv64
MACH=virt
CPU=rv64

CPUS=1
MEM=128M
QEMU_FLAGS= -bios none
all:
	$(CC) $(CFLAGS) $(LINKER_SCRIPT) $(INCLUDES) -o $(OUT) $(SOURCES_ASM) main.c $(LIBS) $(LIB) -w
viewer: run
	vncviewer 127.0.0.1:5901

run: all
	$(QEMU) -machine $(MACH) $(QEMU_FLAGS) -cpu $(CPU) -smp $(CPUS) -m $(MEM) -serial mon:stdio -kernel $(OUT)

debug: all
	$(QEMU) -machine $(MACH) $(QEMU_FLAGS) -cpu $(CPU) -smp $(CPUS) -m $(MEM) -serial mon:stdio -kernel $(OUT) -S -s -nographic

debugger:
	riscv64-unknown-elf-objdump -d main.elf > obj.s
	riscv64-unknown-elf-gdb main.elf
clean:
	rm *.o
	rm *.bin
	rm *.elf
