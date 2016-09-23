; Adam Allard
; 3.10.3

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
var1 BYTE 255
var2 SBYTE -128
var3 WORD 65535
var4 SWORD -32768
var5 DWORD 4294967294
var6 SDWORD -2147483648
var7 FWORD 140737488355327
var8 QWORD 9223372036854775807
var9 TBYTE 604462909807314587353087
var10 REAL4 1.5
var11 REAL8 1.0E-25
var12 REAL10 -1.2594E+10

.code
main proc
	 

	invoke ExitProcess,0
main endp
end main