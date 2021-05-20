;Andy Cao - 888500782 - May 20, 2021
;****************************************************************************************************************************
;Program name: create an array and sum  
;This program is use to make an array and sum by creating the multiple assembly file *
;Programming Language:x86Assembly
; Program Description: This program asks a user to input floating point into array and 
; return the sum of the array.
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
;  Program name: sum of array
;  Programming languages: One modules in C, one module in C++ and three module in X86
;  Date program began: 2021-May-10
;  Date of last update: 2021-May-20
;  Date of reorganization of comments: 2020-May-20
;  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
;
;This file
;   File name: cal_harmonic.asm
;   Language: X86 with Intel syntax.
;   Max page width: 106 columns
;===== Begin code area =======================================================================================================
extern printf 
extern scanf
global cal_harmonic
segment .data
    
segment .bss

segment .text

cal_harmonic:
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
    mov r14, rdi
    mov r13, rsi
    mov r12, 0
    mov r11, 0
    cvtsi2sd xmm14, r11                     ;convert

;-------------------------------------------------------------------------------
    begin_loop:
    
    cmp r12, r13                            ;compare with the max size of array 
    jge end_loop                            ;if reach then quit loop

    mov r10, 1 
    cvtsi2sd xmm13, r10
    divsd xmm13, [r14 + 8 * r12]            ; 1/ a + 1/b + 1/c
    addsd xmm14, xmm13                      ; add 
    inc r12                                 ;increments counter by 1 

    jmp begin_loop                          ;loop again 
;-------------------------------------------------------------------------------    
    end_loop:   
    cvtsi2sd xmm12, r12
    divsd xmm12, xmm14
    pop rax
    movsd xmm0, xmm12                       ;return the sum 
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