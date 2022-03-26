.586
.model flat
.code

_somma_modulo proc
push ebp
mov ebp, esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp + 8]	;src
mov esi, 0
mov ecx, dword ptr[ebp + 16] ;src
mov edx, 0
mov eax, 0
mov edi, 0

Inizio:

CMP esi, dword ptr [ebp + 12]
JE Fine
mov eax, dword ptr[ebx + esi * 4]

CDQ
IDIV dword ptr[ebp + 20]

add edi, edx		;somma
mov dword ptr[ecx + esi * 4], edx


INC esi
JMP Inizio

Fine:
mov eax, edi		;swipe
call divisori
call nondivisori
CMP ecx, -1
JE Change
CMP ecx, -2
JE Change

JMP STOP

Change:
mov eax, ecx
JMP STOP



STOP:


pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_somma_modulo endp

divisori proc

push eax

mov esi, 0
mov ecx, 0

Inizio_Divisori:
	CMP esi, dword ptr[ebp + 12]
	JE Fine_Divisori
	
	mov eax, dword ptr [ebx + esi * 4]
	INC esi	
	
	CDQ
	IDIV dword ptr[ebp + 20]
	CMP edx, 0 
	JE Incrementa
	JMP Fine_Tutto
	
	Incrementa:
	JMP Inizio_Divisori
	
Fine_Divisori:
mov ecx, -1

Fine_Tutto:

pop eax

ret
divisori endp

nondivisori proc

push eax

mov esi, 0
mov ecx, 0

Inizio_Divisori:
	CMP esi, dword ptr[ebp + 12]
	JE Fine_Divisori
	
	mov eax, dword ptr [ebx + esi * 4]
	INC esi	
	
	CDQ
	IDIV dword ptr[ebp + 20]
	CMP edx, 0 
	JNE Incrementa
	JMP Fine_Tutto
	
	Incrementa:
	JMP Inizio_Divisori
	
Fine_Divisori:
mov ecx, -2

Fine_Tutto:

pop eax

ret



ret
nondivisori endp

end