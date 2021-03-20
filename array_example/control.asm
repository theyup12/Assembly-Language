;****************************************************************************************************************************
;Program name: create an array and sum  
;This program is use to make an array and sum by creating the multiple assembly file *
;Programming Language:x86Assembly
; Program Description: This program asks a user to input floating point into array and 
; return the sum of the array.
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
;  Program name: sum of array
;  Programming languages: One modules in C, one module in C++ and three module in X86
;  Date program began: 2021-Mar-10
;  Date of last update: 2021-Mar-20
;  Date of reorganization of comments: 2020-Mar-20
;  Files in this program: display.cpp, fill.asm, main.c, control.asm, sum.asm
;  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
;
;This file
;   File name: control.asm
;   Language: X86 with Intel syntax.
;   Max page width: 145 columns
;   Assemble: nasm -f elf64 -l control.lis -o control.o control.asm
;===== Begin code area =======================================================================================================
extern printf 
extern scanf
extern sum
extern input_array
extern display_array
arr_size equ 100            ;size of the array

global control

segment .data
    intro_text db "Welcome to HSAS. The accuracy and reliability of this program is guaranteed by Andy C.", 10,0
    sum_display db "The sum of these values is %lf", 10, 0
    display_arr db "The numbers you entered are these:", 10, 0 
    end_display db "The control module will now return the sum to the caller module ",10, 0
    stringformat db "%s", 0
segment .bss
    int_array resq 100      ;Uninitialized array 
segment .text

control:
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
    
    push qword -1	;create even number of pushes 
    mov r14, 0      ;Reserve register 
;-------------------------------------------------------------------------------
    
    mov qword rax, 0
    mov qword rdi, intro_text
    call printf                                ;print out the introduction
    
;-------------------------------------------------------------------------------

    mov qword rdi, int_array                   ;pass array into fill.asm 
    mov qword rsi, arr_size                    ;pass size of array into fill.asm
    mov qword rax, 0    
    call input_array                           ;call function input_array
    mov r14,rax                                ;save the size of array from fill.asm
;-------------------------------------------------------------------------------
    mov qword rax, 0    
    mov qword rdi, display_arr                 ;print out the numbers that entered
    mov qword rax,0
    call printf
;-------------------------------------------------------------------------------
    push qword 0
    mov rax, 0
    mov qword rdi, int_array                   ;pass saved array to display.cpp
    mov qword rsi, r14                         ;pass the size of array to display.cpp
    call display_array                         ;call funtion 
    pop rax 
;-------------------------------------------------------------------------------  
    push qword 0
    mov qword rdi, int_array                   ;pass saved array to sum.asm
    mov qword rsi, r14                         ;pass the size of array to sum.asm
    mov qword rax, 0
    call sum                                   ;call function
    movsd xmm13, xmm0                          ;copies the sum as a floating point
    pop rax
;-------------------------------------------------------------------------------
    push qword 0
    mov qword rax, 1
    mov qword rdi, sum_display                 ;print
    movsd xmm0, xmm13                          ;sum of the array 
    call printf
    pop rax 
;-------------------------------------------------------------------------------  
    mov qword rax, 0
    mov qword rdi, end_display                 ;print the sum that return main 
    call printf
;-------------------------------------------------------------------------------
    pop rax
    movsd xmm0, xmm13                          ;back to main.c 
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