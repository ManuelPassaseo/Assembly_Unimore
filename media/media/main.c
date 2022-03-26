#include <stdio.h>
int media(int* v, int len);





int main(void)
{
	int v[] = { 1,2,3,4,5,6,7,8,9,10 };


	int somma = 0;
	for (int i = 0; i < 10; i++)
	{
		somma = somma + v[i];
	}
	somma = somma / 10;

	printf("%i", somma);

	printf("%d", media(v, 10));

	return 0;
}