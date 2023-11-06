%{
#include <stdio.h>
%}

digit [0-9]

%%

222 {
  printf("String with three consecutive 222's: %s\n", yytext);
}

. {
  /* Ignore other characters */
}

%%
int yywrap(){
    return 1;
}
int main() {
  yyin = stdin;   // Set input to stdin
  yyout = stdout; // Set output to stdout
  yylex();
  return 0;
}
