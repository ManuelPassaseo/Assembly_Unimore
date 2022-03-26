;se uso push e pop posso usare quei registri come mi pare in quella funzione

.586
.model flat
.code

_somma_modulo proc
push ebp
mov ebp, esp
push esi
push edi
push ebx

CMP dword ptr[ebp + 20], 0
JE Stop

mov ebx, dword ptr[ebp + 8]
mov esi, 0
mov ecx, 0
Inizio:
	CMP esi, dword ptr[ebp + 12]
	JE Fine

	mov eax, dword ptr[ebx + esi *4]
	call divisione

	add ecx, edx
	call sostituisci ;metti in RST[i] = edx

	INC esi
	JMP Inizio

Fine:
mov esi, 0
mov ebx, dword ptr[ebp + 16]
Check_Divisore:
	
	CMP esi, dword ptr[ebp + 12]
	JE Fine_Check_Divisore

	CMP dword ptr[ebx + esi * 4], 0
	JNE NO
	INC esi
	JMP Check_Divisore
Fine_Check_Divisore:
	mov eax, -1
	JMP Stop
NO:
mov esi, 0
Check_Not_Divisore:
	
	CMP esi, dword ptr[ebp + 12]
	JE Fine_Check_Not_Divisore

	CMP dword ptr[ebx + esi * 4], 0
	JE NO2
	INC esi
	JMP Check_Not_Divisore
Fine_Check_Not_Divisore:
	mov eax, -2
	JMP Stop
NO2:
mov eax, ecx
Stop:

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_somma_modulo endp

divisione proc
push ecx

mov ecx, dword ptr[ebp + 20]
CDQ
IDIV ecx

pop ecx
ret
divisione endp

sostituisci proc
push ecx

mov ecx, dword ptr[ebp + 16]
mov dword ptr[ecx + esi * 4], edx
pop ecx
ret
sostituisci endp

end