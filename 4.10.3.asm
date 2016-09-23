; Adam Allard
; 4.10.3

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	array DWORD 0, 2, 5, 9, 10
	acc DWORD 0

.code
main proc
	 
	mov	esi, 0					; set index to zero
	mov eax, array[esi]			; get first element in array and store in eax
	mov	ecx, 4					; set counter to 4
L1:
	mov ebx, array[esi + 4]		; get next byte in array, store in ebx
	sub ebx, eax				; subtract eax from ebx, result in ebx
	add acc, ebx				; add ebx to accumulator
	mov eax, array[esi + 4]		; get next byte in array, store in eax
	add esi, 4					; move to next byte for index
	loop L1						; move back to loop while ecx > 0

	invoke ExitProcess,0
main endp
end main