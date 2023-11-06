%{
#include <stdio.h>
int in_comment = 0;
%}

%%

"/*" {   /* Begin a multi-line comment */
    in_comment = 1;
}

. {
    if (!in_comment) {
        putchar(yytext[0]);  /* Output the current character */
    }
}

"*/" {   /* End a multi-line comment */
    in_comment = 0;
}

"//" {   /* Begin a single-line comment */
    in_comment = 1;
    while (yytext[0] != '\n') {
        putchar(yytext[0]);  /* Ignore the content of the single-line comment */
    }
    putchar(yytext[0]);      /* Output the newline character */
    in_comment = 0;          /* Reset comment flag */
}

%%
int yywrap(){
    return 1;
}
int main() {
    yyin = stdin;   /* Set input to stdin */
    yyout = stdout; /* Set output to stdout */
    yylex();
    return 0;
}
