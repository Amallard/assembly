; Adam Allard
; 5.9.6

INCLUDE Irvine32.inc 

STR_COUNT = 20					; number of strings
STR_SIZE = 10					; size of each string

.data 
	aString BYTE STR_SIZE DUP(0),0
	endMsg		BYTE  "Press any key to end: ",0

.code 
main PROC
	mov ecx,STR_COUNT			; set counter to amount of strings needed
L1: 
	mov esi,OFFSET aString		; set pointer string
	mov eax,STR_SIZE			; using eax as temp counter for CreateRandomString procedure
	call CreateRandomString

	mov edx,OFFSET aString		; put string into edx to use WriteString
	call WriteString			; found in Irvine32.inc
	call Crlf					; jump to next line

	loop L1

	mov edx,OFFSET endMsg		; put message in edx for WriteString
	call WriteString			; found in Irvine32.inc
	call ReadString				; found in Irvine32.inc

	exit 
main ENDP 


CreateRandomString PROC
 ; receives: EAX = length of string
 ; ESI points to string

	push ecx				; push counter into proc
	mov ecx,eax				; put temp counter eax into counter
 L1:
	mov eax,26				; range 0-25
	call RandomRange		; found in Irvine32.inc
	add al,'A'				; add ASCII char num to random num to generate random char
	mov [esi],al			; put random char into string

	inc esi					
	loop L1

	pop ecx					; give ecx back to previous proc
	ret
CreateRandomString ENDP

END main