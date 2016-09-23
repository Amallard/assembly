; Adam Allard
; 3.10.2

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

MON EQU 1
TUE EQU 2
WED EQU 3
THU EQU 4
FRI EQU 5
SAT EQU 6
SUN EQU 7

.data
list BYTE MON,TUE,WED,THU,FRI,SAT,SUN
ListSize = ($ - list)

.code
main proc
	 

	invoke ExitProcess,0
main endp
end main