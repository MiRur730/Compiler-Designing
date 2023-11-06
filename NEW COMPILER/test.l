%{
#include<stdio.h>
#include<string.h>
%}

c [a-zA-Z]
vowel [aeiouAEIOU]
const [^ aeiouAEIOU]

%%

{vowel}{c}+ {
    char s[100];
    strcpy(s,yytext);
    strcat(s,"ay");
    printf("%s",s);
}

{const}{c}+  {
    char s[100];

    for (int i=1;i<strlen(yytext);i++){
        s[i-1]=yytext[i];

    }
    s[strlen(yytext+1)]='y';
    s[strlen(yytext-1)]=yytext[0];
    s[strlen(yytext)]='a';
    
    printf("%s",s);
}

%%

int yywrap(){
    return 1;
}
int main() {
  yyin = stdin;   // Set input to stdin
  yyout = stdout; // Set output to stdout
  yylex();
  return 0;
}