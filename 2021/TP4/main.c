/*	TP3 - Grupo 8 - 2021      */   
/*	Tomas Suarez - Facundo Piaggio - Franco Oviedo	*/                                                          

#include <stdio.h>
#include "parser.h"

int main(void)
{	
	switch( yyparse() ) {
		case 0: printf("\nCompilación terminada con éxito");
			break;		
		case 1: printf("\nErrores de compilación");
			break;
		case 2: printf("\nNo hay memoria suficiente");
			break;		
		}
	printf("\nErrores sintácticos:  %d - Errores lexicos:  %d\n", yynerrs, errlex);

	return 0;		
}
