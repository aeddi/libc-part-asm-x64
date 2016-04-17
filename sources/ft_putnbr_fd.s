section .text
	global	ft_putnbr_fd

ft_putnbr_fd:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp



	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
