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
extern isfloat
extern show_no_root
extern show_one_root
extern show_two_root
global quadratic
segment .data

        intro_text db "This program will find the roots of any quadratic equation.",10
                   db "Please enter the three floating point coefficients of a quadratic equation in the order a,b,c separated by the end of line character.",0

        point db "%s%s%s", 0
        display db "Thank you. The equation is %5.4lfx^2 + %5.4lfx + %5.4lf = 0.0", 10, 0
         end_text db "The total resistance will be returned to caller module", 10, 0
        invalid_text db "Invalid input data detected. You may run this program again", 10, 0
segment .bss
segment .text

quadratic:
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
          sub rsp, 1024	;create 128 number of pushes
          
;-------------------------------print introduction------------------------------
          mov rax, 0
          mov rdi, intro_text
          call printf

;-------------------------------ask user input-----------------------------------
	  
          mov rax, 0
          mov rdi, point
          mov rsi, rsp			;ask user first time
          mov rdx, rsp
          add rdx, 8			;ask user second time 
          mov rcx, rsp 
          add rcx, 16			;ask user third time 
          call scanf
	
;-------------------------------check float validation------------------------------------
	  mov rdi, rsp
	  call isfloat
	  cmp rax, 0
	  je invalid_input
	  
	  mov rdi, rsp 
	  add rdi, 8
	  call isfloat
	  cmp rax, 0
	  je invalid_input
	  
	  
	  mov rdi, rsp 
	  add rdi, 16
	  call isfloat
	  cmp rax, 0
	  je invalid_input
;-------------------------------ASCII to Float-----------------------------------	  
	  mov rax, 1
	  mov rdi, rsp
	  call atof
	  movsd xmm14, xmm0		 ;set first input into 
	  
	  mov rax, 1
	  mov rdi, rsp
	  add rdi, 8
	  call atof
	  movsd xmm13, xmm0
	  
	  mov rax, 1
	  mov rdi, rsp
	  add rdi, 16
	  call atof
	  movsd xmm12, xmm0
;-------------------------------skip invalid input--------------------------------

	  jmp valid_input
;-------------------------------invalid input-----------------------------------
	  invalid_input:
	  mov rax, 1
	  mov rdi, invalid_text
	  call printf
	  
	  jmp end_function	 	  ;if is invalid input then skip to the end 

;------------------------------calculation--------------------------------------
	  valid_input:

	  movsd xmm0, xmm14 	 	  ;a
	  movsd xmm1, xmm13 	 	  ;b
	  movsd xmm2, xmm12 	 	  ;c
	  mov rdi, display	
	  mov rax, 3
	  call printf
;------------------------------calculation---------------------------------------
	  
	  ;b^2 - 4ac
	  movsd xmm8, xmm13		;copy b into new xmm8
	  mulsd xmm8, xmm8		;b^2
	  mov r10, 4			;copy 4 into r14
	  cvtsi2sd xmm9, r10		;convert integer to float 
	  mulsd xmm9, xmm14		;4 * a 
	  mulsd xmm9, xmm12		;4 * a * c
	  subsd xmm8, xmm9		;b^2 - 4ac
	  mov r8, 0			;copy 0 into r8
	  cvtsi2sd xmm9, r8		;convert
	  ucomisd xmm8, xmm9		;compare two floating number
	  jb no_root			; if less than
	  ja two_root			; if greater than
	  je one_root			; if equal to 
	  
	  two_root:
	  mov r11, -1			;copy -1 into r11
	  cvtsi2sd xmm10, r11		;convert 
	  mulsd xmm10, xmm13		;-1 * b
	  sqrtsd xmm11, xmm8		;xmm11 = sqrt(b^2 -4ac)
	  sqrtsd xmm7, xmm8		;xmm7 = sqrt(b^2 -4ac)
	  addsd xmm11, xmm10		;-b + sqrt(b^2 - 4ac)
	  subsd xmm10, xmm7		;-b - sqrt(b^2 -4ac)
	  mov r9, 2			; copy 2 into r9
	  cvtsi2sd xmm7, r9		; convert
	  mulsd xmm7, xmm14  	 	;2 * a
	  divsd xmm11, xmm7		; -b + sqrt(b^2 - 4ac) / 2a
	  divsd xmm10, xmm7		;-b - sqrt(b^2 -4ac) / 2a
	  movsd xmm0, xmm11		;parameter to root1 in quad_library
	  movsd xmm1, xmm10		;parameter to root2 in quad_library
	  call show_two_root		; call
	  movsd xmm15, xmm11		; main function in second_degree
	  jmp end_function		; end
	  
	  one_root: 
	   ;-b/2a
	  mov r11, -1			;copy -1 into r11
	  cvtsi2sd xmm10, r11		;convert
	  mulsd xmm10, xmm13		;-1 * b
	  mov r9, 2 			;copy 2 into r9
	  cvtsi2sd xmm7, r9		; convert
	  mulsd xmm7, xmm14		;2 * a
	  divsd xmm10, xmm7		;-b / 2a
	  movsd xmm0, xmm10		;parameter to root 
	  call show_one_root		;call	
	  movsd xmm15, xmm10		;return caller 
	  jmp end_function		;end
	  
	  no_root:
	  mov rax, 0
	  call show_no_root		;output no root
	  
	  end_function:
	  add rsp, 1024		;remove extra push 
          movsd xmm0, xmm15  		;return perimeter to caller
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
