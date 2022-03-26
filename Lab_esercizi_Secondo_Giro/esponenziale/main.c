#include <stdio.h>

int esponenziale(int* src, int* dst, int l);

int main(void)
{
	int src[] = { 0,1,2,3,4,5,6 };
	int dst[7];
	int l = 7;

	printf("%d\n", esponenziale(src, dst, l));
	for (int i = 0; i < l; i++)
		printf("%d ", dst[i]);

	return 0;
}
