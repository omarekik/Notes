# GDB Cheat Sheet

## Setup & Getting Started

| Command | Description |
|---------|-------------|
| `gcc -g program.c -o program` | Compile with debugging symbols (required for debugging) |
| `gcc -g2 program.c -o program` | Include more debugging info |
| `gcc -g3 program.c -o program` | Include even more debugging info (macro expansion) |
| `gcc -ggdb program.c -o program` | GDB-specific debugging symbols |
| `gdb ./program` | Start GDB with executable |
| `gdb a.exe core.PID` | Debug with core dump file |
| `help` | Show help about GDB commands |

---

## Basic Execution Control

| Command | Description |
|---------|-------------|
| `r` or `run` | Run the program |
| `c` or `continue` | Continue execution after breakpoint |
| `quit` or `q` | Exit GDB |

---

## Breakpoints

| Command | Description |
|---------|-------------|
| `break 10` | Set breakpoint at line 10 |
| `b 10` | Short form of break |
| `break file.cpp:10` | Set breakpoint at line 10 in file.cpp |
| `break function_name` | Set breakpoint at function entry |
| `break file.cpp:function_name` | Set breakpoint in specific file's function |
| `info break` | List all breakpoints |
| `clear 10` | Remove breakpoint at line 10 |
| `clear function_name` | Remove breakpoint in function |
| `condition 1 expr` | Stop at breakpoint 1 only if expression is true |

---

## Stepping & Navigation

| Command | Description |
|---------|-------------|
| `s` or `step` | Step into (execute one line, enter functions) |
| `s 3` | Step 3 lines |
| `n` or `next` | Step over (execute one line, skip functions) |
| `finish` | Run until current function returns |
| `where` | Show where execution crashed |

---

## Stack & Frames

| Command | Description |
|---------|-------------|
| `bt` or `backtrace` | Show stack trace (all caller functions) |
| `f` or `frame` | Show current stack frame (function) |
| `info args` | Show function arguments in current frame |

---

## Variables & Memory

| Command | Description |
|---------|-------------|
| `print variable` or `p variable` | Print variable value |
| `p *pointer` | Print value pointed to by pointer |
| `p variable@10` | Print array of 10 elements starting from variable |
| `p /x variable` | Print variable in hexadecimal |
| `p /d variable` | Print variable in decimal |
| `p /t variable` | Print variable in binary |
| `info locals` | Print all local variables in current frame |
| `set var variable = value` | Set variable to new value |
| `set var namespace::variable = value` | Set scoped variable |
| `p function_name::local_var` | Access variable from different scope |

---

## Source Code

| Command | Description |
|---------|-------------|
| `list` or `l` | List 10 lines of source code |
| `list 20` | List 10 lines around line 20 |
| `list function_name` | List source code of function |
| `info source` | Show info about current source file |

---

## Core Dumps

| Command | Description |
|---------|-------------|
| `ulimit -c unlimited` | Enable core dump generation on crash |
| `gdb program core.PID` | Analyze core dump with GDB |

---

## Tips & Tricks

- **Repeat last command**: Press Enter
- **Abbreviations**: Most commands can be shortened (e.g., `b` for `break`, `c` for `continue`)
- **Tab completion**: Use Tab to autocomplete commands
- **History**: Use arrow keys to navigate command history
- **View changes**: After setting a variable with `set var`, use `p variable` to confirm

---

## Resources

- **Official Documentation**: https://sourceware.org/gdb/documentation/
- **Quick Tip**: Always compile with `-g` flag for debugging!
