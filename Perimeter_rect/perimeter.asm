;****************************************************************************************************************************
;Program name: Perimeter & average of rectangle. This program is use to find the perimeter of the rectangle and the average *
;length of side by using assembly.                                                                                          *
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
;****************************************************************************************************************************




;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;Author information
;  Author name: Andy Cao
;  Author email: dongyicao123@csu.fullerton.edu
;
;Program information
;  Program name: Perimeter & average of rectangle
;  Programming languages: One modules in C and one module in X86
;  Date program began: 2021-Feb-05
;  Date of last update: 2021-Feb-13
;  Date of reorganization of comments: 2019-Oct-29
;  Files in this program: rectangle.cpp, perimeter.asm
;  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
;
;This file
;   File name: perimeter.asm
;   Language: X86 with Intel syntax.
;   Max page width: 181 columns
;   Assemble: nasm -f elf64 -l perimeter.lis -o perimeter.o perimeter.asm


;===== Begin code area =========================================================================================================
extern printf
extern scanf
global perimeter
segment .data

        s_text db "This program will compute the perimeter and the average side length of a rectangle", 10, 0
        p_height db "Enter the height:",0
        height_number db "%lf", 0
        p_width db "Enter the width:", 0
        width_number db "%lf", 0
        p_result db "The perimeter is %5.1lf", 10, 0
        p_average db "The length of the average side is %5.3lf", 10, 0
        end_text1 db "I hope you enjoyed your rectangle.", 10, 0
        end_text2 db "The assembly program will send the perimeter to the main function.",10, 0
        num dq 2.0
        a_num dq 4.0
segment .bss

segment .text

perimeter:
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
          ;print s_text
          push qword 0
          mov rax, 0
          mov rdi, s_text
          call printf


	  ;Enter height
          push qword 0
          mov rax, 0
          mov rdi, p_height
          call printf
          pop rax

          ;input height
          push qword 0
          mov rax, 1
          mov rdi, height_number
          mov rsi, rsp
          call scanf
          movsd xmm14, [rsp]
          pop rax

          ;Enter width
          push qword 0
          mov rax, 0
          mov rdi, p_width
          call printf
          pop rax

          ;input width
          push qword 0
          mov rax, 1
          mov rdi, width_number
          mov rsi, rsp
          call scanf
          movsd xmm13, [rsp]
          pop rax

          ;calculate the perimeter of the rectangle
          push qword 0
          addsd xmm13, xmm14
          movsd xmm0, xmm13
          mulsd xmm0, [num]
          movsd xmm13, xmm0
          pop rax

          ;display perimeter
          push qword 0
          mov rax, 1
          mov rdi, p_result
          movsd xmm0, xmm13
          call printf
          pop rax

          ;calculate the average side
          push qword 0
          movsd xmm12, xmm13
          movsd xmm1, xmm12
          divsd xmm1, [a_num]
          movsd xmm12, xmm1
          pop rax

          ;display average side
          push qword 0
          mov rax, 1
          mov rdi, p_average
          movsd xmm0, xmm12
          call printf
          pop rax

          ;print end_text
          push qword 0
          mov rax, 0
          mov rdi, end_text1
          call printf
          pop rax

          ;print end_text
          mov rax, 0
          mov rdi, end_text2
          call printf

          pop rax

          movsd xmm0, xmm13  ;return perimeter to caller
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
