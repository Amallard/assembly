; Adam Allard
; 4.10.1

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	bigEndian BYTE 12h, 34h, 56h, 78h
	littleEndian DWORD ?


.code
main proc
	 mov esi, 0								; set index to zero
	 
	 mov al, bigEndian[esi + 3]				; get last byte in big and store in al
	 movzx eax, al							; move al into eax with extended zeros
	 mov ah, bigEndian[esi + 2]				; get second to last byte in big and store in ah
	 mov littleEndian[esi], eax				; take eax and move into first byte in little
												; now the last half of big is in the first half of little
	 mov bl, bigEndian[esi + 1]				; get second byte in big and store in bl
	 movzx ebx, bl							; move bl into ebx with extended zeros
	 mov bh, bigEndian[esi]					; get first byte in big and store in bh
	 mov littleEndian[esi + 2], ebx			; take ebx and move into third byte in little
												; now the first half of big is in the last half of little

	invoke ExitProcess,0
main endp
end main