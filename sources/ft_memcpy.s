section .text
	global	ft_memcpy

ft_memcpy:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	push	rdi				; Save original pointer to stack (movsb gonna increment him)

	mov		rcx, rdx		; Put third parameter "len" into rcx for rep counter
	cld						; Clear direction flag (left to right)
	rep		movsb			; rep:  Decrement rcx and repeat movsb while (rcx != 0)
							; movsb: Copy byte from byte[rsi] to byte[rdi], then increment rdi and rsi in the way indicated by the direction flag

	pop		rax				; Set original pointer as return value

	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
