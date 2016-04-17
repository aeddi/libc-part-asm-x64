section .text
	global	ft_putchar_fd

ft_putchar_fd:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp



	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
