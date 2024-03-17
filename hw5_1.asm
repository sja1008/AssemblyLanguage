INCLUDE irvine32.inc

.data
INCLUDE hw5_1.inc
BInput BYTE "Before sort : ", 0
AInput BYTE "After sort : ", 0
Count BYTE ", ", 0
Bye BYTE "Bye!", 0

.code
main PROC
	mov edx, OFFSET BInput
	call writeString
	mov ecx, LenData
	dec ecx
	mov esi, OFFSET ArrData
L1:	mov eax, [esi]
	call writeHex
	add esi, 4
	mov edx, OFFSET Count
	call writeString
	loop L1
	mov eax, [esi]
	call writeHex
	call Crlf
	call BubbleSortOdd
	call BubbleSortEven
	mov edx, OFFSET AInput
	call writeString
	mov ecx, LenData
	dec ecx
	mov esi, OFFSET ArrData
L2:	mov eax, [esi]
	call writeHex
	add esi, 4
	mov edx, OFFSET Count
	call writeString
	loop L2
	mov eax, [esi]
	call writeHex
	call Crlf
	mov edx, OFFSET Bye
	call writeString
	call Crlf
	exit
main ENDP

BubbleSortOdd PROC USES eax ecx esi
	mov eax, LenData
	mov edx, 0
	mov ebx, 2
	div ebx
	mov ecx, LenData
	sub ecx, eax
	dec ecx
L1:	push ecx
	mov esi, OFFSET ArrData
L2: mov ax, WORD PTR [esi+2]
	cmp WORD PTR [esi+10], ax
	jg L3
	jl L4
	mov bx, WORD PTR [esi]
	cmp WORD PTR [esi+8], bx
	jl L3
L4:	mov eax, [esi]
	xchg eax, [esi+8]
	mov [esi], eax
L3:	add esi, 8
	loop L2
	pop ecx
	loop L1
	ret
BubbleSortOdd ENDP

BubbleSortEven PROC USES eax ecx esi
	mov eax, LenData
	mov edx, 0
	mov ebx, 2
	div ebx
	mov ecx, eax
	dec ecx
L1:	push ecx
	mov esi, OFFSET ArrData
	add esi, 4
L2: mov ax, WORD PTR [esi+2]
	cmp WORD PTR [esi+10], ax
	jl L3
	jg L4
	mov bx, WORD PTR [esi]
	cmp WORD PTR [esi+8], bx
	jg L3
L4:	mov eax, [esi]
	xchg eax, [esi+8]
	mov [esi], eax
L3:	add esi, 8
	loop L2
	pop ecx
	loop L1
	ret
BubbleSortEven ENDP

END main