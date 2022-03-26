#include <stdio.h>

int cerca_numero(char * src, int num, int * v);


int main(void)
{
	char src[] = { " 1 11 111 11 1 111 1 11 111 1 11 111 1111111111111111111111111111111111111111111111111111111111  1111 1 11 111 1111 11111 111111111123123113111 2355" };
	int v[3];

	printf("%d", cerca_numero(src,1,v));
	printf("\n%d,%d,%d", v[0], v[1], v[2]);

	printf("\n%d", cerca_numero(src, 1, v));
	printf("\n%d,%d,%d", v[0], v[1], v[2]);
	printf("\n%d", cerca_numero(src, 1, v));
	printf("\n%d,%d,%d", v[0], v[1], v[2]);
	printf("\n%d", cerca_numero(src, 1, v));
	printf("\n%d,%d,%d", v[0], v[1], v[2]);



	return 0;
}

