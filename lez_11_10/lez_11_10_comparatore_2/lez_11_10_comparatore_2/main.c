#include <stdio.h>
int compare2(int* a, int* b, int len);

//b[i]=0 se b[i] < somma degli elementi di a

int main(void)
{
	int a[] = { 1,2,3,4,5,6,7,8,9,10 };
	int b[] = { 2,2,2,2,55,56,57,58,59,60 };
	int r = compare2(a, b, 10);
	for (int i = 0; i < 10; i++)
		printf("%i ", b[i]);


	return 0;
}

