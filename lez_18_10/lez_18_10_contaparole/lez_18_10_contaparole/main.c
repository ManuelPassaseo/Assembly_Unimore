#include <stdio.h>
int conta(char* s);
//conta parola -> insieme di caratteri e simboli terminata da uno spazio
int main(void)
{
	char s[] = { "Prova a 3   4  " };
	printf("%d",conta(s));
	return 0; 
}
