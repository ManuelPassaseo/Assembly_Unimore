#include <stdio.h>

int assitoa(int src, int sgn, char* stringa);

int main(void)
{
	char src[255];
	printf("%d\n", assitoa(0, 13, src));
	printf("%s", src);



	return 0;
}


