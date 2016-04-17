section .text
	global	ft_strcmp

ft_strcmp:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp



	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
