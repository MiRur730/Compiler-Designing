
%{
#include <stdio.h>
void yyerror(const char *s); // Corrected the argument type
%}

%token ZERO ONE

%%

stmp: L {printf("Conversion done\n");} ; // Added missing semicolon and closing double quote

L:  L B {$$=$1*2+$2;}
 | B    {$$=$1;}
;

B: ZERO {$$=0;}  // Changed $1 to 0, assuming ZERO represents 0
 | ONE  {$$=1;}  // Changed $1 to 1, assuming ONE represents 1
  ;

%%

int main(){
    printf("Enter the number: ");
    yyparse(); // Corrected the function name to 'yyparse'
    return 0;  // Added a return statement
}

void yyerror(const char *s){ // Corrected the argument type
    printf("ERROR: %s\n", s); // Added a newline character
}
