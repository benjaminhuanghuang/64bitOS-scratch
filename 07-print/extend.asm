jmp EnterProtecedMode

%include "gdt.asm"
%include "print.asm"

EnterProtecedMode:
  cli                    ; disalbe interrupts
  call EnableA20
  lgdt [gdt_descriptor]
	; open cr0
  mov eax, cr0
	or eax, 1
	mov cr0, eax
  ; For JUMP to Protected mode
	jmp codeseg:StartProtectedMode


EnableA20:
	in al, 0x92
	or al, 2
	out 0x92, al
	ret

[bits 32]
%include "cpuid.asm"
%include "simplepaging.asm"

StartProtectedMode:
	; point segment to dataseg defined in gdt
	mov ax, dataseg
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	mov [0xb8000], byte 'H'
	mov [0xb8002], byte 'e'
	mov [0xb8004], byte 'l'
	mov [0xb8006], byte 'l'
	mov [0xb8008], byte 'o'
	mov [0xb800a], byte ' '
	mov [0xb800c], byte 'P'
	mov [0xb800e], byte 'r'
	mov [0xb8010], byte 'o'
	mov [0xb8012], byte 't'
	mov [0xb8014], byte '+'
	mov [0xb8016], byte '+'
	mov [0xb8018], byte '+'

	call DetectCPUID
	call DetectLongMode
	call SetUpIdentityPaging
	call EditGDT
	; far jump to 64 bit
	jmp codeseg:Start64Bit

[bits 64]
[extern _start]
Start64Bit:
	mov edi, 0xb8000
	mov rax, 0x1f201f201f201f20
	mov ecx, 500
	rep stosq
	; rep指令的目的是重复其上面的指令.ECX的值是重复的次数.
	; STOS指令的作用是将eax中的值拷贝到ES:EDI指向的地址.
	call _start
	jmp $


times 2048 - ($-$$)	db 0  