# boot.S
# bootloader for SoS
# Stephen Marz
# 8 February 2019

# Disable generation of compressed instructions.
.option norvc

# Define a .data section.
.section .data

# Define a .text.init section.
.section .text.init

# Execution starts here.
.global _start
_start:
	# Any hardware threads (hart) that are not bootstrapping
	# need to wait for an IPI
	csrr	t0, mhartid
	bnez	t0, wait
	# SATP should be zero, but let's make sure
	csrw	satp, zero

	# Disable linker instruction relaxation for the `la` instruction below.
	# This disallows the assembler from assuming that `gp` is already initialized.
	# This causes the value stored in `gp` to be calculated from `pc`.
.option push
.option norelax
	la		gp, _global_pointer
.option pop
	# Set all bytes in the BSS section to zero.
	call    main
	la 		a0, _bss_start
	la		a1, _bss_end
	bgeu	a0, a1, wait
1:
	sd		zero, (a0)
	addi	a0, a0, 8
	bltu	a0, a1, 1b
wait:
	wfi
	j		wait
