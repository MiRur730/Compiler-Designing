%{
#include <stdio.h>
%}

%%
[0-9]+"."[0-9]+         { printf("Floating Point Number: %s\n", yytext); }
[0-9]+"e"[+-]?[0-9]+   { printf("Floating Point Number: %s\n", yytext); }
[0-9]+"E"[+-]?[0-9]+    { printf("Floating Point Number: %s\n", yytext); }
[0-9]+                  { printf("Integer: %s\n", yytext); }
.                       { /* Ignore other characters */ }
%%

int yywrap() {
    // Return 1 to indicate the end of input.
    return 1;
}

int main() {
    while (1) {
        printf("Enter text (Ctrl+C to exit): ");
        yylex();
    }
    return 0;
}
