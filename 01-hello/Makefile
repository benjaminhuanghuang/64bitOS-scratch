boot1.bin: bootloader01.asm
	nasm bootloader01.asm -f bin -o boot.bin

boot2.bin: bootloader02.asm
	nasm bootloader02.asm -f bin -o boot.bin



run1: boot1.bin
	qemu-system-x86_64 -fda boot.bin -boot a

run2: boot2.bin
	qemu-system-x86_64 -fda boot.bin -boot a

clean:
	rm -rf *.bin
	