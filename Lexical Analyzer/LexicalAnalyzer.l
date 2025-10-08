%{
#include <stdio.h>
%}
%option noyywrap

PREPROCESSOR #.*
COMMENT \/\/.*
ID [_a-zA-Z][_a-zA-Z0-9]*
keywords int|if|while

%%
{PREPROCESSOR} {printf("\npre\n");ECHO;}
{COMMENT} {printf("\ncomment\n");ECHO;}
{ID}\( {printf("\nFunction: %s\n",yytext);}
.
%%
void main(int argc, char** argv)
{
   yyin=fopen(argv[1],"r");
   yylex();
}
