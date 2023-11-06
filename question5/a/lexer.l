%{
   #include<stdio.h>
%}

%%
[0-9]*00  {printf("part a - accepted!!");}
[0-9]*222 {printf("part b - accepted!!");}
([0-9]*5[0-9]*5[0-9]*)+ {printf("part c - accepted!!");}
%%

int yywrap()
{
    return 1;
}
int main()
{
    yylex();
    return 0;
}
