; Adam Allard
; 6.11.2.6

INCLUDE Irvine32.inc 


.data 
	
CaseTable BYTE 1
		    DWORD AND_op
EntrySize = ($ - CaseTable)
		  BYTE 2
		    DWORD OR_op
		  BYTE 3
		    DWORD NOT_op
		  BYTE 4
		    DWORD XOR_op
		  BYTE 5
		    DWORD Exiting
NumberOfEntries = ($ - CaseTable) / EntrySize
prompt BYTE "Enter menu number (1 - 5): ",0

andMsg	BYTE "1. x AND y",0
orMsg	BYTE "2. x OR y",0
notMsg	BYTE "3. NOT x",0
xorMsg	BYTE "4. x XOR y",0
exitMsg	BYTE "5. Exit Program"

inputMsg BYTE "Enter number in hex: ",0

hexNum WORD ?

.code 
main PROC
	call Menu
	mov edx,OFFSET prompt
	call WriteString
	call ReadInt
	call Crlf
	mov ebx,OFFSET CaseTable
	mov ecx,NumberOfEntries
L1:
	cmp al,[ebx]
	jne	L2
	call NEAR PTR [ebx + 1]
	jmp L3

L2:
	add ebx,EntrySize
	loop L1

L3:
	call WaitMsg
	exit
main ENDP

menu PROC
	mov edx,OFFSET andMsg
	call WriteString
	call Crlf
	mov edx,OFFSET orMsg
	call WriteString
	call Crlf
	mov edx,OFFSET notMsg
	call WriteString
	call Crlf
	mov edx,OFFSET XorMsg
	call WriteString
	call Crlf
	mov edx,OFFSET exitMsg
	call WriteString
	call Crlf
	
	ret
menu ENDP

AND_op PROC
	mov edx,OFFSET andMsg
	call WriteString
	call Crlf

	call GetHexNum
	mov DWORD PTR hexNum,eax
	call GetHexNum
	and eax, DWORD PTR hexNum
	call ShowResult

	ret
AND_op ENDP



OR_op PROC
	mov edx,OFFSET orMsg
	call WriteString
	call Crlf
	
	call GetHexNum
	mov DWORD PTR hexNum,eax
	call GetHexNum
	or eax, DWORD PTR hexNum
	call ShowResult

	ret
OR_op ENDP



NOT_op PROC
	mov edx,OFFSET notMsg
	call WriteString
	call Crlf
	
	call GetHexNum
	not eax
	call ShowResult

	ret
NOT_op ENDP



XOR_op PROC
	mov edx,OFFSET xorMsg
	call WriteString
	call Crlf
	
	call GetHexNum
	mov DWORD PTR hexNum,eax
	call GetHexNum
	xor eax, DWORD PTR hexNum
	call ShowResult

	ret
XOR_op ENDP



Exiting PROC
	mov edx,OFFSET exitMsg
	call WriteString
	call Crlf
	ret
Exiting ENDP

GetHexNum PROC
	mov edx,OFFSET inputMsg
	call WriteString
	call ReadHex

	ret
GetHexNum ENDP


ShowResult PROC
	mov edx,eax
	call Crlf
	call WriteHex
	call Crlf	
	call Crlf
	ret
ShowResult ENDP


END main