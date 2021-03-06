#!/bin/bash                                                                     
#program; mock interview                                     
#Author: Dongyi Cao                                                             
rm *.o
rn *.out

echo "Assemble interview.asm"
nasm -f elf64 -g -gdwarf -l interview.lis -o interview.o interview.asm

echo "compile main.c using gcc compiler standard 2011"
gcc -c -Wall -m64 -no-pie -o main.o main.c -g

echo "link the object files using gcc linker standard 2011"
gcc -m64 -no-pie -o interview.out -std=c11 main.o interview.o -g

echo "Run the program"
./interview.out
