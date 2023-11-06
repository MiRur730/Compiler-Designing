%{
#include <stdio.h>
int flag=0;
%}

%token NUMBER

%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%

stmt: E {printf("Result is %d",$$);};

E: E '+' E {$$= $1 + $3 ;}
    | E '*' E {$$=$1 * $3   ;}
    | E '-' E {$$=$1 - $3   ;}
    | E '/' E {$$=$1 / $3   ;}
    |E '%' E {$$=$1 + $3   ;}
    | '('E')'   {$$=$1 + $3   ;}
    | NUMBER
    ;
%%

int main() {
    printf("Enter aarith expression: ");
    yyparse();
    return 0;
}

void yyerror(char *s) 
{
    printf("Invalid: %s\n", s);
}