#include <stdint.h>
#include <stdio.h>
int check(char* s);
int main(void)
{
	//controlla se un certo elemento di una stringa è un numero

	int v[] = { 1,2,3,4,5,6,7,8,9,10 };
	char s[] = { "Abc6789 z" };
	
	int ris1 = check(s);
	printf("ris1=%d ", ris1);

	return 0;
}

/*
Inizio:
	mov dl, byte ptr[ebx + esi]
	INC esi
	CMP dl, 0
	JE Fine

	CMP dl, 48
	JGE Check1
	JMP Inizio

Check1:
	CMP dl, 57
	JLE Incrementa_Numero
	JMP Inizio

Incrementa_Numero:
INC eax
JMP Inizio

	Fine:
*/
