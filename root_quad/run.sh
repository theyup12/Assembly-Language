#!/bin/bash
#program; perimeter & average of rectangle
#Author: Dongyi Cao
rm *.o
rm *.out
echo "Assemble perimeter.asm"
nasm -f elf64 -l quadratic.lis -o quadratic.o quadratic.asm

echo "compile rectangle.c using gcc compiler standard 2011"
g++ -c -Wall -m64 -no-pie -o second_degree.o second_degree.cpp -std=c++17

echo "isfloat.cpp"
g++ -c -Wall -m64 -Wall -fno-pie -no-pie -o isfloat.o isfloat.cpp -std=c++17

echo "quad_library.cpp"
g++ -c -Wall -m64 -Wall -fno-pie -no-pie -o quad_library.o quad_library.cpp -std=c++17
echo "link the object files using gcc linker standard 2011"
g++ -m64 -no-pie -o quadratic.out second_degree.o quadratic.o isfloat.o quad_library.o

echo "Run the program"
./quadratic.out
