; Adam Allard
; 6.11.2.4

INCLUDE Irvine32.inc 


.data 
	inputGradeMsg	BYTE "Enter the grade average (0 - 400): ",0
	inputCreditMsg	BYTE "Enter the number of credits (1-30): ",0
	canRegisterMsg	BYTE "The student can register",0
	cantRegisterMsg	BYTE "The student cannot register.",0
	errorMsg		BYTE "Invalid entry.",0
	TRUE = 1
	FALSE = 0
	gradeAverage WORD ?
	OkToRegister BYTE ?

.code 
main PROC

	call Clrscr
	mov edx,OFFSET inputGradeMsg
	call WriteString
	call ReadInt
	call Crlf
	mov dword ptr gradeAverage,eax

	mov edx,OFFSET inputCreditMsg
	call WriteString
	call ReadInt
	call Crlf

Less_1_Credit:
	cmp eax,1					
	jae Above_30_Credits						; if (credits >= 1) check to see if too high
	mov edx,OFFSET errorMsg						; else display error message and end program
	call WriteString
	call Crlf
	jmp PrintCant

Above_30_Credits:
	cmp eax,30
	jbe MoveEaxEbx								; if (credits <= 30) continue on with life
	mov edx,OFFSET errorMsg						; else display error message and end program
	call WriteString
	call Crlf
	jmp PrintCant


MoveEaxEbx:
	mov ebx,eax									; ebx = numCredits
	mov eax,dword ptr gradeAverage				; eax = gradeAverage

Above_350:
	cmp eax,350
	jbe Above_250_And_Less_Equal_16_Credits		; if (GPA <= 350) - cannot
	mov OkToRegister,TRUE						; else if (GPA > 350) - can - continue
	jmp Print

Above_250_And_Less_Equal_16_Credits:
	cmp eax,250
	jbe Less_Equal_12_Credits					; if (GPA <= 250) - cannot
	cmp ebx,16									; else if (GPA > 250) - can - continue
	ja Less_Equal_12_Credits					;	if (GPA > 250) && (numCredits > 16) - cannot
	mov OkToRegister,TRUE						;   else if (GPA > 250) && (numCredits <= 16) - can - continue
	jmp Print
	
Less_Equal_12_Credits:
	cmp ebx,12
	ja PrintCant								; if (numCredits > 12) - cannot
	mov OkToRegister,TRUE						; else if (numCredits <= 12) - can - continue
	jmp Print
	
PrintCant:										; if (GPA <= 350) && ((GPA <= 250) && (numCredit > 16)) && (numCredits > 12) - cannot
	mov edx,OFFSET cantRegisterMsg
	call WriteString
	call Crlf
	jmp Ending

Print:											; if (GPA > 350) || ((GPA > 250) && (numCredits <= 16)) || (numCredits <= 12) - can
	mov edx,OFFSET canRegisterMsg
	call WriteString
	call Crlf

Ending:
	call WaitMsg
	exit
main ENDP

END main