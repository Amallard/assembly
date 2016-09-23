; Adam Allard
; 4.10.7

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

	source BYTE "This is the source string", 0
	target BYTE SIZEOF source DUP('#')

.code
main proc
	
	mov esi, 0					; set s index to 0
	mov edi, SIZEOF source - 1	; set d index to last char in source
	mov ecx, SIZEOF source		; set counter to size of source

L1:
	mov al, source[edi]			; grab char in source, put in al (edi is moving from aft to forward in source)
	mov target[esi], al			; store al in target (esi is moving from forward to aft in target)
	inc esi						; add one to esi to move up through target
	dec edi						; subtract one from edi to move back through source
	loop L1						; loop while there are still letters in source

	invoke ExitProcess,0
main endp
end main