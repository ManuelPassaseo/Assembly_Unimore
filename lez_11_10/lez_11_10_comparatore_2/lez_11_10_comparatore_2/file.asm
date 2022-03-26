.586
.model flat
.code


_compare2 proc
push ebp
mov ebp, esp
push esi
push edi
push ebx

mov eax, dword ptr[ebp + 8]
mov ebx, dword ptr[ebp + 12]
mov ecx, dword ptr[ebp + 16]

mov edx, 0
mov esi, 0


;calcola somma
Inizio_Somma:
	
	CMP esi, ecx
	JE Fine_Somma
	add edx, dword ptr[eax + esi * 4]
	INC esi
	JMP Inizio_Somma

Fine_Somma:
	mov esi, 0

Inizio:
	CMP esi, ecx
	JE Fine

	CMP dword ptr[ebx + esi * 4], edx
	JL Change
	INC esi
	JMP Inizio

Change:
	mov dword ptr[ebx + esi * 4], 0
	INC esi
	JMP Inizio
Fine:


pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret
_compare2 endp


end

