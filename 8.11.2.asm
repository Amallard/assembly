; Adam Allard
; 8.11.2
; source: https://media.pearsoncmg.com/ph/esm/ecs_irvine_x86_6/videos/Chapt8_Exercise9/index.html

INCLUDE Irvine32.inc 

SetColor PROTO forecolor:BYTE, backcolor:BYTE
WriteColorChar PROTO char:byte, forecolor:BYTE, backcolor:BYTE
PrintRowOdd PROTO color:BYTE
PrintRowEven PROTO color:BYTE

.data 

.code 
main PROC

	mov ecx,4
L1:
	INVOKE PrintRowOdd, gray
	call Crlf
	INVOKE PrintRowEven, gray
	call Crlf
	Loop L1


	INVOKE SetColor, lightGray, black
	call Crlf
	call WaitMsg
	exit
main ENDP


PrintRowOdd PROC uses ecx,
	color:BYTE

	push ecx
	mov ecx,4

L1:	INVOKE WriteColorChar, ' ', color, color
	INVOKE WriteColorChar, ' ', color, color
	INVOKE WriteColorChar, ' ', white, white
	INVOKE WriteColorChar, ' ', white, white
	Loop L1

	pop ecx
	ret
PrintRowOdd ENDP

PrintRowEven PROC uses ecx,
	color:BYTE

	push ecx
	mov ecx,4

L1:	INVOKE WriteColorChar, ' ', white, white
	INVOKE WriteColorChar, ' ', white, white
	INVOKE WriteColorChar, ' ', color, color
	INVOKE WriteColorChar, ' ', color, color
	Loop L1

	pop ecx
	ret
PrintRowEven ENDP


WriteColorChar PROC USES eax,
			       char:BYTE,
			  forecolor:BYTE, 
			  backcolor:BYTE,

	INVOKE SetColor, forecolor, backcolor
	mov	al,char
	call WriteChar

	ret
WriteColorChar ENDP



SetColor PROC, forecolor:BYTE, 
			   backcolor:BYTE

	movzx eax,backcolor
	shl   eax,4
	or    al,forecolor
	call  SetTextColor

	ret
SetColor ENDP


END main