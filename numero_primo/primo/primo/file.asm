.586
.model flat
.code

_primo proc
push ebp
mov ebp, esp
push esi
push edi
push ebx


mov esi, 2
mov edi, 0


Inizio:
	mov eax, dword ptr[ebp + 8]
	
	CMP esi, eax
	JE Vero

	CDQ
	IDIV esi
	CMP edx, 0
	JE Falso

	INC esi
	JMP Inizio

Vero:
mov eax, 1
JMP Fine

Falso:
mov eax, 0

Fine:

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_primo endp


end