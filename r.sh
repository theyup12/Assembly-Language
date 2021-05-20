#!/bin/bash                                                                     
#program; mock interview                                     
#Author: Dongyi Cao                                                             
rm *.o
rm *.out

echo "Assemble harmonic.asm"
nasm -f elf64 -l harmonic.lis -o harmonic.o harmonic.asm

echo "compile main.c using gcc compiler standard 2011"
g++ -c -Wall -m64 -no-pie -o main.o main.cpp -std=c++17

echo "fill.asm"
nasm -f elf64 -l fill.lis -o fill.o fill.asm
echo "cal_harmonic.asm"
nasm -f elf64 -l cal_harmonic.lis -o cal_harmonic.o cal_harmonic.asm
echo "isfloat.cpp"
g++ -c -Wall -m64 -Wall -fno-pie -no-pie -o isfloat.o isfloat.cpp -std=c++17
echo "display.cpp"
g++ -c -Wall -m64 -Wall -no-pie -o display.o display.cpp -std=c++17

echo "link the object files using gcc linker standard 2011"
g++ -m64 -no-pie -o harmonic.out main.o harmonic.o isfloat.o display.o fill.o cal_harmonic.o

echo "Run the program"
./harmonic.out
