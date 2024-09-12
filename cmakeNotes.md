* Cmake language vocabulary:

| Feature | Example | Further details |
| --------| ------- | ----------------|
| print a message | Message ("My message")| [https://godbolt.org/z/YfqE14z6h](https://godbolt.org/z/YfqE14z6h)|
| define and assign variable| set(MYVAR "VALUE")| |
| access a variable | ${MYVAR}| |
| access environment variable | $ENV{VAR} | |
| include a directory | add_subdirectory(dir) | it will create a new variable scope |
| include a file| include(/path/to/file.cmake)| it will not create a new variable scope |
| if| if(condition)<br>\# CODE<br>elsif(second_condition)<br>\# CODE<br>else()<br>\# CODE<br>endif()| |
| for | foreach(item a b c)<br>message(${item})<br>endforeach() | |
| while | while(var)<br>set(var FALSE)<br>endwhile()| |
| macro definition| macro(NAMEMACRO arg1 arg2)<br>...<br>endmacro() | The contenent of macro will be copy pasted wherever it is called (like in c preprocessing) and there is no scope for macro as its code is in parent scope (caller)<br>Try to use function instead of macro, only if there is a reason |
| function definition | function(NAMEFUNCTION arg1)<br>...<br>endfunction() | it will create a variable scope |
| define library type and dependency| add_library(${libname} SHARED src1.cpp s2.cpp ...)| |
| define executable dependency| add_executable(exename s1.cpp s2.cpp ...) | |
| define a custom command | add_custom_command()| |
| define linking between executable and library | target_link_libraries(exename ${libname}...)| |
| include cmake module| find_package(NAME)| |
| support testing | enable_testing()| |
| consider a test | add_test(TEST)| |
| install package | install(TARGETS target DESTINATION dir) | |
| cmake directory paths | CMAKE_SOURCE_DIR, CMAKE_CURRENT_SOURCE_DIR, CMAKE_BINARY_DIR, CMAKE_CURRENT_BINARY_DIR| |
| scope | Private: used only for current target<br>Interface: not used for this target and used for dependent targets<br>Public: used for this target and for dependent targets | [https://leimao.github.io/blog/CMake-Public-Private-Interface/](https://leimao.github.io/blog/CMake-Public-Private-Interface/)|
| No default precedence of AND over OR| [https://godbolt.org/z/jcPc1z4aG](https://godbolt.org/z/jcPc1z4aG)| |
| Passing list argument to a function | [https://godbolt.org/z/nrcGnsqnz](https://godbolt.org/z/nrcGnsqnz)| |
| Pass by value/reference to a function | [https://godbolt.org/z/q8YeP3oMv](https://godbolt.org/z/q8YeP3oMv)| |
| Access parent scope of function | [https://godbolt.org/z/fx4n6sTvT](https://godbolt.org/z/fx4n6sTvT)| |
| overriding a function or a macro| [https://godbolt.org/z/q57MM4azv](https://godbolt.org/z/q57MM4azv)| but never override twice it will cause an infinit recursion loop|

* Cmake command options:

| Feature | Example | Further details |
| --------| ------- | ----------------|
| generate build system with enhanced log | mkdir build && cd build && cmake.exe -S .. -B . --trace-source=CMakeLists.txt | generate in current dir from source in parent dir |
| build the specific target called format-code| cmake.exe --build . -t format-code| |
| for debug option| cmake -DCMAKE_BUILD_TYPE=Debug && make && make test | |

* Further notes:  
  * CMakeCache.txt in the build directory contains cmake configuration and cache variables used for generating the build system