;se uso push e pop posso usare quei registri come mi pare in quella funzione

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

mov esi, 0
mov ecx,0 
mov edx, 0
Inizio:
	mov al, byte ptr[ebx + esi]

	CMP al, 0
	JE Fine

	CMP al, 65
	JGE Check1




	INC esi
	JMP Inizio

Check1:
	CMP al, 122
	JLE Check2
	INC esi
	JMP Inizio

Check2:
	CMP al, 90
	JLE Vero
	CMP al, 97
	JGE Vero
	INC esi
	JMP Inizio

Vero:
	CMP al, 'A'
	JE Vocale
	CMP al, 'E'
	JE Vocale
	CMP al, 'I'
	JE Vocale
	CMP al, 'O'
	JE Vocale
	CMP al, 'U'
	JE Vocale
	CMP al, 'a'
	JE Vocale
	CMP al, 'e'
	JE Vocale
	CMP al, 'i'
	JE Vocale
	CMP al, 'o'
	JE Vocale
	CMP al, 'u'
	JE Vocale
	INC edx
	INC esi
	JMP Inizio

Vocale:
	INC ecx
	INC esi
	JMP Inizio

Fine:
mov ebx, dword ptr[ebp + 12] ;PROVA	vocali
mov eax, dword ptr[ebp + 16]	 ;PROVA consonanti

mov dword ptr[ebx], ecx
mov dword ptr[eax], edx
CMP ecx, 0
JE Rit_Meno_Uno
JMP Secondo_Caso
Rit_Meno_Uno:
CMP edx, 0
JE Rit
JMP Secondo_Caso
Rit:
	mov eax, -1
	JMP Stop
Secondo_Caso:
	ADD ecx, edx
	CMP esi, ecx
	JE Rit_Meno_Due
	JMP Vai

Rit_Meno_Due:
	mov eax, -2

Vai:
mov esi, 0
mov ebx, dword ptr[ebp + 8]


Ciclo1:
	mov cl, byte ptr[ebx + esi]
	CMP cl, 0
	JE Fine2

	CMP cl, 97
	JGE Forse

	INC esi
	JMP Ciclo1
Forse: 
	CMP cl, 122
	JLE Stop
	INC Esi
	JMP Ciclo1



Fine2:
	mov eax, -3

Stop:

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_conta_vocali_consonanti endp

end