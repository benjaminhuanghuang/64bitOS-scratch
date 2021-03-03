[org 0x7e00]

mov bx, ExtendSuccess      
call PrintString

jmp $

%include "print.asm"

ExtendSuccess:
  db "Extend space is loaded successf", 0

times 2048 - ($-$$)	db 0  