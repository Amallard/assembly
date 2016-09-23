; Adam Allard
; 3.10.1

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov eax, 4
	mov ebx, 3
	mov ecx, 2
	mov edx, 1    ; move easy numbers to calculate to the registers
	add	eax,ebx   ; (A+B) place in A	
	add	ecx,edx	  ; (C+D) place in C	
	sub eax,ecx   ; (A-C) place in A		 A = (A+B)-(C+D) 

	invoke ExitProcess,0
main endp
end main