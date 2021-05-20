//Andy Cao - 888500782 - May 20, 2021
//****************************************************************************************************************************
//Program name: harmonic
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
//  Date program began: 2021-May-20
//  Date of last update: 2021-May-28
//  Date of reorganization of comments: 2020-May-20
//  Files in this program: second_degree.cpp, quadratic.asm, isfloat.cpp, quad_library.cpp
//  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.

//This file
//   File name: isfloat.cpp
//   Language: C
//   Max page width: 58 columns


//===== Begin code area =========================================================================================================
#include <iostream>

extern "C" bool isfloat(char []);

bool isfloat(char w[])
{   bool result = true;
    bool onepoint = false;
    int start = 0;
    if (w[0] == '-' || w[0] == '+') start = 1;
    unsigned long int k = start;
    while (!(w[k] == '\0') && result )
    {    if (w[k] == '.' && !onepoint)
               onepoint = true;
         else
               result = result && isdigit(w[k]) ;
         k++;
     }
     return result && onepoint;
}
