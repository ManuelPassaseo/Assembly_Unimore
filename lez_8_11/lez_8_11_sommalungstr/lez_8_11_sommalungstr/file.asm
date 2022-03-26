.586
.model flat
.code


_sommalungstr proc
push ebp
mov ebp, esp
push esi
push edi
push ebx

mov eax, 0
mov ebx, dword ptr[ebp + 8]
call strlun
mov ebx, dword ptr[ebp + 12]
call strlun




pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_sommalungstr endp

strlun proc
push ebx
mov esi, 0
Inizio:
	CMP byte ptr[ebx + esi], 0
	JE Fine
	INC esi
	INC eax
	JMP Inizio
Fine:

pop ebx
ret
strlun endp


end


