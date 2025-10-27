%{
#include <stdio.h>
int yyerror();
int yylex();
%}

%token id num
%left '+' '-'
%left '*' '/'
%left '(' ')'

%%
s : e '\n' {printf("Valid Expression\n");}
e : e '+' e | e '-' e | e '*' e | e '/' e | '(' e ')' | id | num
%%
int main()
{
   printf("Enter arithmetic expression\n");
   yyparse();
   return 0;
}

int yyerror()
{
   return 0;
}
