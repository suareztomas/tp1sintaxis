%code top{
	#include <stdio.h>
	#include "scanner.h"
}

%code provides {
	void yyerror(const char *);
	extern int errlex;
	extern int yynerrs;
}

%define api.value.type{char *}

%defines "parser.h"					
%output "parser.c"

%start programa
%define parse.error verbose


%token 	FDT PROGRAMA ENTERO LEER ESCRIBIR FIN_PROGRAMA IDENTIFICADOR CONSTANTEENTERA
%token ASIGNACION "<<"

%left  '-'  '+'
%left  '*'  '/' '%'
%precedence NEG

%%
programa :	  PROGRAMA valor {printf("programa: %s\n", $valor);} listaSentencias FIN_PROGRAMA	{if (yynerrs || errlex) YYABORT;}
					;

listaSentencias :	sentencia 
				| 	sentencia listaSentencias
				;

sentencia :	LEER	'('listaIdentificadores')'';'		{printf("leer\n");} 
				|	ESCRIBIR'('listaExpresiones')'';'			{printf("escribir\n");} 
				|	ENTERO IDENTIFICADOR';'				{printf("entero %s\n", $IDENTIFICADOR);}
				|	IDENTIFICADOR ASIGNACION expresion';'			{printf("asignación \n");}
				|   	error ';'
				;

listaIdentificadores :	IDENTIFICADOR 								
				| 	IDENTIFICADOR','listaIdentificadores
				;

listaExpresiones :	expresion
				| 	expresion','listaExpresiones
				;
						
expresion:	valor
			        | 	'-'valor %prec NEG						{printf("inversión\n");}
                   		| 	'('expresion')' 						{printf("paréntesis\n");}
                    		| 	expresion '+' expresion 					{printf("suma\n");}
                  		| 	expresion '-' expresion 					{printf("resta\n");}
                   		| 	expresion '*' expresion 					{printf("multiplicación\n");}
                  		| 	expresion '/' expresion 					{printf("división\n");}
                  		| 	expresion '%' expresion 					{printf("modulo\n");}
					;
                        
valor :	IDENTIFICADOR
				|	CONSTANTEENTERA
				;
%%

int errlex = 0;

void yyerror(const char *s){
		printf("línea #%d  %s\n", yylineno, s);
}
