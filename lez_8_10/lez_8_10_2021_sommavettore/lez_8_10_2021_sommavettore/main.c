#include <stdint.h>
#include <stdio.h>
int somma_vettore(int* v, int len);
//somma del primo elemento con l'ultimo
int main(void)
{
	int v[] = { 1,2,3,4,5,6,7,8,9,10 };
	int ris = somma_vettore(v, 10);
	printf("ris=%d", ris);



	return 0;
}