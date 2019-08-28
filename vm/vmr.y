%{
#define YYSTYPE
#include <stdio.h>
#include <math.h>
%}
%token NL
%token NUMBER
%token LPAR
%token RPAR
%token OWARI
%left ADDOP SUBOP
%left MULOP DIVOP
%left NEG
%%
s       : list
        ;
list    : /* empty */
        | list expr NL { printf ("The result is: %lf\n", $2);}
        | list OWARI { return;}
        ;
expr    : expr ADDOP expr {$$ = $1 + $3;}
        | expr SUBOP expr {$$ = $1 - $3;}
        | expr MULOP expr {$$ = $1 * $3;}
        | expr DIVOP expr {$$ = $1 / $3;}
        | SUBOP expr %prec NEG {$$ = -$2;}
        | LPAR expr RPAR  {$$ = $2;}
        | NUMBER {$$ = $1;}
        ;
%%
yyerror(s) char  *s; { printf ("%s\n",s);}
main()
{
  yyparse();
  }