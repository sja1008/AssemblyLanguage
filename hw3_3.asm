TITLE HW3

INCLUDE irvine32.inc

.data
sent BYTE 81 DUP(0)
wrd BYTE 41 DUP(0)
sentLen dword ?
wrdLen dword ?
sentInput BYTE "Type_A_String: ", 0
wrdInput BYTE "A_Word_for_Search: ", 0
found BYTE "Found", 0
nfound BYTE "Not found", 0
ending BYTE "Bye!", 0

.code
main PROC
beginwhile:
	mov edx, OFFSET sentInput
	call writeString

	mov edx, OFFSET sent
	mov ecx, SIZEOF sent
	call readString
	mov sentLen, eax

	cmp sent[0], 0
	je endwhile

	cmp sentLen, 40
	ja beginwhile

	mov edx, OFFSET wrdInput
	call writeString

	mov edx, OFFSET wrd
	mov ecx, SIZEOF wrd
	call readString
	mov wrdLen, eax

	cmp wrd[0], 0
	je endwhile

	call search

	jmp beginwhile
endwhile:
	mov edx, OFFSET ending
	call writeString
	mov al, 00001010b
	call writeChar
	exit
main ENDP

search PROC
	mov esi, wrdLen
	dec esi
	cmp wrd[esi], 00101110b
	je S6

	mov ecx, sentLen
	mov esi, 0
	mov edi, 0
L1:	cmp sent[esi], 00100000b
	jne S2
	inc esi
	mov edi, 0
S2:	mov al, wrd[edi] 
	cmp sent[esi], al
	jne S3
	inc esi
	inc edi
	cmp edi, wrdLen
	je S4
	loop L1
	jmp S6
S3: mov edi, 0
L2: inc esi
	cmp sent[esi], 00100000b
	je L1
	loop L2
	jmp S6
S4: cmp sent[esi], 00101110b
	je S5
	cmp sent[esi], 00101100b
	je S5
	cmp sent[esi], 00000000b
	je S5
	cmp sent[esi], 00100000b
	jne L1
S5:	mov edx, OFFSET found
	call writeString
	mov al, 00001010b
	call writeChar
	ret
S6: mov edx, OFFSET nfound
	call writeString
	mov al, 00001010b
	call writeChar
	ret
search ENDP
END main