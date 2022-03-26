.586
.model flat
.code

_fattoriale proc
push ebp
mov ebp, esp
push esi
push edi
push ebx


mov ebx, dword ptr[ebp + 8]
mov ecx, dword ptr[ebp + 12]

mov esi, 0



Inizio:
	CMP esi, dword ptr[ebp + 16]
	JE Fine

	mov eax, dword ptr[ebx + esi * 4]
	CMP eax, 0
	JE Caso_Particolare

	mov edi, eax

A:
	CMP edi, 1
	JE B

	IMUL edi

B:
	
	INC esi
	JMP Inizio

Caso_Particolare:
	mov dword ptr[ecx + esi * 4 ], 1
	INC esi
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