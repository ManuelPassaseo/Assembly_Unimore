.586
.model flat
.code

_somma_vettore proc
push ebp
mov ebp, esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp + 8]
mov edx, dword ptr[ebp + 12]
mov eax, 0
DEC edx
mov ecx, dword ptr[ebx]
add eax, dword ptr[ebx + edx * 4]
add eax, ecx





pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp




ret

_somma_vettore endp

end

