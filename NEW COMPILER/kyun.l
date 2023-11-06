%{
#include <stdio.h>
#include<math.h>

int sum = 0;
%}
digit [0-9]


%%

{digit}{digit}{digit}{digit} {
  for (int i = 0; i < 4; i++) {
    sum += yytext[i] - '0';
    
  }
  
  if (sum == 9) {
    printf("The sum is equal to 9.   ", yytext);
    fprintf(yyout, "%s ", yytext);
  }
  else{
    printf("The sum is not equal to 9", yytext);
  }
}

int yywrap(){
    return 1;
}

int main(){
    printf("Enter the number");
    yyin=stdin;
  
    yylex();
    
}