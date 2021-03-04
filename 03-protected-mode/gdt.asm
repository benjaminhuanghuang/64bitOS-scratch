gdt_nulldesc:
	dd 0
	dd 0	
gdt_codedesc:
	dw 0xFFFF			  ; Limit: set it to unlimited 
	dw 0x0000			  ; Base (low)
	db 0x00				  ; Base (medium)
	db 10011010b		; Flags
	db 11001111b		; Flags + Upper Limit
	db 0x00				  ; Base (high)
gdt_datadesc:
	dw 0xFFFF
	dw 0x0000
	db 0x00
	db 10010010b    ; Same as codedesc except exe bit is 0 for data 
	db 11001111b 
	db 0x00
gdt_end:

; gdt descriptor hold size and offset of GDT
gdt_descriptor:
	gdt_size: 
		dw gdt_end - gdt_nulldesc - 1
		dd gdt_nulldesc

; constants of segment
codeseg equ gdt_codedesc - gdt_nulldesc
dataseg equ gdt_datadesc - gdt_nulldesc