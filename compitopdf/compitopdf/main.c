#include <stdio.h>

int togli_dispari(unsigned char* src, int lunghezza);

int main(void)
{
	unsigned char src[] = { 2,3,4,4,5,8 };
	
	printf("%d ", togli_dispari(src, 6));

	return 0;
}