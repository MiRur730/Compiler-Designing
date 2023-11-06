%{
  
#include <stdio.h>
#include <string.h>
int found=0;

%}

digit [0-9]
num {digit}+(.\{digit}+)?
%%

 {num} {
    for(int i=0;i<yyleng;i++){
        if(yytext[i]=='7'){
          found=1;
        }
    }
    if(found==0){
        printf ("not 7:");
    }
    else{
        printf ("found 7:");
    }   
    }

%%
int yywrap(){
    return 1;

}
int main() {
  yyin = stdin;   // Set input to stdin
  yylex();
  return 0;
}
