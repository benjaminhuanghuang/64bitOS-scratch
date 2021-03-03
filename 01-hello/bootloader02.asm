;
;  Need stack pointer for function call
;  Need [org 0x7c00] because use lable/offset 

[org 0x7c00]    ; can not work without this line
; set base of the stack
mov bp, 0x7c00
; set stack pointer
mov sp, bp 

; use bx as index, mov address of string to bx
mov bx, Message
call PrintMessage

jmp $

PrintMessage:
  mov ah, 0x0e
.loop:
  cmp [bx], byte 0
  je .exit
  mov al ,[bx]
  int 0x10
  inc bx
  jmp  .loop
.exit:

  ret

Message:
  db "This is test", 0

times 510 - ($-$$)	db 0
dw 0xaa55













