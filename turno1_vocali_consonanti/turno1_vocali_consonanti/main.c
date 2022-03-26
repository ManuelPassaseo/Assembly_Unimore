#include <stdio.h>

int conta_vocali_consonanti(unsigned char* src, int* dstV, int* dstC);

int main() {
	char src[255] = "ABCDEFGHIJKLMNOPQRSTUVWXYZs";
	int dstV, dstC;
	int ret = conta_vocali_consonanti(src, &dstV, &dstC);
	printf("%d\nVocali: %d\nConsonanti: %d\n", ret, dstV, dstC);
	return 0;
}