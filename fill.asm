;Andy Cao - 888500782 - May 20, 2021
;****************************************************************************************************************************
;Program name: harmonic.asm  
;This program is use to make an array and sum by creating the multiple assembly file *
;Programming Language:x86Assembly
; Program Description: This program asks a user to input floating point into array and 
; return the sum of the array.
;********************************************************************************************
; Copyright (C) 2020                                                     *
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
;  Program name: harmonic
;  Programming languages: One modules in C, one module in C++ and three module in X86
;  Date program began: 2021-May-20
;  Date of last update: 2021-May-20
;  Date of reorganization of comments: 2020-May-20
;  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
;
;This file
;   File name: fill.asm
;   Language: X86 with Intel syntax.
;   Max page width: 126 columns
;===== Begin code area =======================================================================================================
extern printf 
extern scanf
extern atof
extern isfloat
global input_array
segment .data
    intro_text db "Please enter floating point number separated by ws", 10
               db "When finished press enter followed by Crtl+D",10, 0
    floatformat db "%lf", 0
    stringformat db "%s", 0
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
    
    push qword 0	;pushes
;-------------------------------------------------------------------------------
    mov qword r14, rdi                  ;address of array save to r14
    mov qword r13, rsi                  ;num of element of array 
    mov qword r12, 0                    ;count 
;-------------------------------------------------------------------------------
        
    mov qword rax, stringformat         ; print out the introduction 
    mov qword rdi, intro_text
    mov qword rax,0
    call printf
;-------------------------------------------------------------------------------   
    begin_loop:
    
    mov qword rdi, stringformat          ;ask user for the input 
    mov qword rsi, rsp
    mov rax, 0
    call scanf

    cdqe                                ;ctrl + D to end the loop 
    cmp rax, -1
    je end_loop
    
    mov qword rax, 0
    mov qword rdi, rsp
    call isfloat
    cmp rax, 0
    je invalid_input

    mov qword rax, 0
    mov qword rdi, rsp 
    call atof

    movsd xmm13, xmm0                   ;insert as a floating point 
    movsd [r14 + 8 * r12], xmm13        ;user input to array
    inc r12                             ;increase by one 

    cmp r12, r13                        ;compare element to capacity 100
    je end_loop

    jmp begin_loop                      ;loop again 
;-------------------------------------------------------------------------------  
    invalid_input:
    jmp begin_loop

    end_loop: 
    
    pop rax
    mov qword rax, r12                  ;copy size of array to control 
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