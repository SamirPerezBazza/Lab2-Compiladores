/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    OPERADOR = 1,
    OPERADOR_COMP = 2,
    BOOL_STATE = 3,
    IN = 5,
    NOT = 6,
    DEF = 7,
    RETURN = 8,
    ENTERO = 9,
    LONG_ENTERO = 10,
    DECIMAL = 11,
    IMAGINARIO = 12,
    CADENA = 13,
    IF = 14,
    ELIF = 15,
    ELSE = 16,
    FOR = 17,
    RANGE = 18,
    LEN = 19,
    WHILE = 20,
    IDENTIFICADOR = 21,
    BREAK = 22,
    PASS = 23,
    CONTINUE = 24,
    IMPORT = 25,
    PRINT = 26,
    PAR_ABRE = 27,
    PAR_CIERRA = 28,
    COR_ABRE = 29,
    COR_CIERRA = 30,
    ASSIGN = 31,
    SEMICOLON = 32,
    COMA = 33,
    COLON = 34,
    PUNTO = 35,
    BLANK_TAB_SPACE = 36,
    ER = 999
  };
#endif
/* Tokens.  */
#define OPERADOR 1
#define OPERADOR_COMP 2
#define BOOL_STATE 3
#define IN 5
#define NOT 6
#define DEF 7
#define RETURN 8
#define ENTERO 9
#define LONG_ENTERO 10
#define DECIMAL 11
#define IMAGINARIO 12
#define CADENA 13
#define IF 14
#define ELIF 15
#define ELSE 16
#define FOR 17
#define RANGE 18
#define LEN 19
#define WHILE 20
#define IDENTIFICADOR 21
#define BREAK 22
#define PASS 23
#define CONTINUE 24
#define IMPORT 25
#define PRINT 26
#define PAR_ABRE 27
#define PAR_CIERRA 28
#define COR_ABRE 29
#define COR_CIERRA 30
#define ASSIGN 31
#define SEMICOLON 32
#define COMA 33
#define COLON 34
#define PUNTO 35
#define BLANK_TAB_SPACE 36
#define ER 999

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
