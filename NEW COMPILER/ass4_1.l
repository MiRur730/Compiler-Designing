%{
#include <stdio.h>
%}

digit [0-9]

%%

.*1[0-9]{9} {
  /* The 10th digit from the right end is 1 */
  printf("String belongs to grammar.\n");
}

.* {
  /* String does not match the grammar */
  printf("String does not belong to grammar.\n");
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
