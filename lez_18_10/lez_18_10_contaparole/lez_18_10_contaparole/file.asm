.586
.model flat
.code


_conta proc
push ebp
mov ebp, esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp+8]
mov esi, 0
mov eax, 0

Inizio:
	mov cl, byte ptr[ebx + esi]
	CMP cl, 0
	JE Fine

	CMP cl, 32
	JE Check
	INC esi
	JMP Inizio

Check:
	mov dl, byte ptr[ebx + esi + 1]
	CMP dl, 32
	JE Stop
	INC esi
	INC eax
	JMP Inizio

Stop:
	INC esi
	JMP Inizio



Fine:


pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret
_conta endp

end


