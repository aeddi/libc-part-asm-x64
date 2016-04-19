%ifdef LINUX				; Define right syscall index
	%define	READ	0
	%define	WRITE	1
%elif DARWIN
	%define	READ	0x2000003
	%define	WRITE	0x2000004
%endif

%define	STDOUT	1
%define	STDERR	2
%define	BUF_SZ	512

section .rodata
	err:	db `Error\n`	; Constant values
	len:	equ $-err

section .bss
	buf:	resb BUF_SZ		; Buffer with memory setted to 0

section .text
	global	ft_cat

ft_cat:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	mov		r8, rdi			; Save fd into a safe register

while:
	mov		rax, READ		; Set read syscall index
	mov		rdi, r8			; Set fd as first read parameter
	lea		rsi, [rel buf]	; Set buffer pointer as second read parameter
	mov		rdx, BUF_SZ		; Set buff size as third read parameter
	syscall					; Call read

	test	rax, rax		; Check read return
	js		print_error		; If < 0: return error
	jz		return			; Else if == 0: return

	mov		rdx, rax		; Set length of readed data as third write parameter
	mov		rax, WRITE		; Set write syscall index
	mov		rdi, STDOUT		; Set STDOUT as first write parameter
	lea		rsi, [rel buf]	; Set buffer pointer as second write parameter
	syscall					; Call write

	test	rax, rax		; Check write return
	js		print_error		; If negative value: return error
	jmp		while			; Repeat

print_error:
	mov		rax, WRITE		; Set write syscall index
	mov		rdi, STDERR		; Set STDOUT as first write parameter
	lea		rsi, [rel err]	; Set null pointer as second write parameter
	mov		rdx, len		; Set length as third write parameter
	syscall					; Call write

	mov		rax, -1			; Set error return value

return:
	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
