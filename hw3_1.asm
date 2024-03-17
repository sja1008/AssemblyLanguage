TITLE HW1

INCLUDE irvine32.inc

.data
buffer BYTE 81 DUP(0)
len dword ?
input BYTE "Type_A_String_To_Reverse: ", 0
output BYTE "Reversed_String: ", 0
ending BYTE "Bye!", 0

.code
main PROC
beginwhile:
	mov edx, OFFSET input
	call writeString

	mov edx, OFFSET buffer
	mov ecx, SIZEOF buffer
	call readString
	mov len, eax

	cmp buffer[0], 0
	je endwhile

	cmp len, 40
	ja beginwhile

	mov ecx, len
	mov esi, 0
L1:	movzx eax, buffer[esi]
	push eax
	inc esi
	Loop L1

	mov ecx, len
	mov esi, 0
L2:	pop eax
	mov buffer[esi], al
	inc esi
	Loop L2

	call convert

	mov ebx, edx
	mov edx, OFFSET output
	call writeString

	mov edx, ebx
	call writeString
	mov al, 00001010b
	call writeChar

	jmp beginwhile
endwhile:
	mov edx, OFFSET ending
	call writeString
	mov al, 00001010b
	call writeChar
	exit
main ENDP

convert PROC
	mov ecx, len
	mov esi, 0
L1:	cmp buffer[esi], 01000001b
	jl S2

	cmp buffer[esi], 01111010b
	jg S2

	cmp buffer[esi], 01011010b
	jle S1

	cmp buffer[esi], 01100001b
	jl S2

S1:	xor buffer[esi], 00100000b
S2:	inc esi
	loop L1
	ret
convert ENDP

END main