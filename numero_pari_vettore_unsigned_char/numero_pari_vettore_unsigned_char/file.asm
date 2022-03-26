.586
.model flat
.code

_pari proc
push ebp
mov ebp, esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp + 8] ;indirizzo
mov cl, 2 ;divisore
mov dl, 0 ;contatore
mov esi, 0

Inizio:

	CMP esi, dword ptr[ebp + 12]
	JE Fine

	mov ax, word ptr [ebx + esi]
	mov AH, 0
	DIV cl

	INC esi
	CMP AH, 0
	JE Incrementa
	JMP Inizio

Incrementa:
INC dl
JMP Inizio

Fine:
mov al, dl

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_pari endp


end