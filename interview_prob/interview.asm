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

global interview

segment .data
    intro_text db "Hello %s. I am Ms Fenster. The interview will begin now", 10,0
    salary_display db "Wow! $%lf That's a lot of cash. Who do you think you are, Chris Sawyer(y or n)?", 0
    input db "%s", 0 
    first_resistance db 10,"Please enter the resistance of circuit #1 in ohms:", 0
    second_resistance db 10, "What is the resistance of circuit #2 in ohms:", 0
    result db 10, "The total resistance is %lf Ohms.", 10, 0
    float_format db "%lf", 0
    end_display db 10,"Thank you. Please follow the exit signs to the front desk",10, 0
    major db "Were you a computer science major (y or n)?", 0

segment .bss

segment .text

interview:
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
    
    push qword 0	                    ;create even number of pushes 
    mov r15, rdi                        ;push name into this file
    movsd xmm15, xmm0                   ;push salary into this file
;-------------------------------------------------------------------------------
    push qword 0
    mov rax, 0
    mov rdi, intro_text
    mov rsi, r15
    call printf                                
    pop rax                             ;print the introduction with name given
;-------------------------------------------------------------------------------
    push qword 0
    mov rax, 1
    mov rdi, salary_display
    movsd xmm0, xmm15
    call printf                         ;print the salary and ask for yes or no
    pop rax 
;-------------------------------------------------------------------------------
    push qword 0
    mov rdi, input
    mov rsi, rsp 
    call scanf 
    pop rax                             ;take the given choice 
;-------------------------------------------------------------------------------
    mov r14, 'y'                        ;character 'y' 
    cmp rax, r14                        ;compare with the input

    mov rax, 0x412E848000000000         ;if yes, new salary is 1 million
    movq xmm15, rax                     ;store it into xmm15
    je exit                             ;jump to the end 
;-------------------------------------------------------------------------------  
    push qword 0
    mov rax, 0
    mov rdi, first_resistance
    call printf
    pop rax                             ;ask the user for resistance of circuit #1

    push qword 0
    mov rax, 0 
    mov rdi, float_format               ;floating point
    mov rsi, rsp
    call scanf
    movsd xmm14, [rsp]                  ;store it into xmm14 
    pop rax
;-------------------------------------------------------------------------------
    push qword 0
    mov rax, 0
    mov rdi, second_resistance          ;ask the user for the resistance of circuit #2
    call printf
    pop rax         

    push qword 0
    mov rax, 0 
    mov rdi, float_format               ;second floating point
    mov rsi, rsp
    call scanf
    movsd xmm13, [rsp]                  ;store it into xmm13
    pop rax

;---------------------------Calculation----------------------------------------- 
    mov r13, 1
    cvtsi2sd xmm12, r13                 ;convert to precision floating point

    divsd xmm12, xmm14                  ;divide 1 / circuit #1
    cvtsi2sd xmm11, r13                 ;convert again and store into xmm11
    divsd xmm11, xmm13                  ;divide 1 / circuit #2
    addsd xmm12, xmm11                  ; add xmm12 and xmm11
    cvtsi2sd xmm10, r13                 ;convert again and store into xmm10
    divsd xmm10, xmm12                  ;divide with 1 / (1/circuit #1) + (1/circuit #2)
    
;------------------------------------------------------------------------------- 
    push qword 0
    mov rax, 1
    mov rdi, result
    movsd xmm0, xmm10
    call printf                         ;print out the result of calcuation
    pop rax 
;------------------------------------------------------------------------------- 
    push qword 0
    mov rax, 1
    mov rdi, major
    call printf                                ;ask user for cs major 
    pop rax 

    push qword 0    
    mov rdi, input                             ;store input 
    mov rsi, rsp 
    call scanf 
    pop rax  

    mov r14, 'y'                               ;determine whether cs major or not
    cmp rax, r14
    mov rax, 0x40F57C0E147AE148                ;if yes return $88000.80
    movq xmm15, rax                            ;store into xmm15
    je exit                                    ;jump to the end 

    mov rax, 0x4092C07AE147AE14                ;else return $1200.12
    movq xmm15, rax
;------------------------------------------------------------------------------- 
    exit:
    push qword 0
    mov rax, 0
    mov rdi, end_display                 ;print the sum that return main 
    call printf
    pop rax 
;-------------------------------------------------------------------------------
    pop rax
    movsd xmm0, xmm15                        ;back to main.c 
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