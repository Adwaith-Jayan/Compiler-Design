%option noyywrap
%{
#include "ArithmeticExpression.tab.h"
%}

%%
[_a-zA-Z][_a-zA-Z0-9]* {return id;}
[0-9]* {return num;}
. {return yytext[0];}
\n {return '\n';}
%%
