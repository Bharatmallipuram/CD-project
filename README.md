Comment Remover and Symbol Table Generator
This project is a simple compiler design utility using Lex to remove comments and generate a symbol table for identifiers in C source code files. It is designed to recognize data types, variables, and functions, storing each identified symbol in a symbol table with details about its type and scope.

Table of Contents
Project Description
Features
Prerequisites
Setup
Usage
Sample Input
Expected Output
Project Structure
License
Project Description
This project performs two main tasks:

Comment Removal: Identifies and removes both single-line (//) and multi-line (/_ ... _/) comments from the input code.
Symbol Table Generation: Builds a symbol table that lists identifiers (variables, functions) along with their type and scope (global or local).
Features
Recognizes data types (int, float, char, void) and adds symbols to the table.
Identifies global and local scope based on { and } brackets.
Discards comments and displays a message for each removed comment.
Generates a neatly formatted symbol table with Name, Type, and Scope columns.
Prerequisites
Lex: Install Lex to generate lexical analyzers.
GCC: Install GCC to compile the generated C code.
Setup
Install Lex and GCC if not already installed.

bash
Copy code
sudo apt-get install flex # For Ubuntu/Debian
sudo apt-get install gcc
Download or clone this repository.

Navigate to the project folder:

bash
Copy code
cd path/to/project-folder
Usage
Save your input code in a file, e.g., input.c.

Compile and run the Lex file:

bash
Copy code
lex symbol_table_with_comments.l
gcc lex.yy.c -o symbol_table_with_comments -ll
Run the compiled program, redirecting the input file:

bash
Copy code
./symbol_table_with_comments < input.c
Sample Input
Example content of input.c:

c
Copy code
// This is a single-line comment
int x;
float y;
/_ This is a
multi-line comment _/
void function(int a) {
int z;
}
Expected Output
plaintext
Copy code
Removed single-line comment: // This is a single-line comment
Removed multi-line comment: /_ This is a
multi-line comment _/
Symbol Table:
Name Type Scope

---

x int global
y float global
function void global
a int local
z int local
Project Structure
symbol_table_with_comments.l: The main Lex file that combines comment removal and symbol table generation.
README.md: Project documentation.
License
This project is open-source and available under the MIT License.
