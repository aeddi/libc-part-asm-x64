section .text
	global	ft_memset

ft_memset:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	push	rdi				; Save register to stack (stosb gonna override it)

	mov		al, sil			; Put second parameter "set byte" into al for stosb
	mov		rcx, rdx		; Put third parameter "len" into rcx for rep counter
	cld						; Clear direction flag (left to right)
	rep		stosb			; rep:  Decrement rcx and repeat stosb while (rcx != 0)
							; stosb: Store byte from al to byte[rdi], then increment rdi in the way indicated by the direction flag

	pop		rdi				; Restore register from stack
	mov		rax, rdi		; Set original pointer as return value

	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
