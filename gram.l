%{
 #include <stdlib.h>
 int yyerror(char *);
 #include "y.tab.h"
 void skipcomments();
%}
identificador [_a-zA-Z][_a-zA-Z0-9]*
entero ([-+]?[0-9][0-9]*)
long_entero {entero}[lL]
/*falta arreglar la e*/
decimal ({entero}[.]|[.]{entero}|{entero}[.]{entero})(e[+-]?[1-9][0-9]*)?
imaginario ({entero}|{decimal})[jJ]



%%
 /*Funciones*/
"def" return DEF;
"return" return RETURN;
"if" return IF;
"elif" return ELIF;
"else" return ELSE;
"for" return FOR;
"range" return RANGE;
"len" return LEN;
"while" return WHILE;
"break" return BREAK;
"pass" return PASS;
"continue" return CONTINUE;
"import" return IMPORT;
"print" return PRINT;

 /* operador de comparación */
[<>] return OPERADOR_COMP;
"<=" return OPERADOR_COMP;
">=" return OPERADOR_COMP;
"==" return OPERADOR_COMP;
"!=" return OPERADOR_COMP;
"<>" return OPERADOR_COMP;
"in" return IN;
"and" return OPERADOR_COMP;
"or" return OPERADOR_COMP;
"is" return OPERADOR_COMP;
"not" return NOT;
"True" return BOOL_STATE;
"False" return BOOL_STATE;



\n {return BLANK_TAB_SPACE;} //Incremento la variable de linea
 /* operators */
[-+/*%&|^~] return OPERADOR;
"**" return OPERADOR;
"//" return OPERADOR;
"<<" return OPERADOR;
">>" return OPERADOR;


 /* delimitadores */
"(" return PAR_ABRE;
")" return PAR_CIERRA;
"[" return COR_ABRE;
"]" return COR_CIERRA;
"=" return ASSIGN;
"+="   return ASSIGN;
"-=" return ASSIGN;
"*=" return ASSIGN;
"/=" return ASSIGN;
"//=" return ASSIGN;
"<<=" return ASSIGN;
">>=" return ASSIGN;
"&=" return ASSIGN;
"|=" return ASSIGN;
"^=" return ASSIGN;
"**=" return ASSIGN;
"%=" return ASSIGN;
";" return SEMICOLON;
"," return COMA;
":" return COLON;
"." return PUNTO;

 /* skip whitespace */
[ \t] ;
 /* skip comments */
\# skipcomments();

{identificador}         return IDENTIFICADOR;
{entero}                return ENTERO;
{long_entero}           return LONG_ENTERO;
{decimal}               return DECIMAL;
{imaginario}            return IMAGINARIO;
\"([^\\\"\']|\\.)*\"    return CADENA;
\'([^\\\"\']|\\.)*\'    return CADENA;

({entero}|{decimal}){identificador} return ER;

 /* anything else is an error */
. return ER;
%%
int yywrap(void) {
 return 1;
}
void skipcomments(){
     char n = input();
     while (n != '\n' && n != 0){
         n = input();
     }
     yylineno++;
}