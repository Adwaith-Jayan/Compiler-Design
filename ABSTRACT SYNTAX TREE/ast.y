%{
#include "ast.h"
ASTNODE *root=NULL;
int yyerror();
int yylex();
%}

%union{
int INT;
ASTNODE *ptr;
}

%token <INT> NUM
%token NL

%left '+' '-'
%left '*' '/'

%%
stmnt : expr NL {root=$<ptr>1; return 0;}
      ;
expr  : expr '+' expr {$<ptr>$=make_node('+',$<ptr>1,$<ptr>3);}
      | expr '-' expr {$<ptr>$=make_node('-',$<ptr>1,$<ptr>3);}
      | expr '*' expr {$<ptr>$=make_node('*',$<ptr>1,$<ptr>3);}
      | expr '/' expr {$<ptr>$=make_node('/',$<ptr>1,$<ptr>3);}
      | '(' expr ')' {$<ptr>$=$<ptr>2;}
      | NUM {$<ptr>$=make_leaf($1);}
      ;

%%

int main()
{
   yyparse();
   printf("AST\n\n");
   print_ast(root);
   printf("\n");
   return 0;
}

int yyerror()
{
   printf("Parsing Error\n");
   return 0;
}

