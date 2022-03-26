;se uso push e pop posso usare quei registri come mi pare in quella funzione

.586
.model flat
.code

_doppie proc
push ebp
mov ebp, esp
push esi
push edi
push ebx


mov ebx, dword ptr[ebp + 8]
mov esi, 0
mov edi, 0
Inizio:
	mov al, byte ptr[ebx + esi]
	CMP al, 0
	JE Fine

	CMP al, byte ptr[ebx + esi - 1]
	JE Check1

	INC esi
	JMP Inizio

Check1:
	CMP byte ptr[ebx + esi - 2],al
	JE NO
	CMP byte ptr[ebx + esi + 1], al
	JE NO
	INC edi
	mov byte ptr[ebx + esi - 1], 32
	mov byte ptr[ebx + esi], 32
	INC esi
	JMP Inizio
NO:
	INC esi
	JMP Inizio

Fine:
mov eax, edi

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret
_doppie endp

end
