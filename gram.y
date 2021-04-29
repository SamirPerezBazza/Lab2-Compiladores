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

//IDENTIFICADOR 
%token IDENTIFICADOR 21

//NUMEROS 
%token ENTERO 22
%token LONG_ENTERO 23
%token DECIMAL 24
%token IMAGINARIO 25
%token CADENA 26

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
%token BITWISE_DER_ASSIGN 36
%token BITWISE_IZQ_ASSIGN 37
%token SUMA_ASSIGN 38
%token RESTA_ASSIGN 39
%token MULT_ASSIGN 40
%token DIV_ASSIGN 41
%token DIV_ENT_ASSIGN 42
%token BITWISE_AND_ASSIGN 43
%token BITWISE_OR_ASSIGN 44
%token BITWISE_XOR_ASSIGN 45
%token EXP_ASSIGN 46
%token MOD_ASSIGN 47


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
 | program func {printf("funcion\n");}
 |
 ;
statements:
 statements statement
 | 
; 
statement: error
 | expr 
 | assignment
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
 ENTERO {/*  printf("lineExpr=%d\n", yylineno); */}
 | CADENA 
 | lista 
 | boolExpr 
 | aritExpr 
 | posLista 
 | PAR_ABRE expr PAR_CIERRA
 | ER {printf("Pls\n");}
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

posLista:
 IDENTIFICADOR COR_ABRE aritExpr COR_CIERRA
 | IDENTIFICADOR COR_ABRE ENTERO COR_CIERRA
 | IDENTIFICADOR COR_ABRE IDENTIFICADOR COR_CIERRA
 ;

func:
 funcDeclare statements{printf("func\n");}
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
%%
/* int main(void) {
 yyparse();
 return 0;
}  */
/*asi leo un archivo*/