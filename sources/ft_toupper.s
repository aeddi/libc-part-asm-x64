section .text
	global ft_toupper

ft_toupper:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	mov		rax, rdi		; Use parameter as return value

	cmp		rdi, 'a'		; If parameter is less than 'a'
	jl		return  		; Return it unchanged
	cmp		rdi, 'z'		; If parameter is greater than 'z'
	jg		return  		; Return it unchanged
                                                            
	sub		rax, 32 		; Sub 32 from parameter (uppercase)
                                                            
return:                                                     
	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
