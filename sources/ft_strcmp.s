section .text
	global	ft_strcmp
	extern	ft_strlen

ft_strcmp:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	push	rdi				; Save registers to stack (movsb gonna override them)
	push	rsi

	call	ft_strlen		; Get str length
	mov		rcx, rax

	cld						; Clear direction flag (left to right)
	repe	cmpsb			; repe: Decrement rcx and repeat cmpsb while (rcx != 0 && ZEROFLAG)
							; cmpsb: Check if byte[rdi] == byte[rsi] and set status flags, then increment rdi and rsi in the way indicated by the direction flag

	xor		rax, rax
	mov		al, byte[rdi - 1]
	sub		al, byte[rsi - 1]

	pop		rsi				; Restore registers from stack
	pop		rdi

	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
