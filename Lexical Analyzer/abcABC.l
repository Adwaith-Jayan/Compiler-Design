%option noyywrap
%{
#include <stdio.h>
#include <string.h>
%}
%%
"abc" {strcpy(yytext,"ABC");ECHO;}
%%
void main()
{
   printf("Enter input string\n");
   yylex();
}

