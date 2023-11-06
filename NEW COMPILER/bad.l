%{
#include <stdio.h>
#include <string.h>
%}
DIGIT [0-9]

%%

{DIGIT}+ {
  for (int i = 1; i < strlen(yytext); i++) {
    if (yytext[i] <= yytext[i - 1]) {
      printf("Not ascending\n");
      break;
    }
  }
}

%%

int yywrap() {
  return 1;
}

int main() {
  yylex();
  return 0;
}
