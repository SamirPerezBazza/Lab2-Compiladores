#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

typedef struct stringData
{
    char data[100];
    struct stringData *next;
} Node;

Node *ptr = NULL;

void insert(char *s)
{
    Node *newNode = (Node *)malloc(sizeof(Node));
    strcpy(newNode->data, s);
    if (ptr == NULL)
    {
        ptr = newNode;
    }
    else
    {
        Node *pt = ptr;
        while (pt->next != NULL)
        {
            pt = pt->next;
        }
        pt->next = newNode;
    }
}

int IdExist(char *s)
{
    Node *ptrTemp = ptr;
    //start from the beginning
    while (ptrTemp != NULL)
    {
        if (strcmp(s, ptrTemp->data) == 0)
        {
            return 1;
        }
        ptrTemp = ptrTemp->next;
    }
    return 0;
}

void printList()
{
    Node *ptrTemp = ptr;
    printf("\n[head] =>");
    //start from the beginning
    while (ptrTemp != NULL)
    {
        printf(" %s =>", ptrTemp->data);
        ptrTemp = ptrTemp->next;
    }
    printf(" [null]\n");
}

extern int yylex();
extern int yylineno;
extern char *yytext;

char *catenate(char *s1, char *s2);
char *toUpper(char *s1);
int inRange(int a, int b, int value);

int erroresCount = 0;
int idsCount = 0;

//entero = 9
//ids = 21
//parAbre = 27
//punto 35
char *names[] = {NULL, "operador", "operadorComp",NULL,NULL,NULL,NULL,NULL,NULL,"entero","longEntero", "decimal", "imaginario", "cadena",NULL,NULL,NULL,NULL,
NULL,NULL,NULL,"identificador",NULL,NULL,NULL,NULL,NULL,"parAbre","parCierra","corAbre","corCierra","assign","semiColon","coma","colon","punto"};

char *file_text = "";
char *token = "";
int cont = 0;

int main()
{

    int ntoken = yylex();
    //si no es fin de linea
    if(ntoken == 50){
        printf("El archivo de entrada esta vacio\n");
        return 0;
    }

    while (ntoken)
    {
        //Mayusculas para servervadas
        if (inRange(3, 8, ntoken) || inRange(14, 20, ntoken) || inRange(22, 26, ntoken))
        {
            token = malloc(strlen(yytext) + 1);
            sprintf(token, "%s", toUpper(yytext));
        }
         //Espacios y newLine
        else if (ntoken == 36 || ntoken == 37){
            token = malloc(strlen(yytext) + 1);
            sprintf(token, "%s", yytext);
        }
        else{
            if (ntoken != 999)
            {
                if (ntoken == 21)
                {
                    if (!IdExist(yytext))
                    {
                        insert(yytext);
                        idsCount++;
                    }
                }
                token = malloc(strlen(names[ntoken]) + strlen(yytext) + 2);
                sprintf(token, "%s=%s", names[ntoken], yytext);
            }
            else
            {
                token = malloc(strlen(yytext) + 1 + strlen("ERROR="));
                sprintf(token, "ERROR=%s", yytext);
                erroresCount += 1;
            }
        }

        file_text = catenate(file_text, token);
        free(token);
        ntoken = yylex();
        cont++;
    }
    
        
    char *idsData = malloc(strlen(" Identificadores") + sizeof(int) + 1);
    sprintf(idsData, "\n\n%d Identificadores\n\n", idsCount);
    file_text = catenate(file_text, idsData);
    free(idsData);
    Node *pt = ptr;
    char *id = "";
    char *ids = "";
    int cont = 1;
    while (pt != NULL)
    {
        id = malloc(strlen(pt->data) + sizeof(int) + 1 + strlen("Id = "));
        sprintf(id, "Id%i=%s\n", cont, pt->data);
        ids = catenate(ids, id);
        cont++;
        pt = pt->next;
        free(id);
    }
    file_text = catenate(file_text, ids);
    free(ids);
    char *errores_str = malloc(strlen("Errores") + 1 + 2);
    sprintf(errores_str, "\n%d Errores", erroresCount);
    file_text = catenate(file_text, errores_str);
    free(errores_str);

    FILE *f;

    f = fopen("LenguajeTokens.txt", "wt");
    fputs(file_text, f);
    fclose(f);

    //free(token);
    //free(file_text);
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

char *toUpper(char *s1)
{
    char *newChar = malloc(strlen(s1) + 1);
    int i = 0;
    while (*s1)
    {
        char c = *s1;
        newChar[i] = toupper(c);
        i++;
        s1++;
    }
    return newChar;
}

int inRange(int a, int b, int value)
{
    return (value >= a && value <= b);
}