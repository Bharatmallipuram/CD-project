# Comment Remover and Symbol Table Generator

This project is a compiler design utility using **Lex** to process C source code files. It performs two key tasks: removing comments and generating a symbol table for the identifiers found in the code. The symbol table includes details about each identifier's type and scope.

## Table of Contents

- [Project Description](#project-description)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Usage](#usage)
- [Sample Input](#sample-input)
- [Expected Output](#expected-output)
- [Project Structure](#project-structure)
- [License](#license)

## Project Description

This project combines two functionalities:

1. **Comment Removal**: 
   - Identifies and removes both single-line (`//`) and multi-line (`/* ... */`) comments from the input source code.
   - Logs each removed comment to provide feedback.

2. **Symbol Table Generation**: 
   - Recognizes identifiers such as variables and function names.
   - Identifies their data type (e.g., `int`, `float`, `char`, `void`) and scope (`global` or `local`).
   - Outputs a neatly formatted symbol table.

The processed code, free of comments, is displayed alongside the generated symbol table and a list of removed comments.

## Features

- Processes single-line and multi-line comments with logging for each removed comment.
- Supports recognition of common C data types (`int`, `float`, `char`, `void`).
- Differentiates between global and local scopes based on `{` and `}` brackets.
- Outputs:
  - **Processed Code**: The code with comments removed.
  - **Removed Comments**: A list of all removed comments.
  - **Symbol Table**: Details of all recognized identifiers.

## Prerequisites

- **Lex**: A tool to generate lexical analyzers.
- **GCC**: For compiling the generated C file.

## Setup

1. **Install Lex and GCC** (if not already installed):
   ```bash
   sudo apt-get install flex       # For Ubuntu/Debian
   sudo apt-get install gcc

2. **Download or clone this repository.**
3. **Navigate to the project folder**
   ```bash
   cd path/to/project-folder
   ```

## Usage

1. **Save your input code in a file, e.g., input.c.**
2. **Compile and run Lex file**

   ```bash
   lex symbol_table_with_comments.l
   gcc lex.yy.c -o symbol_table_with_comments -ll

   ```

3. **Run the compiled program, redirecting the input file:**
   ```bash
   ./symbol_table_with_comments < input.c
   ```

## Sample Input

**Example content of input.c:**
// This is a single-line comment
int x;
float y;
/_ This is a
multi-line comment _/
void function(int a) {
int z;
}

## Expected Output

**Terminal Output**
Processed Code (with comments removed):

int x;
float y;
void function(int a) {
    int z;
}


Removed Comments:
// Single-line comment
/* This is a 
multi-line comment */
// Another single-line comment


Symbol Table:
Name    Type    Scope
-------------------------
x       int     global
y       float   global
function void   global
a       int     local
z       int     local

## Project Structure

project-folder/
├── symbol_table_with_comments.l  # Lex file containing the logic
├── input.c                       # Example input file
├── lex.yy.c                      # Generated file from Lex (after running `lex`)
├── symbol_table_with_comments    # Compiled executable
└── README.md                     # Documentation for the project


## License

**This project is open-source and available under the MIT License.**

### Summary:

- Start from the **`# Comment Remover and Symbol Table Generator`** heading at the top of the file.
- End at the **`## License`** section at the bottom.

Simply copy all of this content into your `README.md` file, and save it. This will provide a comprehensive guide to your project for anyone viewing your repository on GitHub or in your local directory. Let me know if you need any modifications!
