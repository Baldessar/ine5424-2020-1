
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
CPU=rv64gcsu-v1.10.0

CPUS=4
MEM=128M
all:
	$(CC) $(CFLAGS) $(LINKER_SCRIPT) $(INCLUDES) -o $(OUT) $(SOURCES_ASM) main.c $(LIBS) $(LIB)
viewer: run
	vncviewer 127.0.0.1:5901

run: all 
	$(QEMU) -machine $(MACH) -cpu $(CPU) -smp $(CPUS) -m $(MEM) -serial mon:stdio -kernel $(OUT)
	

clean:
	rm *.o
	rm *.bin
	rm *.elf