#!/bin/bash
#program; perimeter & average of rectangle
#Author: Dongyi Cao
rm *.o
rn *.out

echo "Assemble perimeter.asm"
nasm -f elf64 -l perimeter.lis -o perimeter.o perimeter.asm

echo "compile rectangle.c using gcc compiler standard 2011"
g++ -c -Wall -m64 -no-pie -o rectangle.o rectangle.cpp

echo "link the object files using gcc linker standard 2011"
g++ -m64 -no-pie -o perimeter.out rectangle.o perimeter.o

echo "Run the program"
./perimeter.out
