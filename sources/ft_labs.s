section .text
	global	ft_labs

ft_labs:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	mov		eax, edi		; Set parameter as return value

	test	eax, eax		; If return value is unsigned
	jns		return			; Return
	neg		eax				; Else negate it before return

return:
	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
