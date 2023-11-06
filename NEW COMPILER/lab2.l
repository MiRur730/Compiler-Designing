%{
#include <stdio.h>
%}

DIGIT       [0-9]
LETTER      [a-zA-Z]
ID          ({LETTER}|_){LETTER}*
NUMBER      {DIGIT}+(\.{DIGIT}+)?([eE][+-]?{DIGIT}+)?
WS          [ \t\n]

%%

int|float|char|if|else    { printf("Keyword: %s\n", yytext); }
{ID}                      { printf("Identifier: %s\n", yytext); }
{NUMBER}                  { printf("Constant: %s\n", yytext); }
"+"|"-"|"*"|"/"|"="        { printf("Operator: %s\n", yytext); }
"(" | ")" | "{" | "}" | ";"   { printf("Punctuation: %s\n", yytext); }

{WS}                      ; // Skip whitespace

.                         { printf("Unrecognized token: %s\n", yytext); }

%%

int yywrap(void) {
    return 1; // Indicate the end of input
}

int main() {
    yylex();
    return 0;
}
