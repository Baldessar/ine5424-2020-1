riscv64-unknown-elf-gcc -S sum.c
riscv64-unknown-elf-gcc -c sum.s
riscv64-unknown-elf-gcc -o sum sum.o
qemu-riscv64 sum
#http://www.cs.cornell.edu/courses/cs3410/2019sp/schedule/slides/11-linkload-notes-bw.pdf
