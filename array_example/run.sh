#!/bin/bash
#program; array
#Author: Dongyi Cao
rm *.o
rm *.out
rm *.lis
echo "Assemble control.asm"
nasm -f elf64 -l control.lis -o control.o control.asm

echo "compile main.c using gcc compiler standard 2011"
gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c11

echo "display.cpp"
g++ -c -Wall -m64 -Wall -no-pie -o display.o display.cpp -std=c++17

echo "fill.asm"
nasm -f elf64 -l fill.lis -o fill.o fill.asm
echo "sum.asm"
nasm -f elf64 -l sum.lis -o sum.o sum.asm
echo "link the object files using gcc linker standard 2011"
gcc -m64 -no-pie -o assign3.out -std=c++17 main.o control.o fill.o display.o sum.o

echo "Run the program"
./assign3.out