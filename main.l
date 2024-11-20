%{
#include <stdio.h>
#include <string.h>
#include <ctype.h>

struct Symbol {
    char name[50];
    char type[10];
    char scope[10];
    int lineNumber;
} symbolTable[100];

int symbolCount = 0;
char currentType[10];
char currentScope[10] = "global";
int insideFunction = 0; // Flag to track if parsing inside a function parameter list
int count = 0;

char removedComments[1000][256];
int commentCount = 0;

void addSymbol(char *name, char *type, char *scope, int lineNumber) {
    for (int i = 0; i < symbolCount; i++) {
        if (strcmp(symbolTable[i].name, name) == 0 && strcmp(symbolTable[i].scope, scope) == 0) {
            return; // Symbol already exists, do not add it again
        }
    }
    strcpy(symbolTable[symbolCount].name, name);
    strcpy(symbolTable[symbolCount].type, type);
    strcpy(symbolTable[symbolCount].scope, scope);
    symbolTable[symbolCount].lineNumber = lineNumber;
    symbolCount++;
}

void printSymbolTable() {
    printf("\nSymbol Table:\n\n");
    printf("Name\tType\tScope\tLine Number\n");
    printf("----------------------------------\n");
    for (int i = 0; i < symbolCount; i++) {
        printf("%s\t%s\t%s\t%d\n",
               symbolTable[i].name,
               symbolTable[i].type,
               symbolTable[i].scope,
               symbolTable[i].lineNumber);
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

"//".*                          { 
    logComment(yytext); 
}

int|float|char|void        { 
    strcpy(currentType, yytext); 
    printf("%s ", yytext); 
}

[a-zA-Z_][a-zA-Z0-9_]*     { 
    if (count == 0) strcpy(currentScope, "global");
    
    if (!insideFunction && strcmp(currentType, "") != 0) {  
        addSymbol(yytext, currentType, currentScope, yylineno);
        currentType[0] = '\0'; 
    }
    printf("%s ", yytext); 
}

"("                        { 
    insideFunction = 1; // Entering a parameter list
    printf("( "); 
}

")"                        { 
    insideFunction = 0; // Exiting a parameter list
    printf(") "); 
}

"{"                        { 
    count++;
    strcpy(currentScope, "local"); 
    printf("{ "); 
}

"}"                        { 
    if (count == 0){
        strcpy(currentScope, "global");
    }
    count--;
    printf("} ");   
}

\n { ++yylineno; 
     printf("%s", yytext);
    }  

[ \t]+                   { printf("%s", yytext); }

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