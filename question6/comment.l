%{
/* 2. Write a LEX program to remove the comments from a c file. */
%}
%%
\/\/(.*) {};
\/\(.\n).\*\/ {};
%%
int yywrap(){
    return 1; //indicate the end of input
}
int main() {
yyin = fopen("input.c", "r");
yyout = fopen("output.c", "w");
yylex();
fclose(yyin);
fclose(yyout);
return 0;
}