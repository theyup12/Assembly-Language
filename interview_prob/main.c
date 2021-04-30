//****************************************************************************************************************************
//Program name: create an interview example 
//This program is to create a mock interview and find the resistance of circuit  *
//Programming Language:x86Assembly
//********************************************************************************************
// Copyright (C) 2020 Bilal El-haghassan                                                     *
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
//
//Program information
//  Program name: sum of array
//  Programming languages: One modules in C, one module in C++ and three module in X86
//  Date program began: 2021-Apr-25
//  Date of last update: 2021-Apr-30
//  Date of reorganization of comments: 2020-Mar-20
//  Files in this program: display.cpp, fill.asm, main.c, control.asm, sum.asm
//  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
//
//This file
//   File name: interview.asm
//   Language: X86 with Intel syntax.
//   Max page width: 145 columns
//   Assemble: nasm -f elf64 -l interview.lis -o interview.o interview.asm
//===== Begin code area =======================================================================================================



#include <stdio.h>
#include <stdint.h>
#include <string.h>
double interview(char name_[], double salary_);
int main(){
    double salary;
    char name[50];
    double new_salary = -999;
    printf("Weclome to Software Analysis by Paramount Programmers, Inc.\n");
    printf("Please enter your first and last name and press enter: ");
    fgets(name,sizeof(name), stdin);
    name[strcspn(name, "\n")] = 0;
    printf("\nThank you, %s. Our records show that you applied for employment here\n", name);
    printf("With our agency a week ago.\n");
    printf("Please enter your expected annual salary when employed at Paramount: ");
    scanf("%lf", &salary);
    printf("\nYour interview with Ms Linda Fenster, Personnel Manager, will begin shortly.\n");
     new_salary= interview(name, salary);
    if(new_salary < 50000){
        printf("\nHello, %s I am the receptinist\n", name);
        printf("We have an opening for you in the company cafeteria for $%.2lf annually.\n", new_salary);
        printf("Take your time to let us know your decision.\nBye.\n");

    }else if(new_salary < 200000){
        printf("\nHello, %s I am the receptinist\n", name);
        printf("This envelope has your job offer with starting slaray $%.2lf.\n", new_salary);
        printf("Please check back on Monday morning at 8 am.\nBye.\n");

    }else{
        printf("\nHello, Mr Sawyer. I am the receptinist\n");
        printf("This envelope has your job offer with starting slaray $%.2lf.\n", new_salary);
        printf("the middle time out CTO wishes to have dinner with you.\n");
        printf("Have very nice evening Mr Sawyer.\n");
    }
    return 0;
}