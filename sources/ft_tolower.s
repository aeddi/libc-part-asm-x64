section .text
	global ft_tolower

ft_tolower:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	mov		rax, rdi		; Use parameter as return value

	cmp		rdi, 'A'		; If parameter is less than 'A'
	jl		return			; Return it unchanged
	cmp		rdi, 'Z'		; If parameter is greater than 'Z'
	jg		return			; Return it unchanged

	add		rax, 32			; Add 32 to parameter (lowercase)

return:
	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
