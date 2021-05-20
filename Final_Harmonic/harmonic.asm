;Andy Cao - 888500782 - May 20, 2021
;****************************************************************************************************************************
;Program name: create an harmonic example 
;Programming Language:x86Assembly
;********************************************************************************************
; Copyright (C) 2020                                                    *
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
;  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
;
;This file
;   File name: harmonic.asm
;   Language: X86 with Intel syntax.
;   Max page width: 145 columns
;===== Begin code area =======================================================================================================
extern printf 
extern scanf
extern display_array
extern input_array
extern cal_harmonic
arr_size equ 100

global harmonic

segment .data
    ; intro_text db "Enter float number separated by white space. Invalid inputs will be omitted", 10
    ;            db "Enter control+D to terminate", 10, 0
    input db "%s", 0 
    float_format db "%lf", 0
    result db "The harmonic mean of these number is %lf", 10, 0
    display_arr db "Thank you. You entered:",10,0
    end_display db "The harmonic mean will be returned to the driver.",10, 0
segment .bss
        int_array resq 100
segment .text

harmonic:
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
    
    push qword -1                         ;create even number of pushes
    mov r14, 0	                     
;-------------------------------------------------------------------------------
    mov qword rdi, int_array               ;ask user for input
    mov qword rsi, arr_size
    mov qword rax, 0
    call input_array
    mov r14, rax
;-------------------------------------------------------------------------------
    mov qword rax, 0
    mov qword rdi, display_arr             ;display user's input
    mov qword rax, 0
    call printf

    push qword 0
    mov rax, 0
    mov qword rdi, int_array
    mov qword rsi, r14
    call display_array
    pop rax 
;------------------------------------------------------------------------------- 
    
    push qword 0
    mov qword rdi , int_array               ;calculate the harmonic
    mov qword rsi , r14
    mov qword rax, 0
    call cal_harmonic 
    movsd xmm13, xmm0
    pop rax 

; ;------------------------------------------------------------------------------- 
    
    push qword 0
    mov qword rax, 1
    mov qword rdi, result                   ;print result
    movsd xmm0, xmm13
    call printf
    pop rax 

    mov qword rax, 0
    mov qword rdi, end_display
    call printf
;-------------------------------------------------------------------------------
    pop rax
    movsd xmm0, xmm13                        ;back to main.c 
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