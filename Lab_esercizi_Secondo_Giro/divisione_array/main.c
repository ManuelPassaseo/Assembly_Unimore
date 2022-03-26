#include <stdio.h>


int divisione_array(int* src, int divisore, int lunghezza, int* resto);

int main(void)
{
	int lunghezza = 3;
	int src[] = {1,-100,1};
	int resto[3];
	printf("RISULTATO:	%d\nSRC:	", divisione_array(src, -3, lunghezza, resto));
	for (int i = 0; i < lunghezza; i++)
		printf("%d ", src[i]);
	printf("\nResto:	");
	for (int i = 0; i < lunghezza; i++)
		printf("%d ", resto[i]);

	return 0;
}

