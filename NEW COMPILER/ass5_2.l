%{
%}

%%
[01]+ {
    printf("Binary number found: %s\n", yytext);
}

[^01\n]+ {
    printf("NonBinary characters in input: %s\n", yytext);
}
%%
int yywrap(){
    return 1;
}

int main() {
    yyin=fopen("text.txt","r");
  
    yylex();

    return 0;
}
