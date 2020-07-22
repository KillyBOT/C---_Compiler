%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
%}

%%
[ \t\n ]+ ;

; {return ENDL;}

\( {return OPEN_PAR;}
\) {return CLOSE_PAR;}

int {return INT_DEC;}

double {return DOUBLE_DEC;}

= {return ASSIGN;}

\/\/ {return AR_QUO;}
\+ {return AR_ADD;}
\- {return AR_SUB;}
\* {return AR_MULT;}
\/ {return AR_DIV;}
\% {return AR_MOD;}

\/\*.*\*\/ {
	//printf("[%s] is a comment\n",yytext);
	return COMMENT;
}

\-?[0-9]+ {
	yylval.vint = atoi(yytext);
	//printf("[%s] is an integer value\n", yytext);
	return INT;
}

\-?\.[0-9]+ |
\-?[0-9]+\.[0-9]+ |
\-?[0-9]+\. {
	yylval.vdouble = atof(yytext);
	//printf("[%s] is a double value\n", yytext);
	return DOUBLE;
}

[a-zA-Z0-9_]+ {
	//printf("[%s] is a variable\n",yytext);
	strcpy(yylval.vstring, yytext);
	return VARIABLE;
}

%%
