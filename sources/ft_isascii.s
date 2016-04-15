section .text
	global ft_isascii

ft_isascii:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	cmp		rdi, 0			; If parameter is less than 0
	jl		not_ascii		; Return 0 
	cmp		rdi, 127		; If parameter is greater than 127
	jg		not_ascii		; Return 0 

	mov		rax, 1			; Else return 1
	jmp		return

not_ascii:
	mov		rax, 0

return:
	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
