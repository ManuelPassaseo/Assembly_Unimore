#include <stdio.h>
unsigned char pari(unsigned char* v, unsigned char len);

int main(void)
{
	unsigned char v[] = { 1,4,7,2,1,1,1,4,3,2 };
	printf("%d",pari(v, 10));
	return 0;
}

