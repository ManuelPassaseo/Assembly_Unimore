#include <stdint.h>
#include <stdio.h>

int assitoa(int src, int sgn, char* stringa);

int main(void)
{
	{
		int src = 0;
		int sgn = 1;
		char stringa[255];
		printf("%d\n", assitoa(src, sgn, stringa));
		printf("%s\n", stringa);
	}
	printf("\n\n\n");

	{
		int src = 12410;
		int sgn = 1;
		char stringa[255];
		printf("%d\n", assitoa(src, sgn, stringa));
		printf("%s\n", stringa);
	}
	printf("\n\n\n");

	{
		int src = -12410;
		int sgn = 1;
		char stringa[255];
		printf("%d\n", assitoa(src, sgn, stringa));
		printf("%s\n", stringa);
	}
	printf("\n\n\n");

	{
		int src = -12410;
		int sgn = 1;
		char stringa[255];
		printf("%d\n", assitoa(src, sgn, stringa));
		printf("%s\n", stringa);
	}
	printf("\n\n\n");

	{
		int src = 5;
		int sgn = 1;
		char stringa[255];
		printf("%d\n", assitoa(src, sgn, stringa));
		printf("%s\n", stringa);
	}

	return 0;
}

