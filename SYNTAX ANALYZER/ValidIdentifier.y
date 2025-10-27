%{
#include <stdio.h>
int yylex();
int yyerror();
%}

%token ALPHA DIGIT UNDER

%%
start : s '\n' {printf("\n Valid Identifier\n");}
      ;
s     : UNDER A
      | ALPHA A
      ;
A     : UNDER A
      | DIGIT A
      | ALPHA A
      |
      ;

%%

int main()
{
   printf("Enter :");
   yyparse();
   return 0;
}
int yyerror()
{
   printf("Invalid id\n");
   return 0;
}

