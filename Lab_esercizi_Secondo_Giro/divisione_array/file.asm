.586
.model flat
.code

_divisione_array proc
push ebp
mov ebp, esp
push esi
push edi
push ebx

CMP dword ptr[ebp + 12], 0
JE Non_possibile

mov ebx, dword ptr[ebp + 8]
mov edi, dword ptr[ebp + 12]
mov ecx, dword ptr[ebp+ 20]
mov esi, 0

Inizio:
	CMP esi, dword ptr[ebp + 16]
	JE Fine
	mov eax, dword ptr[ebx + esi * 4]
	CDQ
	IDIV edi
	mov dword ptr[ebx + esi * 4], eax
	mov dword ptr[ecx + esi * 4], edx

	INC esi
	JMP Inizio
	
Fine:
mov esi, 0
A: 
	CMP esi, dword ptr[ebp + 16]
	JE B

	CMP dword ptr[ecx + esi * 4], 0
	JNE NON_TUTTI_ZERO
	INC esi
	JMP A
B:
	mov eax, -1
	JMP Stop
NON_TUTTI_ZERO:
mov esi, 0	
C1:
	CMP esi, dword ptr[ebp + 16]
	JE D

	CMP dword ptr[ecx + esi * 4], 0
	JE Fermati
	INC esi
	JMP C1
D:
	mov eax, +1
	JMP Stop

Fermati:
	mov eax, 0
	JMP Stop
Non_possibile:
	mov eax, -2
Stop:


pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_divisione_array endp
end