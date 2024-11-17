%{
#include <stdio.h>
#include <string.h>
#include <ctype.h>

struct Symbol {
    char name[50];
    char type[10];
    char scope[10];
} symbolTable[100];

int symbolCount = 0;          // Counter for symbols
char currentType[10];         // To store the type of current identifier
char currentScope[10] = "global"; // Default scope is global

char removedComments[1000][256]; // Buffer for removed comments
int commentCount = 0;            // Counter for removed comments

void addSymbol(char *name, char *type, char *scope) {
    for (int i = 0; i < symbolCount; i++) {
        if (strcmp(symbolTable[i].name, name) == 0 && strcmp(symbolTable[i].scope, scope) == 0) {
            return; // Symbol already exists, do not add it again
        }
    }
    strcpy(symbolTable[symbolCount].name, name);
    strcpy(symbolTable[symbolCount].type, type);
    strcpy(symbolTable[symbolCount].scope, scope);
    symbolCount++;
}

void printSymbolTable() {
    printf("\nSymbol Table:\n\n");
    printf("Name\tType\tScope\n");
    printf("-------------------------\n");
    for (int i = 0; i < symbolCount; i++) {
        printf("%s\t%s\t%s\n", symbolTable[i].name, symbolTable[i].type, symbolTable[i].scope);
    }
}

void logComment(const char *comment) {
    if (commentCount < 1000) {
        strncpy(removedComments[commentCount++], comment, 255);
    }
}
%}

%%

"/*"([^*]|[\r\n]|"*"[^/])*"*/"     { 
                                        logComment(yytext); 
                                    }

"//".*                              { 
                                        logComment(yytext); 
                                    }

int|float|char|void        { 
                                strcpy(currentType, yytext); 
                                printf("%s ", yytext); 
                            }

[a-zA-Z_][a-zA-Z0-9_]*     { 
                                if (strcmp(currentType, "") != 0) {  
                                    addSymbol(yytext, currentType, currentScope);
                                    currentType[0] = '\0'; 
                                }
                                printf("%s ", yytext); 
                            }

"{"                        { 
                                strcpy(currentScope, "local"); 
                                printf("{ "); 
                            }
"}"                        { 
                                strcpy(currentScope, "global"); 
                                printf("} "); 
                            }

[ \t\n]+                   { printf("%s", yytext); }

.                          { printf("%s", yytext); }

%%

int main() {
    printf("\nProcessed Code (with comments removed):\n");
    yylex();  // Run the Lex analyzer

    // Print removed comments
    printf("\n\nRemoved Comments:\n");
    for (int i = 0; i < commentCount; i++) {
        printf("%s\n", removedComments[i]);
    }

    // Print the symbol table
    printSymbolTable();
    
    return 0;
}
