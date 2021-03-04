# Float double

https://www.youtube.com/watch?v=lYzE4KthOBw&list=PLxN4E629pPnKKqYsNVXpmCza8l0Jb6l8-&index=15

https://www.youtube.com/watch?v=-r8VQkdLXwM&list=PLxN4E629pPnKKqYsNVXpmCza8l0Jb6l8-&index=16


```
; 64bit float
ActivateSSE:
	mov rax, cr0
	and ax, 0b11111101
	or ax, 0b00000001
	mov cr0, rax

	mov rax, cr4
	or ax, 0b1100000000
	mov cr4, rax

	ret
```