;se uso push e pop posso usare quei registri come mi pare in quella funzione

.586
.model flat
.code

_cerca_numero proc
push ebp
mov ebp, esp
push esi
push edi
push ebx



mov ebx, dword ptr[ebp + 8]
mov ecx, dword ptr[ebp + 16]
mov edx, dword ptr[ebp + 12]
mov esi, 0
	mov dword ptr[ecx], 0
	mov dword ptr[ecx + 1 * 4], 0
	mov dword ptr[ecx + 2 * 4], 0

CMP edx, 0
JE Zero

CMP edx, 1
JE Uno
CMP edx, 2
JE Due
CMP edx, 3
JE Tre
CMP edx, 4
JE Quattro
CMP edx, 5
JE Cinque
CMP edx, 6
JE Sei
CMP edx, 7
JE Sette
CMP edx, 8
JE Otto
CMP edx, 9
JE Nove



Zero:
mov edx, '0'
JMP Inizio

Uno:
mov edx, '1'
JMP Inizio
Due:
mov edx, '2'
JMP Inizio
Tre:
mov edx, '3'
JMP Inizio
Quattro:
mov edx, '4'
JMP Inizio
Cinque:
mov edx, '5'
JMP Inizio
Sei:
mov edx, '6'
JMP Inizio
Sette:
mov edx, '7'
JMP Inizio
Otto:
mov edx, '8'
JMP Inizio
Nove:
mov edx, '9'
JMP Inizio

Inizio:
	mov edi, 0
	mov al, byte ptr[ebx + esi]

	CMP al, 0
	JE Fine

	CMP al, dl
	JE Singolo


	INC esi
	JMP Inizio

Singolo:
	CMP byte ptr[ebx + esi + 1], dl
	JE Doppia
	INC dword ptr[ecx + edi * 4]
	INC esi
	JMP Inizio
Doppia:
	INC edi
	INC esi
	CMP byte ptr[ebx + esi + 1], dl
	JE Tripla

	INC dword ptr[ecx + edi * 4]
	INC esi
	JMP Inizio
Tripla:
	INC edi
	INC esi
	CMP byte ptr[ebx + esi + 1], dl
	JE Ciclo

	INC dword ptr[ecx + edi * 4]

	INC esi
	JMP Inizio
Ciclo:
;fino a quando non finiscono gli UNO
	INC esi
	CMP byte ptr[ebx + esi], dl
	JNE Fine_Ciclo
	JMP Ciclo
Fine_Ciclo:
	JMP Inizio


Fine:
mov eax, 0



pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret
_cerca_numero endp

end
