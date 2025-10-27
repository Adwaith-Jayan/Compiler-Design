%{
#include <stdio.h>
#include <stdlib.h>
int yyerror();
int yylex();
%}

%define api.value.type{double}

%token INT NL
%left '+' '-'
%left '*' '/'
%left '(' ')'
%right UMINUS

%%
s : e NL {printf("\n%f\n",$1); return 0;}
  ;
e : e '+' e {$$=$1 + $3;}
  | e '-' e {$$=$1 - $3;}
  | e '*' e {$$=$1 * $3;}
  | e '/' e {$$=$1 / $3;}
  | '-' e %prec UMINUS {$$= -$2;}
  | '(' e ')' {$$=$2;}
  | INT 
  ;
%%
int main()
{
   printf("Enter ex; ");
   yyparse();
   return 0;
}
int yyerror()
{
   return 0;
}
