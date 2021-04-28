#include <stdio.h>
extern FILE *yyin;
extern int yylineno;
extern int yyparse();

int main(int argc, char *argv[]) {
 yyin = fopen(argv[1], "r");
 int code=yyparse();
 printf("Parse_c=%d\n",code);
 fclose(yyin);
 return 0;
}

int yyerror(char *s) {
 fprintf(stderr, "Linea: %d %s\n", yylineno, s);
 return 0;
}