#include <stdio.h>

int cerca_combinazioni_numero(char* src, int num, int* vettori_num);

int main(void)
{
	int v[3];
	printf("%d\n", cerca_combinazioni_numero("1Bella 11Vire 111RE 1 11 111 11 11 11 11 111 11 1 11 1 1 1 1 1 11111111111111111111111111111111111111111111111 11 1 1 1 111 11a1", 1, v));
	printf("%d, %d, %d", v[0], v[1], v[2]);
	return 0;
}
