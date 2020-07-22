#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "y.tab.h"

extern FILE *yyin;

int main(int argc, char** argv){
	if(argc < 2){
		printf("ERROR: specify input file!\n");
		return 1;
	}

	yyin = fopen(argv[1],"r");

	yyparse();

	return 0;
}