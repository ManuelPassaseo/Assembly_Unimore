#include <stdio.h>
int pari(int* v, int len);



int main(void)
{
	int v[] = { 1,1,1,1,1,1,1,1,1,1 };
	printf("%d", pari(v, 10));

	return 0;
}
