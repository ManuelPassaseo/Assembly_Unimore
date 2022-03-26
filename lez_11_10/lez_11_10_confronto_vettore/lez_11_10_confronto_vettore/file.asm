.586
.model flat
.code 

_compare proc

push ebp
mov ebp, esp
push esi
push edi
push ebx

mov eax, dword ptr [ebp + 8]
mov ebx, dword ptr [ebp + 12]

mov ecx, dword ptr[ebp + 16]	;c
mov edx, dword ptr[ebp + 20]	;len
mov esi, 0

Inizio:
	CMP esi, edx
	JE Fine
	call check
	INC esi

	JMP Inizio
Fine:



pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret
_compare endp

check proc

	CMP dword ptr[eax + esi * 4], ecx
	JG Vero
	INC esi
	JMP Fine
Vero:
mov dword ptr[ebx + esi * 4], 1

Fine:


ret
check endp

end

