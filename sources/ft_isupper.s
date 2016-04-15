section .text
	global ft_isupper

ft_isupper:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	cmp		rdi, 'A' 		; If parameter is less than 'A'
	jl		not_upper		; Return 0
	cmp		rdi, 'Z'		; If parameter is greater than 'Z'
	jg		not_upper		; Return 0

	mov		rax, 1			; Else return 1
	jmp		return

not_upper:
	mov		rax, 0

return:
	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
