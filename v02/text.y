%{
  #include <stdio.h>
  int yylex(void);
  int yyparse(void);
  int yyerror(char *);
  extern int yylineno;
%}

%token  _DOT
%token  _CAPITAL_WORD
%token  _WORD
%token  _COMA
%token  _UPITNIK
%token  _UZVICNIK

%%

text 
  : sentence
  | text sentence
  ;
          
sentence 
  : words _DOT
  ;

words 
  : _CAPITAL_WORD
  | words _WORD
  | words _CAPITAL_WORD    
  | words _COMA
  | words _UPITNIK
  | words _UZVICNIK
  ;

%%

int main() {
  yyparse();
}

int yyerror(char *s) {
  fprintf(stderr, "line %d: SYNTAX ERROR %s\n", yylineno, s);
} 

