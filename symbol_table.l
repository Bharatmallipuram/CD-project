%{
#include <stdio.h>
#include <string.h>
#include <ctype.h>

// Structure to hold the symbol table
struct Symbol {
    char name[50];
    char type[10];
    char scope[10];
} symbolTable[100];

int symbolCount = 0;          // Counter for symbols
char currentType[10];         // To store the type of current identifier
char currentScope[10] = "global"; // Default scope is global

// Function to add symbol to the symbol table
void addSymbol(char *name, char *type, char *scope) {
    // Check if the symbol already exists in the symbol table
    for (int i = 0; i < symbolCount; i++) {
        if (strcmp(symbolTable[i].name, name) == 0 && strcmp(symbolTable[i].scope, scope) == 0) {
            return; // Symbol already exists, do not add it again
        }
    }
    
    // Add the new symbol to the table
    strcpy(symbolTable[symbolCount].name, name);
    strcpy(symbolTable[symbolCount].type, type);
    strcpy(symbolTable[symbolCount].scope, scope);
    symbolCount++;
}

// Function to print the symbol table
void printSymbolTable() {
    printf("Symbol Table:\n");
    printf("Name\tType\tScope\n");
    printf("-------------------------\n");
    for (int i = 0; i < symbolCount; i++) {
        printf("%s\t%s\t%s\n", symbolTable[i].name, symbolTable[i].type, symbolTable[i].scope);
    }
}
%}

%%

int|float|char|void        {
                                strcpy(currentType, yytext);   // Set the current type (e.g., int, float)
                            }


[a-zA-Z_][a-zA-Z0-9_]*     {
                                if (strcmp(currentType, "") != 0) {  // If a valid data type was found
                                    addSymbol(yytext, currentType, currentScope);  // Add identifier to the symbol table
                                }
                            }


"{"  { strcpy(currentScope, "local"); }    /* Enter local scope */
"}"  { strcpy(currentScope, "global"); }   /* Exit to global scope */


[ \t\n]+                   ;


.                          ;

%%

/* Main function to run the lexical analyzer */
int main() {
    yylex();  // This runs the Lex analyzer

    // Print the symbol table
    printSymbolTable();
    
    return 0;
}
