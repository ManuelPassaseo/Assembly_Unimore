#include <stdio.h>

int somma_modulo(int* src, int lunghezza, int* dst, int divisore);

int main(void)
{
	
	int src[] = { 2,4,6,8,10,12 };
	int dst[10];

	printf("Somma = %d\n", somma_modulo(src, 6, dst, 0));
	for (int i = 0; i < 6; i++)
		printf("%d ", dst[i]);
	return 0;
}


