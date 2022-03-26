.586
.model flat
.code

_divisione_array proc
push ebp
mov ebp, esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp + 8]
mov esi, 0
mov ecx, dword ptr[ebp + 20]
mov edi, 0

CMP dword ptr[ebp + 12], 0
JNE Not_Zero

A:
	CMP esi, dword ptr[ebp + 16]
	JE B
	mov dword ptr[ebx + esi * 4], 0
	mov dword ptr[ecx + esi * 4], 0
	INC esi
	JMP A

B:
	mov eax, 1
	JMP Fine_Tutto

Not_Zero:
;valori copiati
Start:

	CMP esi, dword ptr[ebp + 16]
	JE Finish

	mov eax,dword ptr[ebx + esi * 4]	
	mov dword ptr[ecx + esi * 4], eax
	INC esi
	JMP Start

Finish:

mov esi, 0

Inizio:

CMP esi, dword ptr[ebp + 16]
JE Fine

mov eax, dword ptr[ebx + esi * 4]
CDQ
IDIV dword ptr[ebp + 12]



mov dword ptr[ebx + esi * 4], eax
INC esi

JMP Inizio
Fine:

call check1

CMP eax, -1
JE Fine_Tutto
call check2

Fine_Tutto:

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_divisione_array endp

check1 proc
mov esi, 0
Inizio_Check:

	CMP esi, dword ptr[ebp + 16] 
	JE Fine_Check_Vero
	
	mov eax, dword ptr[ecx + esi * 4]

	CDQ
	IDIV dword ptr[ebp + 12]

	CMP edx, 0
	JNE Fine_Check
	INC esi
	JMP Inizio_Check
	

Fine_Check_Vero:
mov eax, -1

Fine_Check:

call calcola_resto

ret
check1 endp


check2 proc

mov esi, 0
Inizio_Check:

	CMP esi, dword ptr[ebp + 16]
	JE Fine_Check_Vero
	
	mov eax, dword ptr[ecx + esi * 4]

	CDQ
	IDIV dword ptr[ebp + 12]

	CMP edx, 0
	JE Fine_Check
	INC esi
	JMP Inizio_Check
	


Fine_Check:
mov eax, -1231231312
JMP Bye
Fine_Check_Vero:
mov eax, 1
Bye:
ret
check2 endp

calcola_resto proc
push eax
mov esi, 0

A:

CMP esi, dword ptr[ebp + 16]
JE B

mov eax, dword ptr[ecx +esi *4]
CDQ 
IDIV dword ptr[ebp + 12]
mov dword ptr[ecx + esi * 4], edx
INC esi
JMP A
B:

pop eax
ret
calcola_resto endp


end