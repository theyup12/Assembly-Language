
//Andy Cao - 888500782 - May 20, 2021

//****************************************************************************************************************************
//Program name: create an interview example 
//This program is to create a mock interview and find the resistance of circuit  *
//Programming Language:x86Assembly
//********************************************************************************************
// Copyright (C) 2020                                                  *
// This program is free software: you can redistribute it and/or modify it under the terms   *
// of the GNU General Public License version 3 as published by the Free Software Foundation. *
// This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY  *
// without even the implied Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. *
// See the GNU General Public License for more details. A copy of the GNU General Public     *
// License v3 is available here:  <https://www.gnu.org/licenses/>.  
//                          
//****************************************************************************************************************************

//========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//Author information
//  Author name: Andy Cao
//  Author email: dongyicao123@csu.fullerton.edu
//  cswid: 888500782
//  
//Program information
//  Program name: harmonic
//  Programming languages: One modules in C, one module in C++ and three module in X86
//  Date program began: 2021-May-20
//  Date of last update: 2021-May-20
//  Date of reorganization of comments: 2020-May-20
//  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
//
//This file
//   File name: main.cpp
//   Language: X86 with Intel syntax.
//   Max page width: 145 columns
//===== Begin code area =======================================================================================================



#include <stdio.h>

extern "C" double harmonic();
int main(int argc, char* argv[]){
  double total = 0.0;
  printf("This is 240-05 programming final by Andy Cao.\n");
  total = harmonic();
  printf("The main function received this number %lf and plans keep it.\n", total);
  printf("A 0 will now be returned to the operating system.\n");
  printf("Have a great next semester. Bye.\n");
  return 0;
}