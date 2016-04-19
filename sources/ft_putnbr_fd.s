section .text
	global	ft_putnbr_fd
	extern	ft_putchar_fd

ft_putnbr_fd:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	push	rbx				; Save registers to stack according x86-64 cedcl

	mov		edx, edi		; Copy parameter into a safe register
	test	edx, edx		; If int parameter is unsigned
	jns		recursive_print ; Jump to recursive_print
	neg		edx				; Else negate it
	mov		edi, '-'		; Set '-' as first ft_putchar_fd parameter

	push	rdx				; Save registers to stack before ft_putchar_fd call
	push	rsi
	call	ft_putchar_fd	; Call ft_putchar_fd
	pop		rsi				; Save registers to stack before ft_putchar_fd call			
	pop		rdx

recursive_print:
	cmp		edx, 9			; If int parameter > 9
	ja		divide			; Jump to divide
	mov		edi, edx		; Else set it as first ft_putchar_fd parameter
	add		edi, '0'		; Add it '0' value (for ascii matching)
	push	rsi				; Save register to stack before ft_putchar_fd call
	call	ft_putchar_fd	; Call ft_putchar_fd
	pop		rsi				; Restore register from stack after ft_putchar_fd call			
	jmp		return			; Return

divide:
	mov		eax, edx		; Store int parameter in eax register
	xor		edx, edx		; Set edx to 0
	mov		ebx, 10			; Set ebx to 10
	div		ebx				; Divide eax (int parameter) by ebx value (10).
							; eax will contain the quotient (div result) and edx the remainder (modulo result)

	push	rdx				; Save remainder to stack before ft_putnbr_fd recursive call
	mov		edi, eax		; Set quotient as first ft_putnbr_fd parameter
	call	ft_putnbr_fd	; Call ft_putnbr_fd recursively

	pop		rdi				; Set remainder as first ft_putnbr_fd parameter
	call	ft_putnbr_fd	; Call ft_putnbr_fd recursively

return:
	pop		rbx				; Restore registers from stack according x86-64 cedcl

	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
