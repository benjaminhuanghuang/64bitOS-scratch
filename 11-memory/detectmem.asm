
MemoryRegionCount:
	db 0
	GLOBAL MemoryRegionCount

DetectMemory:
	mov ax, 0
	mov es, ax           ; save data to [es:di]
	mov di, 0x5000
	mov edx, 0x534D4150  ;  0x534D4150="SMAP"
	xor ebx, ebx

.repeat:
	mov eax, 0xE820
	mov ecx, 24
	int 0x15

	cmp ebx, 0
	je .finished

	add di, 24
	inc byte [MemoryRegionCount]          ; 
	jmp .repeat

.finished:
	ret