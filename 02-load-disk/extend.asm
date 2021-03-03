[org 0x7a00]

mov bx, ExtendSuccess      
call PrintString

jmp $

%include "print.asm"

ExtendSuccess:
  db "ExtendSuccess", 0

times 2048 - ($-$$)	db 0  