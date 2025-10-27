%{
#include "ast.h"
#include "ast.tab.h"
%}

%option noyywrap

%%
[0-9]+ { yylval.INT=atoi(yytext);return NUM;}
\n {return NL;}
. {return yytext[0];}

%%
