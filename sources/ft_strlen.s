section .text
	global _ft_strlen

_ft_strlen:
	push	rbp		
	mov		rbp, rsp

	mov		rax, -1
while:
	inc		rax
	cmp		[rdi + rax], byte 0
	jne		while

	mov		rsp, rbp
	pop		rbp
	ret
