CC=i686-linux-gnu-gcc
LD=i686-linux-gnu-ld
ASM=nasm

CFLAGS=-ffreestanding -m32 -c
LDFLAGS=-m elf_i386 -T linker.ld

all: i386

i386:
	$(ASM) -f elf32 boot.asm -o boot.o
	$(CC) $(CFLAGS) kernel.c -o kernel.o
	$(LD) $(LDFLAGS) -o kernel.elf boot.o kernel.o
clean:
	rm -f *.o *.elf
