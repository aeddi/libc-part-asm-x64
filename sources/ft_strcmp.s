section .text
	global	ft_strcmp
	extern	ft_strlen

ft_strcmp:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	push	rdi				; Save registers to stack before strlen call
	push	rsi
	call	ft_strlen		; Get str length
	pop		rsi				; Restore registers from stack
	pop		rdi

	mov		rcx, rax		; Set str length as counter value for repe
	cld						; Clear direction flag (left to right)
	repe	cmpsb			; repe: Decrement rcx and repeat cmpsb while (rcx != 0 && ZEROFLAG)
							; cmpsb: Check if byte[rdi] == byte[rsi] and set status flags, then increment rdi and rsi in the way indicated by the direction flag

	xor		rax, rax		; Set rax to 0
	xor		rdx, rdx		; Set rdx to 0
	mov		al, [rdi - 1]	; Put char previously pointed by rdi in rax
	mov		dl, [rsi - 1]	; Put char previously pointed by rsi in rdx
	sub		rax, rdx		; Sub char 1 by char 2 and set result as return value

	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
