section .text
	global ft_isdigit

ft_isdigit:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	cmp		rdi, '0'		; If parameter is less than '0'
	jl		not_digit		; Return 0 
	cmp		rdi, '9'		; If parameter is greater than '9'
	jg		not_digit		; Return 0 

	mov		rax, 1			; Else return 1
	jmp		return

not_digit:
	mov		rax, 0

return:
	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
