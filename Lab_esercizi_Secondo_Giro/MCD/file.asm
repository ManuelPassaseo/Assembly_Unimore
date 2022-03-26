;se uso push e pop posso usare quei registri come mi pare in quella funzione

.586
.model flat
.code

_MCD proc
push ebp
mov ebp, esp
push esi
push edi
push ebx


mov ebx, dword ptr[ebp + 8]		;m = 15
mov ecx, dword ptr[ebp + 12]	;n = 6

CMP dword ptr[ebp + 8], 0
JE Fermati
CMP dword ptr[ebp + 12],0
JE Fermati

mov esi, 0

Inizio:
	CMP ebx, ecx
	JE Fine
	CMP ebx, ecx
	JL Vero
	SUB ebx, ecx
	JMP Inizio

Vero:
	SUB ecx, ebx
	JMP Inizio


Fermati:
mov eax, -100
JMP Stop
Fine:
mov eax, ebx
Stop:

;return n*m/eax
mov edi, eax
mov eax,dword ptr[ebp +8]
mov ecx,dword ptr[ebp +12]

MUL ecx

mov ecx, edi

CDQ
IDIV ecx


pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_MCD endp

end