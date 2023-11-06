%{
#include <stdio.h>
%}

digit [0-9]

%%

[^5]*5[^5]*5[^5]*|[^5]*5[^5]*5|[^5]*5 {
  printf("String with at least two 5's in every block of five consecutive symbols: %s\n", yytext);
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
