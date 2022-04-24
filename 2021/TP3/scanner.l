%top{
	#include <stdio.h>
	#include "tokens.h"	
}

%option header-file="scanner.h"
%option outfile="scanner.c"
%option noinput
%option nounput

Letra														[[:alpha:]]
Digito														[0-9]
Letra_Digito													[[:alnum:]]
Espacio													[[:space:]]
OperadorAsignacion												"<<"
Comentario													"//".*
Otros														[[:punct:]]{-}[();,+\-*/%]


%%
programa 													return PROGRAMA;
fin-programa													return FIN_PROGRAMA;
entero														return ENTERO;
leer														return LEER;
escribir													return ESCRIBIR;
{OperadorAsignacion} 												return ASIGNACION;
{Letra}{Letra_Digito}*												return IDENTIFICADOR;
{Digito}+													return CONSTANTEENTERA;
"("														return '(';
")"														return ')';
","														return ',';
"+"														return '+';
"-"														return '-';
"*"														return '*';
"/"														return '/';
"%"														return '%';
";"														return ';';

{Otros}+													printf("Error léxico: cadena desconocida: %s\n",yytext);
{Letra}{Letra_Digito}*{Otros}+({Letra_Digito}|{Otros})*							printf("Error léxico: identificador inválido: %s\n",yytext);
{Digito}+{Letra}+{Letra_Digito}*										printf("Error léxico: constante inválida: %s\n",yytext);
{Espacio}+													|
{Comentario}													;
%%
