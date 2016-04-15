%define	MAX_64	0xffffffffffffffff

section .text
	global ft_strlen

ft_strlen:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	push	rdi				; Save register to stack (scasb gonna override it)

	xor		al, al			; Set al to 0 for scasb comparison
	mov		rcx, MAX_64		; Set repne counter to max value
	cld						; Clear direction flag (left to right)
	repne	scasb			; repne: Decrement rcx and repeat scasb while (rcx != 0 && !ZEROFLAG)
							; scasb: Check if byte[rdi] == al and set status flags, then increment rdi in the way indicated by the direction flag

	not		rcx				; Invert rcx to get good value (rcx was decremented)
	lea		rax, [rcx - 1]	; Set return value in rax (rcx - 1 because reverse counting on rcx)

	pop		rdi				; Restore register from stack

	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
