ReadDisk:

	mov ah, 0x02             ; read disk
	mov bx, PROGRAM_SPACE    ; load data to memory
	mov al, 4                ; how many sector
	mov dl, [BOOT_DISK]      ; which driver
	mov ch, 0x00             ; cylinder
	mov dh, 0x00             ; header
	mov cl, 0x02             ; sector(index from 1)

	int 0x13