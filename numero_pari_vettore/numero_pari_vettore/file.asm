.586
.model flat
.code

_pari proc
push ebp
mov ebp, esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp + 8]
mov esi, 0
mov edi, 0
mov ecx, 2

;pari
Inizio:

	CMP esi, dword ptr[ebp + 12]
	JE Fine

	mov eax, dword ptr[ebx + esi * 4]	

	CDQ 
	IDIV ecx
	
	INC esi

	CMP edx, 0
	JE Incrementa
	JMP Inizio

Incrementa:
INC edi
JMP Inizio

Fine:

mov eax, edi

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_pari endp

end