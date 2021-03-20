//****************************************************************************************************************************
//Program name: sum of array . 
//This program is use to make an array and sum by creating the multiple assembly file *                                                                                          *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
//****************************************************************************************************************************


//========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**

//Author information
//  Author name: Andy Cao
//  Author email: dongyicao123@csu.fullerton.edu
//
//Program information
//  Program name: sum of array
//  Programming languages: One modules in C, one modules in c++ and three module in X86
//  Date program began: 2021-Mar-10
//  Date of last update: 2021-Mar-20
//  Date of reorganization of comments: 2019-Oct-29
//  Files in this program: main.c, fill.asm, control.asm, sum.asm, display.cpp
//  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
//
//This file
//   File name: main.c
//   Language: c
//   Max page width: 45 columns
//   Compile: gcc -c -Wall -m64 -no-pie -o main.o main.c
//   Link: gcc -m64 -no-pie -o main.out -std=c++17 main.o control.o fill.o display.o sum.o


//===== Begin code area =========================================================================================================
#include <stdio.h>
#include <stdint.h>
double control();
int main(int argc, char* argv[]){
  double total = -999;
  printf("Welcome to High Speed Array Summation by Andy Cao.\n");
  printf("Software Licensed by GNU GPL 3.0\n");
  printf("Version 1.0 released on January 28, 2021\n");
  total = control();
  printf("The main has received this number %5.1lf and will keep it.\n", total);
  printf("Thank you for using High Speed Array Software.\n");
  printf("For system support contract Andy Cao at dongyicao123@csu.fullerton.edu\n");
  printf("A zero will be returned to the operating system.\n");
  return 0;
}