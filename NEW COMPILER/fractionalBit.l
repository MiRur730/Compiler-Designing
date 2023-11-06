%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
extern int yylval;
%}

%%

[01]+ { yylval = atoi(yytext); return INTEGER; }
\.[01]+ { yylval = atof(yytext); return FRACTION; }
[ \t] { ; }
\n return 0;
. return yytext[0];

%%

int yywrap() {
    return 1;
}