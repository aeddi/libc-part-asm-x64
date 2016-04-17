section .text
	global	ft_llabs

ft_llabs:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	mov		rax, rdi		; Set parameter as return value

	test	rax, rax		; If return value is unsigned
	jns		return			; Return
	neg		rax				; Else negate it before return

return:
	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
