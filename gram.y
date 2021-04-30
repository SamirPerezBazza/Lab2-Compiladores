//OPERADORES
%token OPERADOR 1
%token OPERADOR_COMP 2


//RESERVADAS
%token BOOL_STATE 3
%token IN 5
%token NOT 6

//Función
%token DEF 7
%token RETURN 8

//NUMEROS 
%token ENTERO 9
%token LONG_ENTERO 10
%token DECIMAL 11
%token IMAGINARIO 12
%token CADENA 13

//IF
%token IF 14
%token ELIF 15
%token ELSE 16

//FOR
%token FOR 17
%token RANGE 18
%token LEN 19

//WHILE
%token WHILE 20

//IDENTIFICADOR 
%token IDENTIFICADOR 21

//RESERVED 
%token BREAK 22
%token PASS 23
%token CONTINUE 24
%token IMPORT 25
%token PRINT 26


//DELIMITADORES
%token PAR_ABRE 27
%token PAR_CIERRA 28
%token COR_ABRE 29
%token COR_CIERRA 30
%token ASSIGN 31
%token SEMICOLON 32
%token COMA 33
%token COLON 34
%token PUNTO 35


%token RESERVADA 48
%token BLANK_TAB_SPACE 49



%token ER 999
%start program
%{
 #include <stdio.h>
 int yyerror(char *);
 int yylex(void);
 int cont = 0; 
 int exps = 0;
 int yydebug=1;
 extern int yylineno;
 /* extern FILE *yyin;
 extern int yylineno; */
%}
%%
program:
 program statements {printf("statement\n");}
 | program BLANK_TAB_SPACE {yylineno++;printf("vacio\n");} 
 |
 ;
statements:
 statements statement
 | 
; 
statement: error
 | expr 
 | assignment
 | func
 | ifStatement
 | forStatement
 | whileStatement
 | PASS
 | BREAK
 | CONTINUE
 | import
 | print
 | BLANK_TAB_SPACE {yylineno++;}
 ;

assignment:
 identificadores ASSIGN exprs {printf("ids=%d, exps=%d, linea=%d\n",cont,exps,yylineno);
 if (cont!=exps){
    yyerror("syntax error ASSINGMENT");
 }
 cont=0;exps=0;
 }
 ;

identificadores:
 IDENTIFICADOR {cont++;printf("id\n");}
 | identificadores COMA identificadores {printf("ids \n");}
;

exprs:
 expr {exps++;}
 | exprs COMA expr {exps++;}
;

expr: 
 numeros {/*  printf("lineExpr=%d\n", yylineno); */}
 | CADENA 
 | lista 
 | matriz
 | boolExpr 
 | aritExpr 
 | posLista 
 | PAR_ABRE expr PAR_CIERRA
 | functCall
 | ER {printf("Pls\n");}
 ;

numeros:
 ENTERO
 | DECIMAL
 | IMAGINARIO
 | LONG_ENTERO
 ;

functCall:
  IDENTIFICADOR PAR_ABRE listaIN PAR_CIERRA
  | IDENTIFICADOR PAR_ABRE PAR_CIERRA
;

aritExpr:
 expr OPERADOR expr   
 ;

boolExpr:
 expr OPERADOR_COMP expr {/* printf("expbool \n"); */}
 | IDENTIFICADOR 
 | BOOL_STATE 
 | expr IN expr 
 | NOT expr
 ;

lista:
 COR_ABRE COR_CIERRA
 | COR_ABRE listaIN COR_CIERRA 
 ;

listaIN:
 expr 
 | listaIN COMA expr 
;

matriz:
 posLista listaCuerpo
;

listaCuerpo:
 COR_ABRE aritExpr COR_CIERRA
 | COR_ABRE ENTERO COR_CIERRA
 | COR_ABRE IDENTIFICADOR COR_CIERRA
;

posLista:
 IDENTIFICADOR listaCuerpo  
 ;

func:
 funcDeclare statements {printf("func\n");}
 | funcDeclare statements RETURN expr
;

funcDeclare:
 DEF IDENTIFICADOR PAR_ABRE parametros PAR_CIERRA COLON BLANK_TAB_SPACE {yylineno++;printf("fundeclare\n");}
 | DEF IDENTIFICADOR PAR_ABRE PAR_CIERRA COLON BLANK_TAB_SPACE {yylineno++;}
;

parametros:
IDENTIFICADOR
 | parametros COMA parametros
;

ifStatement:
 IF boolExpr COLON statements 
 | ELIF boolExpr COLON statements 
 | ELSE COLON statements 
;


forStatement:
 FOR IDENTIFICADOR IN sequence COLON statements
;

whileStatement:
 WHILE boolExpr COLON statements
;

sequence:
 lista
 | rango
;

rango:
 RANGE PAR_ABRE expr PAR_CIERRA
 | RANGE PAR_ABRE expr COMA expr PAR_CIERRA
 | RANGE PAR_ABRE len PAR_CIERRA
;

len:
 LEN PAR_ABRE expr PAR_CIERRA
;

import:
  IMPORT IDENTIFICADOR
;

print:
 PRINT PAR_ABRE listaIN PAR_CIERRA
;
%%
/* int main(void) {
 yyparse();
 return 0;
}  */
/*asi leo un archivo*/