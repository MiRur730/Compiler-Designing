%{
#include <string.h>
#include <stdio.h>
%}
c[a-zA-Z]
vowel [aeiouAEIOU]
cons [^aeiouAEIOU]

%%

{vowel}{c}+ {
  /* First character is a vowel */
  /* Copy yytext into an array and append "ay" to it */
  char s[100];
  strcpy(s, yytext);
  strcat(s, "ay");
  printf("%s ", s);
  fprintf(yyout, "%s ", s);
}

{cons}[^ \t\n]+ {
  /* First character is a consonant */
  /* Create a new array to store the word */
  char new_word[100];
  int i;

  /* Copy the word to the new array, but move the first letter to the end */
  for (i = 1; i < strlen(yytext); i++) {
    new_word[i - 1] = yytext[i];
  }
  new_word[strlen(yytext) - 1] = yytext[0];
  new_word[strlen(yytext)] = 'a';
  new_word[strlen(yytext) + 1] = 'y';

  /* Print the new word */
  printf("%s ", new_word);
  fprintf(yyout, "%s ", new_word);
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
