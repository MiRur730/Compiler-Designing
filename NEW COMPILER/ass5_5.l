%{
    #include <stdio.h>
%}

%%
[0-9]+ {
    int num = atoi(yytext); // Convert the matched text to an integer
    int isAscending = 1;   // Flag to check if digits are in ascending order
    int prevDigit = num % 10; // Initialize prevDigit with the last digit

    num /= 10; // Remove the last digit

    while (num > 0) {
        int currentDigit = num % 10;
        if (currentDigit > prevDigit) {
            isAscending = 0; // Digits are not in ascending order
            break;
        }
        prevDigit = currentDigit;
        num /= 10;
    }

    if (isAscending) {
        printf("Ascending order number: %s\n", yytext);
    }
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
