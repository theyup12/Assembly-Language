//****************************************************************************************************************************
//Program name: roots of quadratic equation
//This program is use to find the root of the quadratic equation *
//Programming Language:x86Assembly
// Program Description: This program asks a user to input three floating point and create
//quadratic equation and return the roots of this quadratic equation.
//********************************************************************************************
// Copyright (C) 2020 Bilal El-haghassan                                                     *
// This program is free software: you can redistribute it and/or modify it under the terms   *
 //of the GNU General Public License version 3 as published by the Free Software Foundation. *
 //This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY  *
 //without even the implied Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. *
 //See the GNU General Public License for more details. A copy of the GNU General Public     *
 //License v3 is available here:  <https://www.gnu.org/licenses/>.

//****************************************************************************************************************************
//========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**

//Author information
//  Author name: Andy Cao
//  Author email: dongyicao123@csu.fullerton.edu

//Program information
//  Program name: roots of quadratic equation
//  Programming languages: One modules in C and one module in X86
//  Date program began: 2021-Feb-20
//  Date of last update: 2021-Feb-28
//  Date of reorganization of comments: 2020-feb-23
//  Files in this program: second_degree.cpp, quadratic.asm, isfloat.cpp, quad_library.cpp
//  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.

//This file
//   File name: quad_library.cpp
//   Language: C
//   Max page width: 55 columns


//===== Begin code area =========================================================================================================
#include <stdio.h>

extern "C" void show_no_root();
extern "C" void show_one_root(double root);
extern "C" void show_two_root(double root1, double root2);

void show_no_root(){
    printf("There are no roots\n");
}
void show_one_root(double root){
    printf("The root is %lf\n", root);
}
void show_two_root(double root1, double root2){
    printf("The roots are %lf and %lf\n", root1, root2);
}
