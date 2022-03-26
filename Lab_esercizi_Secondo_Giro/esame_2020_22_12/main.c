#include <stdio.h>

int togli_dispari(unsigned char* src, int lunghezza);


int main(void)
{
	unsigned char src[] = { 0,0,0,0,0,0 };
	printf("%d %d %d %d %d %d ", src[0], src[1], src[2], src[3], src[4], src[5]);
	printf("\n\n\n");
	{
		unsigned char src[] = { 0,0,0,0,0,0 };

		printf("%d\n", togli_dispari(src, 6));
		printf("%d %d %d %d %d %d ", src[0], src[1], src[2], src[3], src[4], src[5]);
		printf("\n\n");
	}
	{
		unsigned char src[] = { 0,0,0,0,0,0 };

		printf("%d\n", togli_dispari(src, 6));
		printf("%d %d %d %d %d %d ", src[0], src[1], src[2], src[3], src[4], src[5]);
		printf("\n\n");
	}
	{
		unsigned char src[] = { 0,0,0,0,0,0 };

		printf("%d\n", togli_dispari(src, 6));
		printf("%d %d %d %d %d %d ", src[0], src[1], src[2], src[3], src[4], src[5]);
		printf("\n\n");
	}

	return 0;
}
