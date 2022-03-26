#include <stdint.h>
#include <stdio.h>
//Scorro a[] e se il valore è > c, metto 1 in b[]
int compare(int* a, int* b, int c, int len);



int main(void)
{
	int a[] = { 1,2,3,4 };
	int b[] = { 5,5,5,5 };
	int c = 2;
	int r = compare(a, b, c, 4);
	for (int i = 0; i < 4; i++)
	{
		printf("%i ", b[i]);
	}

	return 0;
}


/*
Inizio:
	CMP esi, edx
	JE Fine

	CMP dword ptr[eax + esi * 4], ecx
	JG Vero
	INC esi
	JMP Inizio

Vero:
mov dword ptr[ebx + esi * 4], 1
INC esi
JMP Inizio

Fine:

*/
