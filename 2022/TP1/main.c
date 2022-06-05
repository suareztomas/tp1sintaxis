#include <stdio.h>
#include <ctype.h>

// Autor: Tomás Suarez

int main(void) {

    char c;

    while(c = getchar()) {
        if (isupper(c))
            putchar(tolower(c));
        else if (islower(c))
            putchar(toupper(c));
        else if (!isdigit(c))
            putchar(c);
        else if (c == EOF)
            break;
    }
}
