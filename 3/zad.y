%{
	#include <stdio.h>
	int yylex();
	int yyerror(char* c);
	
	
%}

%union {
	char *str;
}

%token FOR
%token TO
%token WHILE
%token DO
%token END
%token BOOL
%token ELSE
%token PRZYPISZ
%token VAR
%token DWUKROPEK
%token BEG
%token INTEGER
%token REAL
%token STRING
%token BOOLEAN
%token INT_NUMBER
%token ZMIENNA
%token IF
%token THEN
%token ZNAK
%token ZMIENNE
%token PLUSMINUS
%token TAB
%token CASE
%token NAWIASOO 
%token NAWIASOZ 
%token OF
%token SREDNIK
%token WRITE
%token PRZECINEK
%token CUDZY
%token READ
%token TODOWN
%token ROZNE
%token ROWNE




%type <str> PRZYPISZ
%type <str> INT_NUMBER
%type <str> ZMIENNA
%type <str> ZMIENNE
%type <str> INTEGER
%type <str> ZNAK
%type <str> PLUSMINUS
%type <str> BOOL

%%

komenda2 : | body komenda2;

body : deklaracjaZmiennej
			 |if
			 | fordown
			 | forto
             | instrukcja
			 | ELSE { printf("else {\n"); } body { printf("}\n"); }
			 | while
			 | case
			 | beg komenda2 end;


instrukcja: przypisanie
		|writeln
		|readln
        | wywolaniefunkcji ;

wywolaniefunkcji: ZMIENNA NAWIASOO nazwyZmiennej NAWIASOZ SREDNIK { printf("%s(%s);\n", $1,yylval); } ;

deklaracjaZmiennej : VAR nazwyZmiennej DWUKROPEK typ  { printf("%s;\n", yylval); } ;

nazwyZmiennej: ZMIENNE
		| ZMIENNA;



typ : INTEGER { printf("int "); } 
	| REAL { printf("double "); }
	| STRING { printf("string "); } 
	| BOOLEAN { printf("bool "); };

forto: FOR ZMIENNA PRZYPISZ INT_NUMBER TO INT_NUMBER { printf("for  (%s = %s; %s <= %s; %s=%s+1)", $2,$4, $2, $6,$2,$2); } DO ;

fordown: FOR ZMIENNA PRZYPISZ INT_NUMBER TODOWN INT_NUMBER { printf("for  (%s = %s; %s >= %s; %s=%s-1)", $2,$4, $2, $6,$2,$2); } DO ;

przypisanie: ZMIENNA { printf("%s", yylval); } PRZYPISZ { printf(" = "); } prawaStronaPrzypisania SREDNIK { printf(";\n"); } ;

prawaStronaPrzypisania: warunek PLUSMINUS { printf("%s", yylval); } prawaStronaPrzypisania
  						| warunek;



if: IF { printf("if ("); } ifWileWarunek  THEN { printf(")"); }  ;

while: WHILE { printf("while ("); } ifWileWarunek  DO { printf(")"); } ;


case: CASE NAWIASOO ZMIENNA NAWIASOZ OF { printf("switch ( %s ) { \n", $3); } wybory end;

wybory: ZMIENNA { printf("case %s ", yylval); }  DWUKROPEK { printf(": \n"); }  instrukcja { printf("\tbreak;\n");} wybory
		|INT_NUMBER { printf("case %s ", yylval); }  DWUKROPEK { printf(": \n"); }  instrukcja { printf("\tbreak;\n");} wybory
		| ELSE { printf("default : \n"); } instrukcja { printf("\tbreak;\n");}
		| ;

warunek:  ZMIENNA  { printf("%s", yylval); } 
			| INT_NUMBER  { printf("%s", yylval); }	;


ifWileWarunek : ZMIENNA { printf("%s", $1); } rownyLubNie BOOL { printf("%s", yylval); }
		| ZMIENNA ZNAK { printf("%s %s ", $1, $2); } ZMIENNA { printf("%s", yylval); }
		| ZMIENNA ZNAK { printf("%s %s ", $1, $2); } INT_NUMBER { printf("%s", yylval); };



rownyLubNie: ROWNE { printf("=="); } | ROZNE { printf("!="); } ;
           
writeln: WRITE { printf("cout << "); } NAWIASOO wypisz NAWIASOZ  SREDNIK { printf("endl;\n"); }; 

wypisz: ZMIENNA { printf("%s << ", yylval); } wypisz
		| PRZECINEK wypisz
		| string wypisz
		| ;

string: CUDZY { printf("\""); } ciagSlow CUDZY { printf("\" << "); };

ciagSlow: | ZMIENNA { printf("%s ", yylval); }  ciagSlow;

readln:  READ { printf("cin >> "); } NAWIASOO podstaw NAWIASOZ SREDNIK { printf(";\n"); };

podstaw: ZMIENNA { printf("%s ", yylval); } podstaw
		| PRZECINEK { printf(">>"); } wypisz
		| ;



beg: BEG { printf("{\n");};
end: END SREDNIK { printf("}\n");};
%%

#include <stdio.h>

int yyerror(char* c) {
	printf("%s\n", c);
	return 1;
}

int main() {
	yyparse();
}

int yywrap() {
	return 1;
} 

