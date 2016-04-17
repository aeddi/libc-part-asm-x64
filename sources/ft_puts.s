%ifdef LINUX				; Define right syscall index
	%define	WRITE	1
%elif DARWIN
	%define	WRITE	0x2000004
%endif

%define	STDOUT	1
%define	EOF		-1

section .rodata
	null:	db "(null)"		; Constant values
	len:	equ $-null
	newl:	db `\n`

section .text
	global	ft_puts
	extern	ft_strlen

ft_puts:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	push	rdi				; Save registers to stack
	push	rsi

	test	rdi, rdi		; If str parameter == NULL
	jz		print_null		; Print null message

	call	ft_strlen		; Get str length
	mov		rdx, rax		; Store it as third write parameter
	mov		rax, WRITE		; Set write syscall index
	mov		rsi, rdi		; Set str pointer as second write parameter
	mov		rdi, STDOUT		; Set STDOUT as first write parameter
	syscall					; Call write

	test	rax, rax		; Check write return
	js		error			; If < 0: return error

print_newl:
	mov		rax, WRITE		; Set write syscall index
	mov		rdi, STDOUT		; Set STDOUT as first write parameter
	lea		rsi, [rel newl]	; Set newl pointer as second write parameter
	mov		rdx, 1			; Set length as third write parameter
	syscall					; Call write

	test	rax, rax		; Check write return
	js		error			; If < 0: return error

	mov		rax, 1			; Set non-negative return value
	jmp		return			; Return

print_null:
	mov		rax, WRITE		; Set write syscall index
	mov		rdi, STDOUT		; Set STDOUT as first write parameter
	lea		rsi, [rel null]	; Set null pointer as second write parameter
	mov		rdx, len		; Set length as third write parameter
	syscall					; Call write

	test	rax, rax		; Check write return
	js		error			; If < 0: return error

	jmp		print_newl		; Print new line

error:
	mov		rax, EOF		; Set EOF as return value

return:
	pop		rsi				; Restore registers from stack
	pop		rdi

	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
