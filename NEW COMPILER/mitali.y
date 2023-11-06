%{
#include <stdio.h>
int flag = 1;
%}

%token id num

%%

stmt: expression { printf("\nValid result is %d\n", $1); }
    ;

expression: '(' expression ')'      { $$ = $2; }
          | '(' expression          { printf("Invalid: Missing closing parenthesis\n"); }
          | expression '&''&' expression { $$ = $1 && $3; }
          | expression '&''&'  {printf("INvalid expression: Missing expression right");}
          | expression '|''|' expression { $$ = $1 || $3; }
          | expression '|''|'  {printf("INvalid expression: Missing expression right");}
          | '!' expression           { $$ = !($2); }
          | id                      { $$ = flag; }
          | num                     { $$ = flag; }
          ;

%%

int main() {
    printf("Enter a logical expression: ");
    yyparse();
    return 0;
}

void yyerror(char *s) 
{
    printf("Invalid: %s\n", s);
}



