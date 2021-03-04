GCCPARAMS = -ffreestanding -mno-red-zone -m64 -c

env:
	# escape $ to $$ in Makefile
	docker run --rm -it -v "$$PWD":/root/env myos-buildenv

loader.bin: bootloader.asm
	nasm bootloader.asm -f bin -o loader.bin


kernel.o: kernel.cpp
	x86_64-elf-gcc $(GCCPARAMS) -o kernel.o kernel.cpp

extend.o: extend.asm
	nasm extend.asm -f elf64 -o extend.o

kernel.bin: extend.o kernel.o
	ld -T linker.ld

install: clean loader.bin kernel.bin
	cat loader.bin kernel.bin > os.bin

run:
	qemu-system-x86_64 -fda os.bin -boot a

clean:
	rm -rf *.bin
	rm -rf *.o
	rm -rf *.img
	