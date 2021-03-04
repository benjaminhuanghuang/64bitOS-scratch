PROGRAM_SPACE equ 0x7e00

ReadDisk:

	mov ah, 0x02             ; read disk
	mov bx, PROGRAM_SPACE    ; load data to memory
	mov al, 4                ; how many sector
	mov dl, [BOOT_DISK]      ; which driver
	mov ch, 0x00             ; cylinder
	mov dh, 0x00             ; header
	mov cl, 0x02             ; sector(index from 1)

	int 0x13

	jc DiskReadFailed

	ret

BOOT_DISK:
	db 0

DiskReadErrorString:
	db 'Disk Read Failed',0

DiskReadFailed:
	mov bx, DiskReadErrorString
	call PrintString

	jmp $