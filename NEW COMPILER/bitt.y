
%{
    #include <stdio.h>
    int bit_count = 0; 
%}

%token ZERO ONE

%start input

%%
input: /* empty */
     | input ZERO  { bit_count++; }
     | input ONE   { bit_count++; }
     ;
ZERO: '0';
ONE: '1';
%%

int main() {
    yyparse(); // Start parsing
    printf("Number of 1 bits: %d\n", bit_count);
    return 0;
}