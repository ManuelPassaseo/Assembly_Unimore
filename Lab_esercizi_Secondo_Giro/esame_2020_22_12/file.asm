;se uso push e pop posso usare quei registri 
;come cazzo mi pare in quella funzione GOOOOOD

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
mov cl, 2
mov esi, -1

A:
	INC esi
	CMP esi, dword ptr[ebp + 12]
	JE Fine_Dispari
	mov al, byte ptr[ebx + esi]
	mov ah, 0
	DIV cl
	CMP ah, 0
	JE B
	JMP A
B:

mov esi, -1

C1:

	INC esi
	CMP esi, dword ptr[ebp + 12]
	JE Fine_Pari
	mov al, byte ptr[ebx + esi]
	mov ah, 0
	DIV cl
	CMP ah, 1
	JE D
	JMP C1

D:



mov edi, 0
mov esi, 0

Inizio:

	mov ecx, dword ptr[ebp + 12]
	DEC ecx
	INC esi
	CMP esi, ecx 
	JE Fine
	mov ecx, 0
	mov cl, 2

	mov al, byte ptr[ebx + esi]
	mov ah, 0
	DIV cl

	CMP AH, 1
	JE Check_Successivi


	JMP Inizio

Check_Successivi:
	mov al, byte ptr[ebx + esi - 1]
	mov ah, 0
	DIV cl

	CMP AH, 1
	JE Inizio

	mov al, byte ptr[ebx + esi + 1]
	mov ah, 0
	DIV cl

	CMP AH, 1
	JE Inizio

	mov al, byte ptr[ebx + esi + 1]
	add al, byte ptr[ebx + esi - 1]

	mov ah, 0
	DIV cl

	mov dl, al

	mov ah, 0
	DIV cl

	CMP ah, 0
	JE Pari

	INC dl
	mov byte ptr[ebx + esi], dl
	INC edi
	JMP Inizio

Pari:
	mov byte ptr[ebx + esi], dl
	INC edi
	JMP Inizio	


Decrementa:
	DEC esi
	JMP Inizio

Incrementa:
	INC esi
	JMP Inizio


Fine_Dispari:
mov eax, -1
JMP Fine_Tutto
Fine_Pari:
mov eax, -2
JMP Fine_Tutto
	
Fine:
;edi pari e != da 0
mov eax, 0
CMP edi, 0
JE Fine_Tutto
mov eax, edi

mov edx, 0
mov ecx, 2
DIV ecx

CMP edx, 0
JE CambiaValue
JMP Fine_Tutto

CambiaValue:
	mov eax, -3
Fine_Tutto:

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_togli_dispari endp

end