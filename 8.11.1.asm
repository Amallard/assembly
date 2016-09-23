; Adam Allard
; 8.11.1

INCLUDE Irvine32.inc 
FindLargest PROTO, ptrArray:PTR DWORD,
				arrayLength:DWORD

.data 
	arrayOne DWORD 311h, -111h, 511h
	arrayTwo DWORD 522h, 8882h, -622h, 22h
	arrayTee DWORD 3h, 633h, -33h, 833h, 127h

.code 
main PROC

	INVOKE FindLargest, ADDR arrayOne, LENGTHOF arrayOne
	INVOKE FindLargest, ADDR arrayTwo, LENGTHOF arrayTwo
	INVOKE FindLargest, ADDR arrayTee, LENGTHOF arrayTee

	exit
main ENDP


FindLargest PROC USES esi ecx, 
		   ptrArray:PTR DWORD,
	        arrayLength:DWORD
	
	mov esi,ptrArray		; point esi to array
	mov eax,[esi]			; move first element in array to eax

	mov ecx,arrayLength		; counter for num elements in array
L1:
	add esi,4				; get next element in array
	.IF SDWORD PTR [esi] > eax			; if next element is greater than current, move to eax
		mov eax,[esi]
	.ENDIF
	loop L1

	ret
FindLargest ENDP

END main