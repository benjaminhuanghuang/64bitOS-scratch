GCCPARAMS = -ffreestanding -mno-red-zone -m64 -c
OBJS = kernel.obj idt.obj detectmem.obj 


env:
	# escape $ to $$ in Makefile
	docker run --rm -it -v "$$PWD":/root/env myos-buildenv

loader.bin: bootloader.asm
	nasm bootloader.asm -f bin -o loader.bin

binary.o: binary.asm
	nasm binary.asm -f elf64 -o binary.o

kernel.o: kernel.cpp
	x86_64-elf-gcc $(GCCPARAMS) -o kernel.o kernel.cpp

idt.o: idt.cpp
	x86_64-elf-gcc $(GCCPARAMS) -o idt.o idt.cpp

io.o: io.cpp
	x86_64-elf-gcc $(GCCPARAMS) -o io.o io.cpp

memMap.o: memMap.cpp
	x86_64-elf-gcc $(GCCPARAMS) -o memMap.o memMap.cpp

textPrint.o: textPrint.cpp
	x86_64-elf-gcc $(GCCPARAMS) -o textPrint.o textPrint.cpp

keyboard.o: keyboard.cpp
	x86_64-elf-gcc $(GCCPARAMS) -o keyboard.o keyboard.cpp

extend.o: extend.asm
	nasm extend.asm -f elf64 -o extend.o

kernel.bin: extend.o kernel.o binary.o idt.o io.o textPrint.o memMap.o keyboard.o
	ld -T linker.ld

install: clean loader.bin kernel.bin
	cat loader.bin kernel.bin > os.bin

run:
	qemu-system-x86_64 -fda os.bin -boot a

clean:
	rm -rf *.bin
	rm -rf *.o
	rm -rf *.img
	