rm *.o
rm *.bin
rm *.elf
arm-none-eabi-as ts.s -c -o ts.o                                           
arm-none-eabi-gcc -mcpu=cortex-a9 -c main.c
arm-none-eabi-ld -T t.ld main.o ts.o -o t.elf   
arm-none-eabi-objcopy -O binary t.elf t.bin                                      
qemu-system-arm -M realview-pbx-a9 -smp 4 -m 512M -kernel t.bin -serial mon:stdio