section .text
	global ft_bzero

ft_bzero:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	xor

	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
