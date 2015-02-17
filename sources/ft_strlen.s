%define	MAX_64		0xffffffffffffffff

section .text
	global _ft_strlen

_ft_strlen:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	xor		rax, rax		; Set rax to 0
	mov		rcx, MAX_64		; Set loop counter to max value

	cld						; Clear direction flag (increment rsi/rdi)
	repne	scasb			; repne: Decrement rcx and repeat instruction while (rcx != 0 && !ZEROFLAG)
							; scasb: Check if byte at (rdi == rax) and set status flags, then increment rdi in the way indicate by the direction flag
	not		rcx				; Invert rcx to get postitive value
	lea		rax, [rcx - 1]	; Set return value in rax (rcx - 1 because reverse counting on rcx)

	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
