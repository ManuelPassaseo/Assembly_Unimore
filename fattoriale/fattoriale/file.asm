.586
.model flat
.code

_fattoriale proc
push ebp
mov ebp, esp
push esi
push edi
push ebx

mov eax, dword ptr[ebp + 8]
mov ecx, eax
Inizio:
	DEC ecx
	CMP ecx, 1
	JE Fine

	IMUL ecx
	JMP Inizio

Fine:

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_fattoriale endp


end