%{
#include <stdio.h>
int word_count = 0;
int in_word = 0; // Flag to indicate if we are inside a word
%}

%%
[a-zA-Z]+ {
    if (!in_word) {
        word_count++;
    }
    in_word = 1; // Inside a word
}

[ \t\n]+ {
    in_word = 0; // Word delimiter (whitespace)
}

. {
    in_word = 0; // Any other character should also be a delimiter
}

%%
int yywrap(){
    return 1;
}
int main() {
    printf("Enter the line: ");
    yylex();
    printf("Word count is %d\n", word_count);
    return 0;
}
