; Adam Allard
; 9.10.3

INCLUDE Irvine32.inc 

Str_nextWord PROTO, ptrStr:PTR BYTE,
				 delimiter:BYTE 

.data 
target BYTE "Johnson,Calvin",0
acc BYTE 0

.code 
main PROC
	
	mov edx,OFFSET target
	call WriteString
	call Crlf

	INVOKE Str_nextWord, ADDR target, ','

	mov edx,eax
	call WriteString


	call Crlf
	call Crlf
	call WaitMsg
	exit
main ENDP


Str_nextWord PROC, ptrStr:PTR BYTE,
				delimiter:BYTE 

	push esi
	mov al,delimiter
	mov esi,ptrStr
	cld

L1:
	lodsb						; load accumulator from string
	cmp al,0					; check if end of string
	je L3						; if so, jump to L3
	cmp al,delimiter			; check if delimiter
	jne L1						; if not, back to L1

L2:
	mov BYTE PTR[esi-1],0		; set delimiter pos to null
	mov eax,esi					; move next word into eax
	jmp L4						; go to L4 to end

L3: 
	or al,1						; if end of string, clear zero flag

L4:
	pop esi						
	ret

Str_nextWord ENDP


END main