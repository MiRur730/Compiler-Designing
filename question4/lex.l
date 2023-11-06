%{
#include <stdio.h>
%}

%%
[ ]+ { /* Pattern for recognizing multiple spaces */
    fprintf(yyout, " "); // Replace multiple spaces with a single space
}

[ ]+\n[ ]+ { /* Spaces followed by a newline followed by spaces */
    fprintf(yyout, " "); // Replace with a single space
}

. { /* Default action: print other characters as is */
    fputc(yytext[0], yyout);
}

%%
int yywrap() {
    return 1; // Indicate the end of input
}

int main() {
    
    yyin = fopen("input.txt", "r");
    // Point yyout to the output file
    yyout = fopen("output.txt", "w");

    if (yyin == NULL || yyout == NULL) {
        perror("Error opening files");
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(yyout);

    return 0;
}
