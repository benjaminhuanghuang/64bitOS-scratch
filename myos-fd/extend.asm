[org 0x7a00]

jmp EnterProtectedMode

%include "print.asm"

EnterProtectedMode:
  cli


  jmp $

EableA20:
  in al, 0x92
  or al, 2
  out 0x92, al
  ret
  
times 2048 - ($-$$)	db 0  