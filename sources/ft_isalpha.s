section .text
	global ft_isalpha
	extern ft_islower
	extern ft_isupper

ft_isalpha:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	call	ft_islower		; Call islower function
	cmp		rax, 0			; If lowercase return value as is
	jne		return

	call	ft_isupper		; Call isupper function

return:
	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
