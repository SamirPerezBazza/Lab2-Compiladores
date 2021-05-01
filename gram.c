#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern FILE *yyin;
extern int yylineno;
int lastLine = 0;
int erroresCont = 0;
extern int yyparse();

char *catenate(char *s1, char *s2);

FILE *out;
char *lines = "Prueba con el archivo de entrada\n";

int main(int argc, char *argv[])
{
    yyin = fopen(argv[1], "r");
    yyparse();
    fclose(yyin);
    out = fopen("saliday.txt", "wt");
    if (erroresCont == 0)
    {
        lines = catenate(lines, "0 errores\n");
    }
    fputs(lines, out);
    fclose(out);

    return 0;
}

int yyerror(char *s)
{
    if (lastLine != yylineno)
    {
        char *line = malloc(strlen("Linea %d error\n") + sizeof(int) + 1);
        //fprintf(stderr, "Linea: %d %s\n", yylineno, s);
        sprintf(line, "Linea %d error\n", yylineno);
        lines = catenate(lines, line);
        free(line);
        erroresCont++;
    }

    lastLine = yylineno;

    return 0;
}

char *catenate(char *s1, char *s2)
{
    char *cat;
    int space_needed = strlen(s1) + strlen(s2) + 1;
    cat = malloc(space_needed);
    strcpy(cat, s1);
    strcpy(cat + strlen(s1), s2);
    return cat;
}
