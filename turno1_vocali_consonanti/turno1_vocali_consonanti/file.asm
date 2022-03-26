.586
.model flat
.code

_conta_vocali_consonanti proc
push ebp
mov ebp, esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp + 8]
mov esi, -1
mov ecx, dword ptr[ebp + 12]
mov edx, dword ptr[ebp + 16]

mov dword ptr[ecx], 0
mov dword ptr[edx], 0

Inizio:
	INC esi
	mov al, byte ptr[ebx + esi]
	CMP al, 0
	JE Fine

	CMP al, 'A'
	JE Incrementa_Vocale
	CMP al, 'a'
	JE Incrementa_Vocale
	CMP al, 'E'
	JE Incrementa_Vocale
	CMP al, 'e'
	JE Incrementa_Vocale
	CMP al, 'I'
	JE Incrementa_Vocale
	CMP al, 'i'
	JE Incrementa_Vocale
	CMP al, 'O'
	JE Incrementa_Vocale
	CMP al, 'o'
	JE Incrementa_Vocale
	CMP al, 'U'
	JE Incrementa_Vocale
	CMP al, 'u'
	JE Incrementa_Vocale

	CMP al, 64
	JA Check1
	JMP Inizio


Incrementa_Vocale:
	INC dword ptr[ecx]
	JMP Inizio
Check1:
	CMP al, 91
	JB Incrementa_Consonante
	CMP al, 96
	JA Check2
	JMP Inizio
Check2:
	CMP al, 123
	JB Incrementa_Consonante
	JMP Inizio

Incrementa_Consonante:
	INC dword ptr[edx]
	JMP Inizio







Fine:
CMP dword ptr[ecx],0
JE Back1
JMP Stop

Back1:
	CMP dword ptr[edx], 0
	JE Back2
	JMP Stop
Back2:
	mov eax, -1

CMP eax, -1
JE Fine_Tutto



Stop:
call controlla

call controlla3

Fine_Tutto:

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_conta_vocali_consonanti endp

controlla proc

mov esi, -1

Inizio:
	INC esi
	mov al, byte ptr[ebx+esi]
	CMP al, 0
	JE Incrementa

	CMP al, 64
	JA Check1
	JMP Fine
Check1:
	CMP al, 123
	JB Check2
	JMP Fine
Check2:
	CMP al, 91
	JB Inizio
	CMP al, 96
	JA Inizio

Incrementa:
	mov eax, -2

Fine:

ret
controlla endp



controlla3 proc

mov esi, -1

Inizio:
	INC esi
	mov cl, byte ptr[ebx + esi]
	CMP cl, 0
	JE Stop

	CMP cl, 96
	JA Check1
	JMP Inizio

Check1:
	CMP cl, 123
	JB Fine
	JMP Inizio

Stop:
mov eax, -3

Fine:



ret
controlla3 endp





end