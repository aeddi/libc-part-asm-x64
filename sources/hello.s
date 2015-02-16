%define	MACH_SYSCALL(n)		0x2000000 | n
%define	EXIT				1
%define	WRITE				4
%define	STDOUT				1

section .data
	msg:    db      "Hello, world!", 10
	.len:   equ     $ - msg

section .text
	global _hello

_hello:
    mov     rax, MACH_SYSCALL(WRITE)
    mov     rdi, STDOUT
    mov     rsi, msg
    mov     rdx, msg.len
    syscall
 
    mov     rax, MACH_SYSCALL(EXIT)
    mov     rdi, 0
    syscall
