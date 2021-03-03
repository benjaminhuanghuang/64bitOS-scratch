## OS on floppy disk
https://github.com/Absurdponcho/YoutubeOS


bootloader.bin is mbr, it loads 4 sectors from 2nd sector

extend.bin was written to 2nd sector

```
  cat loader.bin extend.bin > boot.bin
  dd if=/dev/zero of=boot.img bs=512 count=2880
```
or
```
  dd if=boot.bin of=boot.img bs=512 count=1 conv=notrunc
	dd if=boot.bin of=boot.img bs=512 count=1 seek=1

```