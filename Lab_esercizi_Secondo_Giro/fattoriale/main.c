#include <stdio.h>

int fattoriale(int* src, int* dst, int lunghezza);

int main(void)
{
	int src[] = { 4,5,6,7 };
  //int dst[] = { 1,4,12,24 };
	int dst[4];
	printf("%d", fattoriale(src, dst, 10));
	


	return 0;
}

