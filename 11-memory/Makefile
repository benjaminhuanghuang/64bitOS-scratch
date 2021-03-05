GCCPARAMS = -ffreestanding -mno-red-zone -m64 -c
OBJS = extend.o kernel.o binary.o idt.o io.o textPrint.o memMap.o keyboard.o heap.o memory.o


env:
	# escape $ to $$ in Makefile
	docker run --rm -it -v "$$PWD":/root/env myos-buildenv

loader.bin: bootloader.asm
	nasm bootloader.asm -f bin -o loader.bin
	
extend.o: extend.asm
	nasm extend.asm -f elf64 -o extend.o

binary.o: binary.asm
	nasm binary.asm -f elf64 -o binary.o

# general rules
%.o : %.cpp
	x86_64-elf-gcc $(GCCPARAMS) -o $*.o $*.cpp


kernel.bin: $(OBJS)
	ld -T linker.ld

install: clean loader.bin kernel.bin
	cat loader.bin kernel.bin > os.bin

run:
	qemu-system-x86_64 -fda os.bin -boot a

clean:
	rm -rf *.bin
	rm -rf *.o
	rm -rf *.img
	