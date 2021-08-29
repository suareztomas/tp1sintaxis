#include <stdio.h>
#include <ctype.h>
#include "scanner.h"

void get_token(){
    token tokenType;
    char str[50];
    int i = 0;
    char c;
    while ( (c = getchar()) ){
        // SEPARADOR
        if (c == ',') {
            printf("Separador: , \n");
            tokenType = SEP;
        // FDT
        } else if (c == EOF) {
            printf("Fin de texto: \n");
            tokenType = FDT;
            break;
        // ESPACIO (ignorar)
        } else if (isspace(c)){
            continue;
        // CADENA
        } else {
            str[i] = c;
            i++; 
            char cAux = getchar();
            // Me fijo si lo que sigue es un caracter que me corta el string
            if (cAux == EOF || cAux == ',' || isspace(cAux)) {
                tokenType = CAD;
                str[i] ='\0';
                printf("Cadena: %s", str);
                printf("\n");
                i = 0;
            }
            ungetc(cAux, stdin); // Vuelvo a donde estaba
        }
    } 
}