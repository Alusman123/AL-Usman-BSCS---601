%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(const char *s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%

expr: expr '+' expr { printf("Result: %d\n", $1 + $3); }
    | expr '-' expr { printf("Result: %d\n", $1 - $3); }
    | expr '*' expr { printf("Result: %d\n", $1 * $3); }
    | expr '/' expr { 
        if ($3 == 0) yyerror("Division by zero"); 
        else printf("Result: %d\n", $1 / $3); 
    }
    | NUMBER { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter arithmetic expressions:\n");
    yyparse();
    return 0;
}
