#include <stdio.h>
extern FILE *yyin;
extern int yylineno;
int lastLine = 0;
extern int yyparse();

int main(int argc, char *argv[])
{
    yyin = fopen(argv[1], "r");
    yyparse();
    fclose(yyin);
    return 0;
}

int yyerror(char *s)
{
    if (lastLine != yylineno)
    {
        fprintf(stderr, "Linea: %d %s\n", yylineno, s);
    }
    
    lastLine = yylineno;

    return 0;
}