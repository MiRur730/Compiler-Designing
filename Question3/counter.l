%{
#include <stdio.h>
%}

%%
int|float|char|double|void    { printf("Keyword: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*        { printf("Identifier: %s\n", yytext); }
[0-9]+                        { printf("Constant: %s\n", yytext); }
[+*\/=<>]                     { printf("Operator: %s\n", yytext); }
[;,()\{\}]                    { printf("Punctuation Symbol: %s\n", yytext); }
.                             { /* Ignore other characters */ }
%%

int yywrap() {
    return 1;
}

int main() {
    while (1) {
        int token = yylex();
        if (token == 0) {
            printf("End of input\n");
            break;
        }
    }
    return 0;
}
