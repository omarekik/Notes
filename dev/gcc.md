# GCC Cheat Sheet

## Main Compilation Command

| Command | Description |
|---------|-------------|
| `gcc main.c -o main` | Compile C file to executable |
| `g++ -std=c++17 lab.cpp -o lab` | Compile C++ file with standard specification |
| `g++ -g -std=c++17 lab.cpp -o lab && ./lab` | Compile with debug symbols and run |
| `gcc -c file.c -o file.o` | Compile to object file only (no linking) |

---

## Compilation Options

| Command | Description |
|---------|-------------|
| `-o output_name` | Specify output executable name (e.g., `-o main.exe`) |
| `-Wall` | Show all warnings during compilation |
| `-Wextra` | Show extra warnings |
| `-Werror` | Treat warnings as errors |
| `-v` | Verbose output (show compilation steps) |
| `-g` | Generate debug symbols for GDB debugging |
| `-g2` | Include more debugging information |
| `-g3` | Include extensive debugging info (macro expansion) |
| `-ggdb` | GDB-specific debugging symbols |

---

## Preprocessor & Code Generation

| Command | Description |
|---------|-------------|
| `gcc -E main.c > myFile.txt` | Generate preprocessed code (after #include, #define) |
| `gcc -S main.c > myFile.txt` | Generate assembly code |
| `gcc -save-temps main.c` | Generate preprocessed and assembly code (.i, .s files) |
| `gcc -dM -E main.c` | Show all defined macros |

---

## Optimization Flags

| Command | Description |
|---------|-------------|
| `-O0` | No optimization (default) |
| `-O1` | Basic optimization |
| `-O2` | Moderate optimization (recommended) |
| `-O3` | Aggressive optimization (may increase compile time) |
| `-Os` | Optimize for size |
| `-Ofast` | Very aggressive optimization (may violate standards) |
| `gcc -Q --help=optimizers` | Show optimization flags and their current state |

---

## Static Libraries

| Command | Description |
|---------|-------------|
| `gcc -c tst.c -o tst.o` | Compile source to object file |
| `gcc -c tstUtil.c -o tstUtil.o` | Compile another source to object file |
| `ar rs libtst.a tst.o tstUtil.o` | Create static library (ar = archive command, rs = flags) |
| `gcc main.c -o main.o` | Compile main program to object file |
| `gcc main.o -o exe -L . -ltst` | Link object file with static library |
| `./exe` | Run the executable |

**Notes:**
- `-L .` specifies library search path (`.` = current directory)
- `-l tst` links library (omit "lib" prefix and ".a" extension)
- Static libraries are linked into the executable (larger file size)

---

## Shared Libraries (Dynamic Linking)

| Command | Description |
|---------|-------------|
| `gcc -c -fPIC tst.c -o tst.o` | Compile with Position Independent Code |
| `gcc -c -fPIC tstUtil.c -o tstUtil.o` | Compile another source with PIC |
| `gcc tst.o tstUtil.o -shared -o libtst.so` | Create shared library (.so file) |
| `gcc main.c -o main.o` | Compile main program to object file |
| `gcc main.o -o exe -ltst` | Link with shared library |
| `./exe` | Run the executable |

**Setup Shared Libraries:**
- Place `libtst.so` in `/usr/lib` (or `/usr/local/lib`)
- Run `sudo ldconfig` to update shared library database
- Library must be in system path at runtime

**Notes:**
- `-fPIC` = Position Independent Code (required for shared libraries)
- `-shared` flag creates a shared object (.so)
- `-l tst` links library (omit "lib" prefix and ".so" extension)
- Smaller executable size, shared across processes

---

## Standard & Language Options

| Command | Description |
|---------|-------------|
| `-std=c89` | Compile as C89 (C90) standard |
| `-std=c99` | Compile as C99 standard |
| `-std=c11` | Compile as C11 standard |
| `-std=c17` | Compile as C17 standard |
| `-std=c++98` | Compile as C++98 standard |
| `-std=c++11` | Compile as C++11 standard |
| `-std=c++14` | Compile as C++14 standard |
| `-std=c++17` | Compile as C++17 standard |
| `-std=c++20` | Compile as C++20 standard |

---

## Linking & Dependencies

| Command | Description |
|---------|-------------|
| `-L /path/to/lib` | Specify library search path |
| `-l library_name` | Link with a library (without "lib" prefix or extension) |
| `-I /path/to/include` | Specify header file search path |
| `-Wl,--rpath,/path` | Set runtime library search path |
| `-static` | Link all libraries statically |
| `-shared` | Create a shared library |

---

## Debugging & Profiling

| Command | Description |
|---------|-------------|
| `-g` | Generate debug symbols |
| `-pg` | Enable profiling with gprof |
| `-fstack-protector` | Add stack overflow protection |
| `-fsanitize=address` | Enable AddressSanitizer (memory errors) |
| `-fsanitize=undefined` | Enable UndefinedBehaviorSanitizer |

---

## Tips & Tricks

- **Quick compile and run**: `gcc main.c -o main && ./main`
- **Multi-file compilation**: `gcc file1.c file2.c file3.c -o program`
- **Set include path**: `gcc main.c -I./headers -o main`
- **Verbose compilation**: `gcc -v main.c` (shows all steps)
- **Check compiler version**: `gcc --version`
- **Combine flags**: `gcc -Wall -Wextra -g -O2 main.c -o main`

---

## Resources

- **GCC Manual**: https://gcc.gnu.org/onlinedocs/
- **GCC Options**: https://gcc.gnu.org/onlinedocs/gcc/Option-Summary.html
- **Quick Tip**: Always use `-Wall` and `-g` during development!
