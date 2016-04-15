section .text
	global ft_isalnum
	extern ft_isalpha
	extern ft_isdigit

ft_isalnum:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	call	ft_isalpha		; Call isalpha function
	cmp		rax, 0			; If alpha return value as is
	jne		return

	call	ft_isdigit		; Call isdigit function

return:
	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
