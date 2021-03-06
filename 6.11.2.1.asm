; Adam Allard
; 7.10.4
; source: https://media.pearsoncmg.com/ph/esm/ecs_irvine_x86_6/videos/ch7_4.html

INCLUDE Irvine32.inc 

.data 
	key BYTE -2, 4, 1, 0, -3, 5, 2, -4, -4, 6
	keySize = $ - key
	plainText BYTE "This plaintext message will be encrypted.",0

.code 
main PROC
	call Clrscr

	mov esi,OFFSET plainText

L1: mov edi,OFFSET key
	mov ecx,keySize
	call Encrypt				; encrypts a block of text
	jnz L1

	mov edx,OFFSET plainText	; cypher text
	call WriteString
	call Clrf

	exit

main ENDP

Encrypt PROC

L1: push ecx
	
	cmp BYTE PTR[esi],0
	je L4

	mov cl,[edi]
	cmp cl,0				
	jge L2
	neg cl
	rol BYTE PTR[esi],cl
	jmp L3


L2: ror BYTE PTR[esi],cl


L3: inc esi
	inc edi

	pop ecx
	loop L1

	or eax,1
	jmp L5

L4: pop ecx
L5:	ret

Encode ENDP

END main

