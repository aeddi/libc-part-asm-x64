section .text
	global ft_islower

ft_islower:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	cmp		rdi, 'a' 		; If parameter is less than 'a'
	jl		not_lower		; Return 0
	cmp		rdi, 'z'		; If parameter is greater than 'z'
	jg		not_lower		; Return 0

	mov		rax, 1			; Else return 1
	jmp		return

not_lower:
	mov		rax, 0

return:
	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
