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
mov edi, dword ptr[ebp + 12]
DEC edi
mov esi, 0

Inizio:
	mov ecx, 0
	INC esi
	CMP esi, edi
	JE Fine

	mov ax, word ptr[ebx + esi]
	mov dl, 2
	mov ah, 0
	DIV dl

	CMP ah, 0
	JE Inizio

	call check1
	
	CMP ecx, 1
	JE Continua
	
	JMP Inizio

Continua:
	call check2
	CMP ecx, 2
	JE Sostituisci
	JMP Inizio
Sostituisci:

	;media
	call media
	;al è la media

	mov dl, 2
	mov ah, 0
	DIV dl

	CMP ah, 0
	JE Pari

	INC al
	mov byte ptr[ebx + esi], al
	DEC al
	JMP Inizio
Pari:
	mov byte ptr[ebx + esi], al
	
	JMP Inizio

Fine:



pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_togli_dispari endp

media proc

push esi

mov ebx, dword ptr[ebp + 8]
mov al, 0
mov esi, 0
mov cl, 2
	mov ax, word ptr[ebx + esi - 1]
	add ax, word ptr[ebx + esi + 1]

mov ah, 0
DIV cl



pop ecx
pop esi
ret
media endp


check1 proc

push eax

mov dl, 2

mov cl, byte ptr[ebx + esi - 1]
mov al, cl

mov ah, 0
DIV dl

CMP ah, 0
JE Vero
JMP Stop
Vero:
mov ecx, 1	;flag

Stop:

pop eax
ret
check1 endp

check2 proc


push eax

mov dl, 2

mov cl, byte ptr[ebx + esi + 1]
mov al, cl

mov ah, 0
DIV dl

CMP ah, 0
JE Vero
JMP Stop
Vero:
mov ecx, 2	;flag

Stop:

pop eax

ret
check2 endp

end