TITLE HW2

INCLUDE irvine32.inc

.data
txt BYTE 41 DUP(0)
key BYTE 11 DUP(0)
txtLen dword ?
keyLen dword ?
txtInput BYTE "Enter a plain text : ", 0
keyInput BYTE "Enter a key : ", 0
original BYTE "Original Text : ",0
encrypted BYTE "Encrypted Text : ", 0
decrypted BYTE "Decrypted Text : ", 0
ending BYTE "Bye!", 0

.code
main PROC
beginwhile:
	mov edx, OFFSET txtInput
	call writeString

	mov edx, OFFSET txt
	mov ecx, SIZEOF txt
	call readString
	mov txtLen, eax

	cmp txt[0], 0
	je endwhile

	mov edx, OFFSET keyInput
	call writeString

	mov edx, OFFSET key
	mov ecx, SIZEOF key
	call readString
	mov keyLen, eax

	cmp key[0], 0
	je endwhile

	mov al, 00001010b
	call writeChar

	mov edx, OFFSET original
	call writeString

	mov edx, OFFSET txt
	call writeString
	mov al, 00001010b
	call writeChar

	call translate

	mov edx, OFFSET encrypted
	call writeString

	mov edx, OFFSET txt
	call writeString
	mov al, 00001010b
	call writeChar

	call translate

	mov edx, OFFSET decrypted
	call writeString

	mov edx, OFFSET txt
	call writeString
	mov al, 00001010b
	call writeChar
	call writeChar

	jmp beginwhile
endwhile:
	mov edx, OFFSET ending
	call writeString
	mov al, 00001010b
	call writeChar
	exit
main ENDP

translate PROC
	mov ecx, txtLen
	mov esi, 0
	mov edi, 0
L1:	cmp edi, keyLen
	jne next
	mov edi, 0
next:
	mov al, key[edi]
	xor txt[esi], al
	inc esi
	inc edi
	loop L1
	ret
translate ENDP

END MAIN