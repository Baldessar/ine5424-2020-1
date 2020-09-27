riscv64-unknown-linux-gnu-as -march=rv64imac -o helloworld.o helloworld.s
riscv64-unknown-linux-gnu-ld -o helloworld helloworld.o
qemu-riscv64 helloworld
