INCLUDE irvine32.inc

.data
INCLUDE hw5_3.inc
prompt BYTE "Position value : ", 0
cnt DWORD 0

.code
main PROC
	mov edi, OFFSET target
	mov esi, OFFSET source
	mov ecx, LENGTHOF target
	dec ecx
L2:	mov al, [esi]
	cld
	repne scasb
	jnz L3
	push ecx
	push edi
	dec edi
	mov pos, edi
	sub pos, OFFSET target
	mov ecx, LENGTHOF source
	dec ecx
L1:	mov ebx, OFFSET target
	add ebx, LENGTHOF target
	cmp edi, ebx
	jae L3
	mov al, [esi]
	cmp al, [edi]
	jne L4
	inc esi
	inc edi
	loop L1
	inc cnt
	cmp cnt, 2
	je L5
L4:	mov esi, OFFSET source
	pop edi
	pop ecx
	jmp L2
L5: mov edx, OFFSET prompt
	call writeString
	mov eax, pos
	call writeDec
	call Crlf
L3:	exit
main ENDP
END main