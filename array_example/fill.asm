;****************************************************************************************************************************
;Program name: roots of quadratic equation 
;This program is use to find the root of the quadratic equation *
;Programming Language:x86Assembly
; Program Description: This program asks a user to input three floating point and create  
;quadratic equation and return the roots of this quadratic equation.
;********************************************************************************************
; Copyright (C) 2020 Bilal El-haghassan                                                     *
; This program is free software: you can redistribute it and/or modify it under the terms   *
; of the GNU General Public License version 3 as published by the Free Software Foundation. *
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY  *
; without even the implied Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. *
; See the GNU General Public License for more details. A copy of the GNU General Public     *
; License v3 is available here:  <https://www.gnu.org/licenses/>.  
;                          
;****************************************************************************************************************************

;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;Author information
;  Author name: Andy Cao
;  Author email: dongyicao123@csu.fullerton.edu
;
;Program information
;  Program name: roots of quadratic equation
;  Programming languages: One modules in C and one module in X86
;  Date program began: 2021-Feb-20
;  Date of last update: 2021-Feb-28
;  Date of reorganization of comments: 2020-feb-23
;  Files in this program: second_degree.cpp, quadratic.asm, isfloat.cpp, quad_library.cpp
;  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
;
;This file
;   File name: quadratic.asm
;   Language: X86 with Intel syntax.
;   Max page width: 224 columns
;   Assemble: nasm -f elf64 -l quadratic.lis -o quadratic.o quadratic.asm
;===== Begin code area =======================================================================================================
extern printf 
extern scanf
extern atof
global input_array
segment .data
    intro_text db "Please enter floating point number separated by ws", 10
               db "When finished press enter followed by Crtl+D",10
segment .bss

segment .text

input_array:
;Insurance for any caller of this assembly module
      push rbp
      mov rbp, rsp
      push rdi
      push rsi
      push rdx
      push rcx
      push r8
      push r9
      push r10
      push r11
      push r12
      push r13
      push r14
      push r15
      push rbx
      pushf
;-------------------------------------------------------------------------------
    push qword -1	;create 128 number of pushes
;-------------------------------------------------------------------------------
    mov r14, rdi
    mov r13, rsi
    mov r12, 0
;-------------------------------------------------------------------------------
    begin_loop:
    
    mov rdi, 0
    push qword 0
    mov rsi, rsp
    mov rax, 0
    call scanf

    cdqe
    cmp rax, -1
    je end_loop
    
    ;enter input 
    
    mov rax, 0
    mov rdi, rsp
    call atof 
    movsd xmm15, xmm0
    

    movsd [r14 + 8 * r12], xmm15
    inc r12
    cmp r12, r13
    je end_loop

    jmp begin_loop

    
;-------------------------------------------------------------------------------    
    end_loop: 
    pop rax
    mov rax, r12
;-------------------------------------------------------------------------------
;Restore original values to integer registers
      popf
      pop rbx
      pop r15
      pop r14
      pop r13
      pop r12
      pop r11
      pop r10
      pop r9
      pop r8
      pop rcx
      pop rdx
      pop rsi
      pop rdi
      pop rbp

      ret