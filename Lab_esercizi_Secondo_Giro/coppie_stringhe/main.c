#include <stdio.h>

// La funzione deve cercare nella stringa str quante volte il carattere passato compare come doppia nella stringa str.
// Le coppie(esatte ovvero non triple, quadruple ecc…) in str devono quindi essere sovrascritte da due spazi.
// La funzione ritorna il numero di coppie esatte del carattere in str.

int doppie(char* str);



int main(void)
{
	char str[] = { "Doppie 111 11 1 222 2222 22222 222222 22 33 111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111" };
	printf("%d\n", doppie(str));
	printf("%s\n", str);
	printf("\n\n");

	return 0;
}
