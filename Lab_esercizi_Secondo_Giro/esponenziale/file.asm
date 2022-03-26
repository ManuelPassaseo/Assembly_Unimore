;se uso push e pop posso usare quei registri 
;come cazzo mi pare in quella funzione GOOOOOD

.586
.model flat
.code

_esponenziale proc
push ebp
mov ebp, esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp + 8]
mov ecx, dword ptr[ebp + 12]
mov esi, 0

Inizio:

	CMP esi, dword ptr[ebp + 16]
	JE Fine

	mov edx, dword ptr[ebx + esi * 4]
	mov edi, edx

	mov eax, dword ptr[ebx + esi * 4]

	CMP eax, 1
	JLE Taglia

A:
	CMP edi, 1
	JE B

	mov edx, dword ptr[ebx + esi * 4]
	MUL edx

	mov dword ptr[ecx + esi * 4], eax
	DEC edi
	JMP A

B:

	INC esi
	JMP Inizio
Taglia:
	CMP dword ptr[ebx+ esi * 4], 0
	JE Zero

	mov dword ptr[ecx + esi * 4], 1
	INC esi
	JMP Inizio

Zero:
	mov dword ptr[ecx + esi * 4], 0

	INC esi
	JMP Inizio

Fine:
	mov eax, 0

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_esponenziale endp


end
