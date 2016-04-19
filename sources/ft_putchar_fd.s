%ifdef LINUX				; Define right syscall index
	%define	WRITE	1
%elif DARWIN
	%define	WRITE	0x2000004
%endif

section	.bss
	char:	resb 1

section .text
	global	ft_putchar_fd

ft_putchar_fd:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	mov		[rel char], dil	; Move char parameter into char var

	mov		rax, WRITE		; Set write syscall index
	mov		rdi, rsi		; Set fd parameter as first write parameter
	lea		rsi, [rel char]	; Set char var pointer as second write parameter
	mov		rdx, 1			; Set 1 as third write parameter (size of a char)
	syscall					; Call write

	mov		rsp, rbp		; Remove stack frame and return 
	pop		rbp
	ret
