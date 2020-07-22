%{
#include <stdio.h>
#include <stdlib.h>

int lineno = 0;
%}

%union {
	int vint;
	double vdouble;
	char vchar;
	char vstring[512];
}

%token <vint> INT
%token <vdouble> DOUBLE
%token <vstring> VARIABLE

%token OPEN_PAR CLOSE_PAR
%token INT_DEC DOUBLE_DEC
%token ASSIGN
%token AR_ADD AR_SUB AR_MULT AR_DIV AR_MOD AR_QUO
%token COMMENT ENDL

%type<vint> expression_int
%type<vdouble> expression_double

%%
input: 
| input command
;

command:

var_declaration ENDL {
	lineno++;
}|
var_definition ENDL {
	lineno++;
}
;

var_declaration: 

INT_DEC VARIABLE
{
	printf("Declaring int variable [%s]\n", $2);
}|

DOUBLE_DEC VARIABLE
{
	printf("Declaring double variable [%s]\n", $2);
}
;

var_definition: VARIABLE ASSIGN expression_int
{
	printf("Defining variable [%s] to be [%d]\n", $1, $3);
}
;



expression_int: 
expression_int AR_SUB expression_int {
	$$ = $1 - $3;
}|
expression_int AR_ADD expression_int {
	$$ = $1 + $3;
}|
expression_int AR_MOD expression_int {
	$$ = $1 % $3;
}|
expression_int AR_QUO expression_int {
	$$ = $1 / $3;
}|
expression_int AR_DIV expression_int {
	$$ = $1 / $3;
}|
expression_int AR_MULT expression_int {
	$$ = $1 * $3;
}|
OPEN_PAR expression_int CLOSE_PAR {
	$$ = $2;
}|
INT {
	$$ = $1;
	printf("Integer [%d]\n",$1);
}|
DOUBLE {
	$$ = $1;
	printf("Double [%.2f]\n",$1);
}
;
%%

int yyerror(char *s)
{
  printf("Error! Line %d: %s\n",lineno,s);
  return 0;
}

int yywrap()
{
  return 1;
}