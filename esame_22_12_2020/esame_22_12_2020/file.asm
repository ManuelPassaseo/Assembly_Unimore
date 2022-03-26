.586
.model flat
.code

_elimina_doppie  proc
push ebp
mov ebp, esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp + 8]
mov esi, -1
mov edi, 0

Inizio:
	INC esi
	mov cl, byte ptr[ebx + esi]
	CMP cl, 0
	JE Fine

	CMP cl, byte ptr[ebp + 12]
	JE Incrementa
	JMP Inizio

Incrementa:
	
	INC esi
	mov cl, byte ptr [ebx + esi]
	CMP cl, byte ptr[ebp + 12]
	JE Continua
	DEC esi ;1
	JMP Inizio
Continua:
	INC esi
	mov cl, byte ptr [ebx + esi]
	CMP cl, byte ptr[ebp + 12]
	JNE Sostituisci 

Start:
	INC esi
	mov cl, byte ptr[ebx +esi]
	CMP cl, byte ptr[ebp + 12]
	JNE Inizio
	JMP Start


Sostituisci:
	DEC esi
	mov byte ptr [ebx + esi], 32
	DEC esi
	mov byte ptr [ebx + esi], 32
	INC edi
	JMP Inizio
Fine:
	mov eax, edi




pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_elimina_doppie  endp


end