.586
.model flat
.code

_check proc
push ebp
mov ebp, esp
push esi
push edi
push ebx

mov eax, 0 ;numero
mov ebx, dword ptr[ebp + 8]
mov esi, 0

Inizio:
	mov dl, byte ptr[ebx + esi]
	CMP dl, 0
	JE Fine

	call funznear
	INC esi
	JMP Inizio
	Fine:

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret




_check endp

funznear proc
push esi
push ebx


mov dl, byte ptr[ebx + esi]

	CMP dl, 48
	JGE Check1
	JMP Fine

Check1:
CMP dl, 57
JLE Incrementa
JMP Fine

Incrementa:
	INC eax


Fine:

pop ebx
pop esi
ret



funznear endp



end

