%{
    #include <stdio.h>
int evenCount = 0; // Counter for even numbers
int oddCount = 0;  // Counter for odd numbers
%}

%%
[0-9]+ {
    
    int num = atoi(yytext); // Convert the matched text to an integer
    if (num % 2 == 0) {
        evenCount++;
    } else {
        oddCount++;
    }
}
%%
int yywrap(){
    return 1;
}

int main() {
    yyin=fopen("text.txt","r");
      yylex();
    printf("Even numbers: %d\n", evenCount);
    printf("Odd numbers: %d\n", oddCount);
  
    return 0;
}
