; Adam Allard
; 7.10.5
; source: https://media.pearsoncmg.com/ph/esm/ecs_irvine_x86_6/videos/Chapt9_Exercise7/index.html
INCLUDE Irvine32.inc 
Print PROTO, count:DWORD
	
	FIRST_PRIME = 2
	LAST_PRIME = 1000

.data 
	
	sieve BYTE LAST_PRIME DUP(0)

.code 
main PROC

	mov esi,FIRST_PRIME

	.WHILE esi < LAST_PRIME
		.IF sieve[esi] == 0
			call CrossOutMultiples
		.ENDIF
		inc esi
	.ENDW

	INVOKE Print, LAST_PRIME
	
			; END PROGRAM
	call Crlf
	call WaitMsg
	exit

main ENDP

CrossOutMultiples PROC

	push eax
	push esi
	mov eax,esi
	add esi,eax

L1: cmp esi,LAST_PRIME
	ja L2
	mov sieve[esi],1
	add esi,eax
	jmp L1

L2:
	pop esi
	pop eax

	ret
CrossOutMultiples ENDP

Print PROC,
	count:DWORD

	mov esi,1
	mov eax,0
	mov ecx,count

L1:	mov al,sieve[esi]
	.IF al == 0
		mov eax,esi
		call WriteDec
		call Crlf
	.ENDIF
	inc esi
	Loop L1

	ret
Print ENDP
END main

