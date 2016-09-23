; Adam Allard
; 9.10.3

INCLUDE Irvine32.inc 

Str_remove PROTO, pos:PTR BYTE,
				  car:DWORD

.data 
targetStr BYTE "abcxxxxdefghijklmop",0
charMsg BYTE "Enter amount of chars to remove: ",0
charNum DWORD ?
posMsg BYTE "Enter position to start removing: ",0
posNum DWORD ?

.code 
main PROC
	call Clrscr
	
	mov edx,OFFSET charMsg
	call WriteString
	call ReadDec
	mov charNum,eax
	
	mov edx,OFFSET posMsg
	call WriteString
	call ReadDec
	mov posNum,eax
	call Crlf

	INVOKE Str_remove, ADDR [targetStr + eax],charNum

	mov edx,OFFSET targetStr
	call WriteString

	call Crlf
	call Crlf
	call WaitMsg
	exit
main ENDP


Str_remove PROC, pos:PTR BYTE,
				 car:DWORD

	INVOKE Str_length,pos	; get length of string into eax

	mov ecx,eax				; set counter to length
	inc ecx					; add one to length for null terminator 
	sub ecx,car				; subtract amount to remove from counter

	mov esi,pos				; set postion to esi
	add esi,car				; move position amount of chars to remove ahead
	mov edi,pos				; put remaining chars back into string

	cld						; clears direction flag
	rep movsb				; repeats string - copies byte
	ret

Str_remove ENDP


END main