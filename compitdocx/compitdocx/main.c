#include <stdio.h>

int somma_modulo(int* src, int lunghezza, int* dst, int divisore); 

//la funzione deve restituire la somma del resto della divisione 
//intera degli elementi di src per divisore

int main(void)
{
	int src[10] = {2,4,6,8,10,12,14,16,18,20 };
	int dst[10];
	//int ret;
	printf("Somma = % d", somma_modulo(src, 10, dst, 2));
	printf("\n%d,%d,%d,%d,%d,%d,%d,%d,%d,%d", dst[0], dst[1], dst[2], dst[3], dst[4], dst[5], dst[6], dst[7], dst[8], dst[9]);

	return 0;
}


