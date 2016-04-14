section .text
	global ft_toupper

ft_toupper:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	cmp		rdi, 'a'		; If parameter is less than 'a'
	jb		return  		; Return it unchanged
	cmp		rdi, 'z'		; If parameter is more than 'z'
	ja		return  		; Return it unchanged
                                                            
	sub		rdi, 32 		; Sub 32 from parameter (uppercase)
                                                            
return:                                                     
	mov		rax, rdi		; Use parameter as return value
	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
