%{

#include <stdio.h>
    
%}

%token NUMBER

%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%
stmt: E  {printf("Result is %d",$$);};

E: E '+' E  {$$=$1+$3;}
 | E '-' E  {$$=$1-$3;}
 | E '*' E  {$$=$1*$3;}
 | E '/' E  {$$=$1/$3;}
 | E '%' E  {$$=$1%$3;}
 | '(' E ')'
 | NUMBER
 ;

%%


int main(){
    printf("Enter the arithemataic calculator expression");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}