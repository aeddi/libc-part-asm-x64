section .text
	global ft_isprint

ft_isprint:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	cmp		rdi, 32			; If parameter is less than 32
	jl		not_print		; Return 0 
	cmp		rdi, 126		; If parameter is greater than 126
	jg		not_print		; Return 0 

	mov		rax, 1			; Else return 1
	jmp		return

not_print:
	mov		rax, 0

return:
	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
