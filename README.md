# Comment Remover and Symbol Table Generator

This project is a simple compiler design utility using **Lex** to remove comments and generate a symbol table for identifiers in C source code files. It is designed to recognize data types, variables, and functions, storing each identified symbol in a symbol table with details about its type and scope.

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

This project performs two main tasks:

1. **Comment Removal**: Identifies and removes both single-line (`//`) and multi-line (`/* ... */`) comments from the input code.
2. **Symbol Table Generation**: Builds a symbol table that lists identifiers (variables, functions) along with their type and scope (global or local).

## Features

- Recognizes data types (`int`, `float`, `char`, `void`) and adds symbols to the table.
- Identifies global and local scope based on `{` and `}` brackets.
- Discards comments and displays a message for each removed comment.
- Generates a neatly formatted symbol table with `Name`, `Type`, and `Scope` columns.

## Prerequisites

- **Lex**: Install Lex to generate lexical analyzers.
- **GCC**: Install GCC to compile the generated C code.

## Setup

1. **Install Lex and GCC** if not already installed.

   ```bash
   sudo apt-get install flex       # For Ubuntu/Debian
   sudo apt-get install gcc
   ```

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

## License

**This project is open-source and available under the MIT License.**

### Summary:

- Start from the **`# Comment Remover and Symbol Table Generator`** heading at the top of the file.
- End at the **`## License`** section at the bottom.

Simply copy all of this content into your `README.md` file, and save it. This will provide a comprehensive guide to your project for anyone viewing your repository on GitHub or in your local directory. Let me know if you need any modifications!
