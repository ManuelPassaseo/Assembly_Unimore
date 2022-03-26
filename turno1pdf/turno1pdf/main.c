#include <stdio.h>


int divisione_array(int* src, int divisore, int lunghezza, int* resto);



int main(void)
{
	int v[] = { 111,111,121,131,141,151,161,171,173,123 };
	int resto[6];

	printf("%d\n",divisione_array(v, 4, 6, resto));
	printf("%d %d  %d  %d  %d  %d\n", v[0], v[1], v[2], v[3], v[4], v[5]);
	printf("%d  %d  %d  %d  %d  %d", resto[0], resto[1], resto[2], resto[3], resto[4], resto[5] );

	return 0;
}