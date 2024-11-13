%{
#include <stdio.h>
#include "tokens.h" // Arquivo que define os tokens para uso no analisador
%}

%%

[a-zA-Z_][a-zA-Z0-9_]*       { return IDENT; }   // Identificadores
"int"                        { return INT; }      // Palavra-chave "int"
"+"                          { return PLUS; }     // Operador de adição
"="                          { return ASSIGN; }   // Operador de atribuição
[0-9]+                       { return NUMBER; }   // Números inteiros

\n                           { /* Ignorar novas linhas */ }
[ \t]+                       { /* Ignorar espaços e tabulações */ }
.                            { /* Qualquer caractere não identificado é ignorado */ }

%%

int yywrap() { return 1; }
