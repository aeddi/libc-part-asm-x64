section .text
	global ft_bzero

ft_bzero:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

while:
	cmp		rsi, 0			; If N == 0 (N is unsigned)
	je		return			; Break

	mov		byte[rdi], 0	; Erase byte pointed by rdi
	inc		rdi				; Increment rdi pointer
	dec		rsi				; Decrement rsi counter
	jmp		while			; Repeat

return:
	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
