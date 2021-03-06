section .text
	global	ft_strcat

ft_strcat:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	push	rdi				; Save original dest pointer to stack

find_dest_end:
	cmp		byte[rdi], 0	; If dest pointed byte is 0
	je		copy_src		; Launch the copy

	inc		rdi				; Else increment pointer
	jmp		find_dest_end	; Repeat

copy_src:
	mov		al, byte[rsi]	; Copy src byte to register
	mov		byte[rdi], al	; Copy register to dest byte
	inc		rsi				; Increment src pointer
	inc		rdi				; Increment dest pointer

	test	al, al			; If src current byte is not 0
	jnz		copy_src		; Repeat

	pop		rax				; Set original dest pointer as return value

	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
