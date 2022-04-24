/*	TP3 - Grupo 8 - 2021      */   
/*	Tomas Suarez - Facundo Piaggio - Franco Oviedo	*/                                                          

#include "scanner.h"

char *token_names[] = {"Fin de archivo","Programa","Fin-Programa","Entero","Leer","Escribir","Asignacion","Identificador","ConstanteEntera"};

int main()
{

int TOKEN;
	do
	{
		TOKEN = yylex();
		if(TOKEN <= ASIGNACION){
			printf("Token: %s\n",token_names[TOKEN]);
		}
		else if(TOKEN == IDENTIFICADOR || TOKEN == CONSTANTEENTERA){
			printf("Token: %s\tlexema: %s\n",token_names[TOKEN],yytext);
		}
		else{
			printf("Token: \'%c\'\n",TOKEN);
		}		 
	} while(TOKEN != FDT);
        
	return 0;		
}
