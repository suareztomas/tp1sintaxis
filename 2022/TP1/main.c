#include <stdio.h>
#include <ctype.h>

int main(void) {

    char c;

    while(c = getchar()) {
        if (isupper(c))
            printf("%c", tolower(c));
        else if (islower(c))
            printf("%c", toupper(c));
        else if (!isdigit(c))
            printf("%c", c);
        else
            continue;
    }
}