%option noyywrap
%{
#include "Calculator.tab.h"
#include <stdlib.h>
%}
%%
[0-9]+(\.[0-9]+)? {yylval=atof(yytext); return INT;}
\n {return NL;}
[ \t]+    ;
. {return yytext[0];}
%%
