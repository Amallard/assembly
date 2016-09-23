; Adam Allard
; 7.10.7
; source: https://media.pearsoncmg.com/ph/esm/ecs_irvine_x86_6/videos/ch7_5.html
INCLUDE Irvine32.inc 

	
.data 
	
	p1 BYTE "Enter multiplicand: ",0
	p2 BYTE "Enter multiplier: ",0
	p3 BYTE "Product: ",0

.code 
main PROC

	call Clrscr
	
	mov edx,OFFSET p1
	call WriteString
	call ReadDec
	mov ebx,eax
	call Crlf

	mov edx,OFFSET p2
	call WriteString
	call ReadDec
	call Crlf

	call BitwiseMultiply

	mov edx,OFFSET p3
	call WriteString
	call WriteDec
	call Crlf

			; END PROGRAM
	call Crlf
	call WaitMsg
	exit

main ENDP

BitwiseMultiply PROC

	mov edx,eax		; copy
	mov eax,0		; accumulator	
	mov cl,0		; bit counter

L1: 
	shr edx,1
	jnc L2			; check carry flag

	mov esi,ebx		; shift multiplicand
	shl esi,cl
	add eax,esi


L2: inc cl
	cmp cl,32
	jb L1
	



	ret
BitwiseMultiply ENDP

END main

