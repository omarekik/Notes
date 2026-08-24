# GCC Cheat Sheet

## Main Compilation Command

| Command | Description |
|---------|-------------|
| `gcc main.c -o main` | Compile C file to executable |
| `g++ -std=c++20 lab.cpp -o lab` | Compile C++ file with standard specification |
| `g++ -g -std=c++20 lab.cpp -o lab && ./lab` | Compile with debug symbols and run |
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

## Compilation Stages

```text
source.cpp
    │
    ├── Preprocess ── -E ──> preprocessed code
    │
    ├── Compile ───── -S ──> assembly (.s)
    │
    ├── Assemble ──── -c ──> object file (.o)
    │
    └── Link ───────────────> executable
```

|Command|Purpose|
|-|-|
|`g++ -E main.cpp -o main.ii`|Preprocessed code|
|`g++ -S main.cpp -o main.s`|Assembly|
|`g++ -c main.cpp -o main.o`|Object file|
|`g++ main.o -o main`|Link object file|
|`g++ -save-temps main.cpp`|Keep intermediate files|
|`g++ -v`|Verbose compiler information|

---

## Optimization Flags

| Command | Description |
|---------|-------------|
| `-O0` | No optimization (default) |
| `-O2` | Moderate optimization (recommended) |
| `-O3` | Aggressive optimization (may increase compile time) |
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
| `-fsanitize=thread` | Enable ThreadSanitizer |

---

## Valgrind

| Command | Description |
|---------|-------------|
| `valgrind --tool=memcheck --leak-check=yes --log-file=file1.log ./exe` | Execute with Memcheck and log results to file |
| `vi file1.log` | View memory check report |
| `g++ -g simple_race.cpp -lpthread -std=c++20 && valgrind --tool=helgrind ./a.out` | Detect data races with Helgrind |
| `g++ -g simple_race.cpp -fsanitize=thread -lpthread -std=c++20 && ./a.out` | Detect data races with ThreadSanitizer |

**Valgrind Tools:**
- **Memcheck** - Memory error detector (detects memory leaks, use-after-free, invalid access, etc.)
- **Helgrind** - Thread race condition debugger
- **DRD** - Another thread race condition detector
- **Cachegrind** - Cache and branch-prediction profiler
- **Callgrind** - Call-graph generating cache and branch-prediction profiler
- **Massif** - Heap profiler

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
- **Quick Tip**: Always use `-Wall` and `-g` during development!
