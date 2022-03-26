;se uso push e pop posso usare quei registri come mi pare in quella funzione

.586
.model flat
.code

_togli_dispari proc
push ebp
mov ebp, esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp + 8]
mov esi, 0
mov cl, 2

;punto1
Punto1:
	CMP esi, dword ptr[ebp + 12] 
	JE Punto1_Vero
	mov al, byte ptr[ebx + esi]
	mov ah, 0
	DIV cl
	CMP ah, 0
	JE Fine_Punto1

	INC esi
	JMP Punto1

Fine_Punto1:
mov esi, 0


;punto2
Punto2:
	CMP esi, dword ptr[ebp + 12]
	JE Punto2_Vero
	mov al, byte ptr[ebx + esi]
	mov ah, 0
	DIV cl
	CMP ah, 1
	JE Fine_Punto2

	INC esi
	JMP Punto2

Fine_Punto2:
mov esi, 1

mov edi, 0
DEC dword ptr[ebp + 12]
Inizio:
	CMP esi, dword ptr[ebp + 12] 
	JE Fine

	mov al, byte ptr[ebx + esi]
	mov ah, 0
	DIV cl

	CMP ah, 1
	JE Dispari

	INC esi
	JMP Inizio
Dispari:
	mov al, byte ptr[ebx + esi - 1]
	mov ah, 0
	DIV cl
	CMP ah, 0
	JE Back_Pari
	INC esi
	JMP Inizio
Back_Pari:
	mov al, byte ptr[ebx + esi + 1]
	mov ah, 0
	DIV cl
	CMP ah, 0
	JE Sostituisci
	INC esi
	JMP Inizio

Sostituisci:
	mov al, byte ptr[ebx + esi + 1]
	mov dl, byte ptr[ebx + esi - 1]
	ADD al, dl
	mov ah, 0
	DIV cl
	CMP ah, 0

	mov dl, al
	INC edi

	mov ah, 0
	DIV cl
	CMP ah, 0
	JE Sostituzione_pari

	INC dl
	mov byte ptr[ebx+esi], dl

	INC esi
	JMP Inizio
Sostituzione_pari:
	mov byte ptr[ebx+esi], dl
	INC esi
	JMP Inizio

Punto1_Vero:
	mov eax, -1
	JMP Stop
Punto2_Vero:
	mov eax, -2
	JMP Stop

Fine:
CMP edi, 0
JG Scambia
JMP Stop
Scambia:
mov eax, edi
Stop:


pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret
_togli_dispari endp
end