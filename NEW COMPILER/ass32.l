

%{
#include <stdio.h>
%}

digit [0-9]

%%

.*00 {
  printf("String ending in 00: %s\n", yytext);
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