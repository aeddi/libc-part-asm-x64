section .text
	global	ft_strdup
	extern	malloc
	extern	ft_strlen
	extern	ft_memcpy

ft_strdup:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	push	rdi				; Save registers to stack
	push	rsi

	test	rdi, rdi		; If str parameter == NULL
	jz		return			; Return

	call	ft_strlen		; Get str length
	push	rax				; Save str length
	push	rdi				; Save str base pointer
	mov		rdi, rax		; Set length as malloc parameter

	call	malloc			; Call malloc
	test	rax, rax		; If malloc return NULL
	jz		return			; Return NULL

	mov		rdi, rax		; Set new str pointer as first memcpy parameter
	pop		rsi				; Set old str pointer as second memcpy parameter
	pop		rdx				; Set str length as third memcpy parameter
	call	ft_memcpy		; Call memcpy

return:
	pop		rsi				; Restore registers from stack
	pop		rdi
	
	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
