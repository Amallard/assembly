; Adam Allard
; 5.9.4


INCLUDE Irvine32.inc 

.data 
	intMsg			BYTE  "Enter int: ",0 
	sumMsg			BYTE  "Sum: ",0
	continueMsg		BYTE  "Press any key to continue: ",0

	num1  DWORD ? 
	num2  DWORD ? 
	sum	  DWORD ? 

.code 
main PROC
 
		; set loop counter to loop 3 times 
	mov ecx,3
L1:
		; clear screen and move cursor to center 
	call Clrscr					; clear screen 
	mov dl, 30					; set column 
	mov dh, 11					; set row 
	call Gotoxy					; move cursor - found in Irvine32.inc

		; prompt user to input first int
	mov edx,OFFSET intMsg		; put message in edx for WriteString
	call WriteString			; found in Irvine32.inc
	call ReadInt				; found in Irvine32.inc
	mov num1, eax				; store value
 
		; move cursor to next line
	mov dl, 30					; set column 
	mov dh, 12					; set row 
	call Gotoxy					; move cursor - found in Irvine32.inc
	
		; prompt user to input second int
	mov edx,OFFSET intMsg		; put message in edx for WriteString
	call WriteString			; found in Irvine32.inc
	call ReadInt				; found in Irvine32.inc
	mov num2, eax				; store value
	
		; calculate sum	
	mov eax, num2				; move num2 to eax
	add	eax, num1				; add num1 to eax
	
		; move cursor to next line 
	mov dl, 30					; set column 
	mov dh, 13					; set row 
	call Gotoxy					; move cursor - found in Irvine32.inc
	
		; display sum
	mov edx, OFFSET sumMsg		; put message in edx for WriteString
	call WriteString			; found in Irvine32.inc
	call WriteInt				; found in Irvine32.inc

		; move cursor to next line
	mov dl, 30					; set column 
	mov dh, 14					; set row 
	call Gotoxy					; move cursor - found in Irvine32.inc
	
		; prompt user to continue
	mov edx,OFFSET continueMsg	; put message in edx for WriteString
	call WriteString			; found in Irvine32.inc
	call ReadString				; found in Irvine32.inc

	loop L1						; loop back to L1 - ecx starts at 3

exit 
main ENDP 
END main