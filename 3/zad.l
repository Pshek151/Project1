%{
	#include "zad.tab.h"

%}



%%


for                  return FOR;
to" "down            return TODOWN;
to                   return TO;
do                   return DO;
begin 			     return BEG;
while                return WHILE;
end                  return END;
else                 return ELSE;
if                   return IF;
case                 return CASE;
(\()                 return NAWIASOO; 
(\))                 return NAWIASOZ;
of                   return OF;
readln               return READ;
writeln              return WRITE;
then                 return THEN;
(>=?)|(<=?)          yylval.str=strdup(yytext);  return ZNAK;
(=)                  return ROWNE;
(<>)                 return ROZNE;
(\+)|(-)             yylval.str=strdup(yytext); return PLUSMINUS;
:=                   return PRZYPISZ;
:                    return DWUKROPEK;
;                    return SREDNIK;
,                    return PRZECINEK;
string               return STRING;
(true)|(false)       yylval.str=strdup(yytext); return BOOL;
[\t]			     printf("\t"); 
Boolean              return BOOLEAN;
real                 return REAL;
integer              return INTEGER;
'                    return CUDZY;
var                  return VAR;
([a-z]+," ")+[a-z]+  yylval.str=strdup(yytext); return ZMIENNE;
[a-z]+               yylval.str=strdup(yytext); return ZMIENNA;
[0-9]+               yylval.str=strdup(yytext); return INT_NUMBER;
[ \n]			     ;  
