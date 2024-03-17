INCLUDE irvine32.inc

.data
INCLUDE hw1.inc

.code
main PROC
	mov eax, val1	; eax : val1
	add eax, eax	; eax : 2*val1
	add eax, eax	; eax : 4*val1
	mov ebx, eax	; ebx : 4*val1
	add ebx, ebx	; ebx : 8*val1
	add eax, ebx	; eax : 12*val1

	mov ebx, val2	; ebx : val2
	add eax, ebx	; eax : 12*val1 + val2
	add ebx, ebx	; ebx : 2*val2
	add eax, ebx	; eax : 12*val1 + 3*val2
	add ebx, ebx	; ebx : 4*val2
	add ebx, ebx	; ebx : 8*val2
	add ebx, ebx	; ebx : 16*val2
	add eax, ebx	; eax : 12*val1 + 19*val2
	add ebx, ebx	; ebx : 32*val2
	add eax, ebx	; eax : 12*val1 + 51*val2

	mov ebx, val3	; ebx : val3
	sub ebx, val4	; ebx : val3-val4
	add eax, ebx	; eax : 12*val1 + 51*val2 + val3 - val4
	add ebx, ebx	; ebx : 2*val3-2*val4
	add ebx, ebx	; ebx : 4*val3-4*val4
	add eax, ebx	; eax : 12*val1 + 51*val2 + 5*val3 - 5*val4

	call DumpRegs
	exit
main ENDP
END main