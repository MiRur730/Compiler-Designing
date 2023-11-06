%{
/* Program to identify floating point numbers */
/* digit recognizes a single digit
num recognizes multiple digits i.e, a positive integer
snum recognizes a signed number */
%}
digit [0-9]
num {digit}+
snum [-+]?{num}
%%
({snum}(\.{num}))|([+-]?{num}\.{num}) {
/* A number is considered floating point only if there is a decimal point.
So consider all possible combinations of such */
printf ("==>%s is a floating point number\n", yytext);
}
({snum}) {
/* Number without a decimal point is not considered a floating point number */
printf ("==>%s is not a floating point number\n", yytext);
}
%%
int yywrap() {
return 1; // Indicate the end of input
}

int main ()
{
printf ("Enter any number: " );
yylex();
return 0;

}