%{
#include <stdio.h>
#include "y.tab.h"
extern int yylval;
%}

%%
0 {return ZERO;}
1 [ return ONE;]
[\t]+ {return ;}
[\n] {return 0;}
.\   {return yytext[0];}
int yywrap(){
    return 1;
}

