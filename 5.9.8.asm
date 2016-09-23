; Adam Allard
; 5.9.8


INCLUDE Irvine32.inc 

.data 

endMsg	BYTE  "Press any key to end: ",0

.code 
main PROC
	
		; set initial text color
	mov eax,black + (black * 16)		; moves black to foreground and background colors
	call SetTextColor					; found in Irvine32.inc

		; outer loop
 	mov ecx,16							; set outer loop

	L1:

			; inner loop
		push ecx						; new counter for inner loop
		mov ecx,16						; set inner loop

		L2:
				; print char 'X'
			push eax					; new eax 
			mov al,'X'					; place char X in al for WriteChar
			call WriteChar				; found in Irvine32.inc
			pop eax						; back to old eax

				; change char color
			inc al						; get next char color
			call SetTextColor			; found in Irvine32.inc
			
			loop L2						; counter starts at 16
 
		pop ecx							; back to old counter for outer loop
		call Crlf						; move to next line
	
			; change background color
		push eax						; new eax
		add ah,16d						; get next background color
		call SetTextColor				; found in Irvine32.inc
		pop eax							; back to old eax

		loop L1							; outer loop counter starts at 16

		; reset colors, print closing message
	mov eax,7							; resets text color
	call SetTextColor					; found in Irvine32.inc
	mov edx,OFFSET endMsg				; put message in edx for WriteString
	call WriteString					; found in Irvine32.inc
	call ReadString						; found in Irvine32.inc

	exit 
main ENDP 
END main

