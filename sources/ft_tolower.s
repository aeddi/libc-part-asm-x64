section .text
	global ft_tolower

ft_tolower:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	cmp		rdi, 'A'		; If parameter is less than 'A'
	jb		return			; Return it unchanged
	cmp		rdi, 'Z'		; If parameter is more than 'Z'
	ja		return			; Return it unchanged

	add		rdi, 32			; Add 32 to parameter (lowercase)

return:
	mov		rax, rdi		; Use parameter as return value
	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
