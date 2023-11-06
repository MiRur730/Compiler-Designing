%{



%}

%%
[0-9]*[7][0-9]*  { printf("Found number with \n"); }
[0-6]*[8-9]* { printf(" Not Found number with ");}
%%
int yywrap(){
    return 1;
}

int main() {
    yyin=fopen("text.txt","r");
  
    yylex();

    return 0;
}
