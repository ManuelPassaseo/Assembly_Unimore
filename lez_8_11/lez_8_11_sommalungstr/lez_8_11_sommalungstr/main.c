#include <stdint.h>
#include <stdio.h>
int sommalungstr(char* a, char* b);
int main(void)
{
	char a[] = { "123 5" };
	char b[] = { "AD+9" };
	printf("%d", sommalungstr(a, b));
	return 0;
}

