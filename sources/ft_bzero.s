section .text
	global	_ft_bzero

_ft_bzero:
	push	rbp				; Set up a new stack frame
	mov		rbp, rsp

	xor
