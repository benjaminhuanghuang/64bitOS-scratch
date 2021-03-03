loader.bin: bootloader.asm
	nasm bootloader.asm -f bin -o loader.bin

extend.bin: extend.asm
	nasm extend.asm -f bin -o extend.bin

env:
	# escape $ to $$ in Makefile
	docker run --rm -it -v "$$PWD":/root/env myos-buildenv

install: loader.bin extend.bin
	cat loader.bin extend.bin > boot.bin

run: install
	qemu-system-x86_64 -fda boot.bin -boot a

clean:
	rm -rf *.bin
	rm -rf *.o