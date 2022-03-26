.586
.model flat
.code

_cerca_combinazioni_numero proc
push ebp
mov ebp, esp
push esi
push edi
push ebx


mov ebx, dword ptr[ebp + 8]
mov ecx, dword ptr[ebp + 16]
mov edi, 0
;azzera

	mov esi, 0
A:
	CMP esi, 3
	JE B
	mov dword ptr[ecx + esi * 4], 0
	INC esi
	JMP A
B:

mov esi,-1
mov dl, byte ptr[ebp + 12]


Inizio:
	mov edi, 0
	INC esi
	mov al, byte ptr[ebx + esi]
	CMP al, 0
	JE Fine
	sub al, 48
	CMP al, dl
	JE Vero1

	JMP Inizio


Vero1:
	INC esi
	mov al, byte ptr[ebx + esi]
	sub al, 48
	CMP al, dl
	JE Vero2
	DEC esi
	mov edi, 0
	INC dword ptr[ecx+edi * 4]

	JMP Inizio

Vero2:
	INC esi
	mov al, byte ptr[ebx + esi]
	sub al, 48
	CMP al, dl
	JE Vero3
	DEC esi
	mov edi, 1
	INC dword ptr[ecx + edi * 4]
	JMP Inizio

Vero3:
	INC esi
	mov al, byte ptr[ebx + esi]
	sub al, 48
	CMP al, dl
	JNE Vero
Until_End:
	INC esi
	mov al, byte ptr[ebx+ esi]
	sub al, 48
	CMP al, dl
	JNE Inizio
	JMP Until_End

Vero:
	mov edi, 2
	INC dword ptr[ecx + edi * 4]	
	JMP Inizio


Fine:
	mov eax, 0

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_cerca_combinazioni_numero endp


end