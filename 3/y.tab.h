/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

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
    FOR = 258,
    TO = 259,
    WHILE = 260,
    DO = 261,
    END = 262,
    BOOL = 263,
    ELSE = 264,
    PRZYPISZ = 265,
    VAR = 266,
    DWUKROPEK = 267,
    BEG = 268,
    INTEGER = 269,
    REAL = 270,
    STRING = 271,
    BOOLEAN = 272,
    INT_NUMBER = 273,
    ZMIENNA = 274,
    IF = 275,
    THEN = 276,
    ZNAK = 277,
    ZMIENNE = 278,
    PLUSMINUS = 279,
    TAB = 280,
    CASE = 281,
    NAWIASOO = 282,
    NAWIASOZ = 283,
    OF = 284,
    SREDNIK = 285,
    WRITE = 286,
    PRZECINEK = 287,
    CUDZY = 288,
    READ = 289,
    TODOWN = 290,
    ROZNE = 291,
    ROWNE = 292
  };
#endif
/* Tokens.  */
#define FOR 258
#define TO 259
#define WHILE 260
#define DO 261
#define END 262
#define BOOL 263
#define ELSE 264
#define PRZYPISZ 265
#define VAR 266
#define DWUKROPEK 267
#define BEG 268
#define INTEGER 269
#define REAL 270
#define STRING 271
#define BOOLEAN 272
#define INT_NUMBER 273
#define ZMIENNA 274
#define IF 275
#define THEN 276
#define ZNAK 277
#define ZMIENNE 278
#define PLUSMINUS 279
#define TAB 280
#define CASE 281
#define NAWIASOO 282
#define NAWIASOZ 283
#define OF 284
#define SREDNIK 285
#define WRITE 286
#define PRZECINEK 287
#define CUDZY 288
#define READ 289
#define TODOWN 290
#define ROZNE 291
#define ROWNE 292

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 9 "zad.y" /* yacc.c:1909  */

	char *str;

#line 132 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
