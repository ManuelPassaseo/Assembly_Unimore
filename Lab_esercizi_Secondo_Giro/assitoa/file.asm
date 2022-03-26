;se uso push e pop posso usare quei registri 
;come cazzo mi pare in quella funzione GOOOOOD

.586
.model flat
.code

_assitoa proc
push ebp
mov ebp, esp
push esi
push edi
push ebx



CMP dword ptr[ebp + 8], 0
JE Forse
JMP Start
Forse:
CMP dword ptr[ebp + 12], 1
JE Change
JMP Start
Change:
	mov eax, -2
	JMP Stop

Start:

;grandezza
mov ecx, 0	;grandezza
mov ebx, 10	
mov eax, dword ptr[ebp + 8]

Inizio:

	CMP eax, 0
	JE Fine

	CDQ
	IDIV ebx
	INC ecx

	JMP Inizio

Fine:

;fine grandezza
mov ebx, dword ptr[ebp + 16]

CMP ecx,0
JE Not_Invert


mov esi, -1
mov eax, dword ptr[ebp + 8]

A:
	INC esi
	CMP esi, ecx
	JE B

	;divido il numero, lo divido per 10 e tengo il resto in src
	call dividi

	CMP edx, 0
	JNE Dopo1
	mov byte ptr[ebx + esi], '0'
	JMP A
Dopo1:
	CMP edx, 1
	JNE Dopo2
	mov byte ptr[ebx + esi], '1'
	JMP A

Dopo2:
	CMP edx, 2
	JNE Dopo3
	mov byte ptr[ebx + esi], '2'
	JMP A
Dopo3:

	CMP edx, 3
	JNE Dopo4
	mov byte ptr[ebx + esi], '3'
	JMP A
Dopo4:
	CMP edx, 4
	JNE Dopo5
	mov byte ptr[ebx + esi], '4'
	JMP A
Dopo5:
	CMP edx, 5
	JNE Dopo6
	mov byte ptr[ebx + esi], '5'
	JMP A
Dopo6:
	CMP edx, 6
	JNE Dopo7
	mov byte ptr[ebx + esi], '6'
	JMP A
Dopo7:
	CMP edx, 7
	JNE Dopo8
	mov byte ptr[ebx + esi], '7'
	JMP A
Dopo8:
	CMP edx, 8
	JNE Dopo9
	mov byte ptr[ebx + esi], '8'
	JMP A
Dopo9:
	CMP edx, 9
	mov byte ptr[ebx + esi], '9'
	JMP A

B:
INC esi

call inverti
Not_Invert: ;(mancano una serie di controlli per vedere a che corrisponde quella unica cifra...na cazzata ma perditempo)
mov byte ptr[ebx + ecx + 1], 0

mov eax, 0
Stop:

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp

ret

_assitoa endp


inverti proc

mov esi, ecx
DEC esi
mov edi, 0

Inizio:
	CMP edi, esi
	JGE Fine 

	mov al, byte ptr[ebx + edi]
	mov dl, byte ptr[ebx + esi]

	mov byte ptr[ebx + esi], al
	mov byte ptr[ebx + edi], dl

	DEC esi
	INC edi
	JMP Inizio



Fine:

ret
inverti endp





dividi proc
push ebx

mov ebx, 10
	
	CDQ
	IDIV ebx


pop ebx

ret
dividi endp


end