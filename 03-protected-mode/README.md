# Protected mode
https://www.youtube.com/watch?v=pXzortxPZR8&t=18s&ab_channel=Poncho

Add function into extend.asm

## Enter proteced mode
- Disable interrupts

- Enable A20 

- Load the GDT(global descriptor table)
GDT is the data structure that defines memory locations and size and privilege

set cr0最低位为1，则可以进入保护模式。


