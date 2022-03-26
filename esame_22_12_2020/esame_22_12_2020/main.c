// La funzione deve cercare nella stringa str quante volte il carattere passato compare come doppia nella stringa str.
// Le coppie(esatte ovvero non triple, quadruple ecc…) in str devono quindi essere sovrascritte da due spazi.
// La funzione ritorna il numero di coppie esatte del carattere in str.

#include <stdio.h>


int elimina_doppie(char* str, char v);

int main(void)
{
	char str[] = { "Doppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp pp Doppiiia" };
	printf("%d ", elimina_doppie(str, 'p'));
	printf("\n%s", str);
	return 0;
}