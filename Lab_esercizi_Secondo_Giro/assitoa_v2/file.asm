;se uso push e pop posso usare quei registri come mi pare in quella funzione

.586
.model flat
.code

_assitoa proc
push ebp
mov ebp, esp
push esi
push edi
push ebx


mov eax, dword ptr[ebp + 8]
mov esi, 10
mov edi, 0
CMP eax, 0
JE Caso_Particolare
A:
	CMP eax, 0
	JE B
	CDQ
	IDIV esi
	INC edi
	JMP A
B:
;mi metto in stringa il resto

mov ecx, dword ptr[ebp + 16]
mov esi, 0
mov ebx, dword ptr[ebp + 8]
CMP ebx, 0
JL Nega
JMP Inizio
Nega:
	NEG dword ptr[ebp + 8]
	NEG ebx
	INC edi

Inizio:

	CMP edi, 0
	JE Fine
	
	call divisione

	mov byte ptr[ecx + edi - 1], al
	DEC edi
	INC esi
	JMP Inizio
Caso_Particolare:
	mov ecx, dword ptr[ebp + 16]
	mov byte ptr[ecx], '0'
	mov byte ptr[ecx + 1], 0
	CMP dword ptr[ebp + 12], 1
	JE Rit_Meno_Due
	JMP Stop
Rit_Meno_Due:
	mov eax, -2
	JMP Fine_Vera
Fine:
	mov eax, 0
	ADD edi, esi
	mov byte ptr[ecx + edi], 0
Stop:

	CMP dword ptr[ebp + 12], 1
	JE Punto2
	JMP Fine_Vera
Punto2:

	CMP dword ptr[ebp + 12], 1
	JE Vediamo
	JMP Fine_Vera
Vediamo:
	CMP dword ptr[ebp + 8], 0
	JG Positivo
	mov eax, -1
	JMP Fine_Vera
Positivo:
	mov eax, +1
	JMP Fine_Vera

Fine_Vera:
	NEG dword ptr[ebp + 8]
	CMP dword ptr[ebp + 8], 0
	JG Basta
	mov byte ptr[ecx], '-' 
Basta: 

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_assitoa endp

divisione proc
push ecx

mov ecx, 10
mov eax, ebx
CDQ
IDIV ecx
mov ebx,eax
mov eax, edx


CMP eax, 0
JE Zero

CMP eax, 1
JE Uno
CMP eax, 2
JE Due
CMP eax, 3
JE Tre
CMP eax, 4
JE Quattro
CMP eax, 5
JE Cinque
CMP eax, 6
JE Sei
CMP eax, 7
JE Sette
CMP eax, 8
JE Otto
CMP eax, 9
JE Nove


Zero:
	mov eax, '0'
	JMP Stop
Uno:
	mov eax, '1'
	JMP Stop
Due:
	mov eax, '2'
	JMP Stop
Tre:
	mov eax, '3'
	JMP Stop
Quattro:
	mov eax, '4'
	JMP Stop
Cinque:
	mov eax, '5'
	JMP Stop
Sei:
	mov eax, '6'
	JMP Stop
Sette:
	mov eax, '7'
	JMP Stop
Otto:
	mov eax, '8'
	JMP Stop
Nove:
	mov eax, '9'
Stop:

pop ecx
ret
divisione endp

end