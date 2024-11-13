%{
#include <stdio.h>
#include "tokens.h"  // Inclui o arquivo de tokens
%}

%%

// Regras de correspondência de padrões
"if"            { printf("Palavra-chave: if\n"); return T_KEYWORD; }
"var"           { printf("Palavra-chave: var\n"); return T_KEYWORD; }
[a-zA-Z_][a-zA-Z0-9_]*  { printf("Identificador: %s\n", yytext); return T_IDENTIFIER; }
[0-9]+          { printf("Número: %s\n", yytext); return T_NUMBER; }
[+\\-\\*/]      { printf("Operador: %s\n", yytext); return T_OPERATOR; }
"="             { printf("Operador de atribuição: %s\n", yytext); return T_ASSIGN; }
"(" | ")"       { printf("Parêntese: %s\n", yytext); return T_PAREN; }
";"             { printf("Ponto e vírgula: %s\n", yytext); return T_SEMICOLON; }
"\"[^\"]*\""{ printf("String: %s\n", yytext); return T_STRING; }

%%

// Função principal para rodar o analisador
int main() {
    yylex(); // Chama o analisador léxico
    return 0;
}

