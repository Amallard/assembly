; Adam Allard
; 9.10.2

INCLUDE Irvine32.inc 

Str_concat PROTO,
		target:PTR BYTE,
		source:PTR BYTE

.data 
targetStr BYTE "ABCDEF",10 DUP(0)
sourceStr BYTE "GHI",0

.code 
main PROC
	call Clrscr
	INVOKE Str_concat, ADDR targetStr, ADDR sourceStr

	mov edx,OFFSET targetStr
	call WriteString
	call Crlf
	call Crlf

	call WaitMsg
	exit
main ENDP



Str_concat PROC uses eax ebx ecx esi edi,
			target:PTR BYTE,
			source:PTR BYTE

	mov ecx,SIZEOF source		; set counter to size of source

	mov esi,source				; move index to source
	INVOKE Str_length,target	; get length of target in eax
	mov edi,target				; move target to edi

L1:
	add edi,eax					; to go end of target
	mov ebx,[esi]				; put current char from esi into ebx
	mov [edi],ebx				; put that char to end of target

	inc eax						; go to new end of target
	inc esi						; get next char
	loop L1						; repeat for size of source

	ret
Str_concat ENDP


END main