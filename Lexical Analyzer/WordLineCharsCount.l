%option noyywrap
%{
#include <stdio.h>
int word_count=0,lines_count=0,char_count=0;
%}

%%
[a-zA-Z0-9]+ {word_count++;char_count+=yyleng;}
\n {lines_count++;char_count++;}
. {char_count++;}
%%

void main(int argc, char** argv)
{
   yyin=fopen(argv[1],"r");
   yylex();
   fclose(yyin);
   printf("%d\n",word_count);
   printf("%d\n",lines_count);
   printf("%d\n",char_count);
}
