.586
.model flat
.code

_somma_modulo proc
push ebp
mov ebp, esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp + 8]		;vettore1 (dividendo)
mov esi,0						;contatore
mov edi, dword ptr[ebp + 20]	;divisore
mov edx, 0						;resto
mov ecx, dword ptr[ebp + 16]	;vettore2 (resto)
;eax v[i]

CMP edi, 0
JE A
JMP Inizio
A:
	CMP esi, dword ptr[ebp + 12]
	JE B
	mov dword ptr[ecx + esi * 4], 0
	INC esi
	JMP A
B:
	mov eax, 0
	JMP Fine_tutto

Inizio:

	CMP esi, dword ptr[ebp + 12]
	JE Fine

	mov eax, dword ptr[ebx + esi * 4];
	CDQ
	IDIV edi
	mov dword ptr[ecx + esi * 4], edx
	INC esi
	JMP Inizio
	
Fine:

call not_divisore
CMP eax, -1
JE Fine_tutto

call divisore
CMP eax, -2
JE Fine_tutto

call somma


Fine_tutto:

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_somma_modulo endp



divisore proc

mov esi, 0
mov ebx, dword ptr[ebp + 8]
mov edi, dword ptr[ebp + 20]

Inizio:
	CMP esi, dword ptr [ebp + 12]
	JE Fine

	mov eax, dword ptr[ebx + esi * 4]
	CDQ
	IDIV edi
	INC esi
	CMP edx, 0
	JNE Inizio
	JMP Stop

Fine:
mov eax, -2
Stop:

ret
divisore endp
not_divisore proc

mov esi, 0
mov ebx, dword ptr[ebp + 8]
mov edi, dword ptr[ebp + 20]
Inizio:
	CMP esi, dword ptr [ebp + 12]
	JE Fine

	mov eax, dword ptr[ebx + esi * 4]
	CDQ
	IDIV  edi
	INC esi
	CMP edx, 0
	JNE Stop
	JMP Inizio

Fine:
mov eax, -1
Stop:

ret
not_divisore endp

somma proc

mov esi, 0
mov eax, 0
mov ecx, 0

Inizio:

	CMP esi, dword ptr[ebp + 12]
	JE Fine

	mov eax, dword ptr[ebx + esi * 4];

	CDQ
	IDIV edi

	add ecx, edx
	INC esi
	JMP Inizio

Fine:
	mov eax, ecx

ret
somma endp


end