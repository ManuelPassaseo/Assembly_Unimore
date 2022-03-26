.586
.model flat
.code

_media proc
push ebp
mov ebp, esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp + 8]
mov ecx, dword ptr[ebp + 12]
mov esi, 0
mov eax, 0
;somma
call somma

;calcolo media

CDQ
IDIV ecx


pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_media endp

somma proc

push ebx

Inizio:
	CMP esi, ecx
	JE Fine
	
	add eax, dword ptr[ebx + esi * 4]
	INC esi
	JMP Inizio


Fine:
pop ebx
ret

somma endp



end