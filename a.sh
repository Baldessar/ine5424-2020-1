rm *.o
rm *.bin
rm *.elf
arm-none-eabi-as hello.s -c -o hello.o                                           
arm-none-eabi-gcc -mcpu=cortex-a9 -c main.c
arm-none-eabi-ld main.o hello.o -o t.elf   
arm-none-eabi-objcopy -O binary t.elf t.bin                                      
qemu-system-arm -M realview-pbx-a9 -smp 4 -m 512M -kernel t.bin -serial mon:stdio