INCLUDE irvine32.inc

.data
INCLUDE hw5_2.inc
prompt BYTE "Concatenated string : ", 0

.code
main PROC
	INVOKE str_length, OFFSET targetStr
	mov ebx, eax
	INVOKE str_length, OFFSET sourceStr
	cmp eax, ebx
	ja L1
	cld
	mov esi, OFFSET sourceStr
	mov edi, OFFSET targetStr
	add edi, ebx
	mov ecx, SIZEOF sourceStr
	rep movsb
	mov edx, OFFSET prompt
	call writeString
	mov edx, OFFSET targetStr
	call writeString
	call Crlf
L1:	exit
main ENDP
END main