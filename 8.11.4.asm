; Adam Allard
; 8.11.4

INCLUDE Irvine32.inc 
FindThrees PROTO, ptrArray:PTR DWORD,
				arrayLength:DWORD

.data 
	arrayOne DWORD 7, 7, 5, 3, 3, 5, 3
	arrayTwo DWORD 8, 6, 5, 7, 4, 3, 2, 3, 3, 3
	arrayTee DWORD 7, 6, 8, 5, 3, 3, 3, 5, 2
	arrayFor DWORD 1, 2, 3, 4, 5
	arrayFiv DWORD 3, 3, 3, 0, 0, 0, 3, 3, 3
	arraySix DWORD 7, 6, 5, 4, 3, 5, 4

	counter BYTE 0
	flag BYTE 0
	num DWORD ?


.code 
main PROC
	
	INVOKE FindThrees, ADDR arrayOne, LENGTHOF arrayOne
	INVOKE FindThrees, ADDR arrayTwo, LENGTHOF arrayTwo
	INVOKE FindThrees, ADDR arrayTee, LENGTHOF arrayTee
	INVOKE FindThrees, ADDR arrayFor, LENGTHOF arrayFor
	INVOKE FindThrees, ADDR arrayFiv, LENGTHOF arrayFiv
	INVOKE FindThrees, ADDR arraySix, LENGTHOF arraySix

	exit
main ENDP



FindThrees PROC USES esi ecx ebx, 
		   ptrArray:PTR DWORD,
	        arrayLength:DWORD

	mov counter,0
	mov flag, 0
	mov esi,ptrArray		; point esi to array
	mov eax,[esi]			; move first element in array to eax

	mov ecx,arrayLength		; counter for num elements in array
L1:
	add esi,4				; get next element in array
	mov ebx,3
	.IF [esi] == ebx
		inc counter
	.ELSEIF [esi] != ebx && counter < 3
		mov counter,0
	.ENDIF

	loop L1

	.IF counter >= 3
		mov flag,1
	.ENDIF

	ret
FindThrees ENDP


END main