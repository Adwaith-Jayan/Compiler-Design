%{
#include "ValidIdentifier.tab.h"
%}

%option noyywrap

%%
_+ {return UNDER;}
[a-zA-Z]+ {return ALPHA;}
[0-9]+ {return DIGIT;}
. {return yytext[0];}
\n {return '\n';}
%%
