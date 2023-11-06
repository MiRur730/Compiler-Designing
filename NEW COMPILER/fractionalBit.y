%{
#include <stdio.h>
#include <math.h>
%}

%token INTEGER FRACTION

%%

input: INTEGER '.' FRACTION { printf("Decimal equivalent: %lf\n", binary_to_decimal($1, $3)); }
     ;

INTEGER: L {printf("\n%d", $$);}

L: L B {$$=$1*2+$2;}
 | B {$$=$1;} 
;
B:ZERO {$$=$1;} 
|ONE {$$=$1;}
; 

FRACTION: K {printf("\n%d", $$);}

K:  M K {$$=$1*2+$2;}
 | K {$$=$1;} 
;
K:ZERO {$$=$1;} 
|ONE {$$=$1;}
; 


%%

int main() {
    printf("Enter a binary number (e.g., 101.1101): ");
    yyparse();
    return 0;
}

double binary_to_decimal(const char *integerPart, const char *fractionPart) {
    double decimal = 0.0;

    // Convert the integer part to decimal
    int integer = 0;
    int bitValue = 1;
    for (int i = strlen(integerPart) - 1; i >= 0; i--) {
        if (integerPart[i] == '1') {
            integer += bitValue;
        }
        bitValue *= 2;
    }

    // Convert the fractional part to decimal
    double fraction = 0.0;
    double fractionBitValue = 0.5;
    for (int i = 0; i < strlen(fractionPart); i++) {
        if (fractionPart[i] == '1') {
            fraction += fractionBitValue;
        }
        fractionBitValue /= 2.0;
    }

    decimal = integer + fraction;

    return decimal;
}

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

