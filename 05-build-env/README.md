# GCC Cross Compiler + Writing C Code

https://www.youtube.com/watch?v=-v6uRjpR_0M&list=PLxN4E629pPnKKqYsNVXpmCza8l0Jb6l8-&index=6&ab_channel=Poncho

## windows wsl setup
```
  apt install build-assential
  ...
  ...
  ...
```


## docker 



## Link
Remove the [org ] from extend.asm
Link will set the org address
```
	ld -Ttext 0x7e00 -o kernel.elf extend.o kernel.o
```

add `[extern _start]` into extend.asm

and call _start in Start64Bit


To linke extend.asm with kernel.cpp, can not use .bin format any more.
We should generate elf64 foramt for .asm code
```
  nams extern.asm -f elf64 -o extern.o
```

Get the bin content from the elf file
```
objcopy -O binary kernel.elf kernel.bin 
```