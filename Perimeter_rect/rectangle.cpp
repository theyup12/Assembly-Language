//****************************************************************************************************************************
//Program name: Perimeter & average of rectangle. This program is use to find the perimeter of the rectangle and the average *
//length of side by using assembly.                                                                                          *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
//****************************************************************************************************************************




//========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**

//Author information
//  Author name: Andy Cao
//  Author email: dongyicao123@csu.fullerton.edu
//
//Program information
//  Program name: Perimeter & average of rectangle
//  Programming languages: One modules in C and one module in X86
//  Date program began: 2021-Feb-05
//  Date of last update: 2021-Feb-13
//  Date of reorganization of comments: 2019-Oct-29
//  Files in this program: rectangle.cpp, perimeter.asm
//  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
//
//This file
//   File name: rectangle.cpp
//   Language: c
//   Max page width: 45 columns
//   Compile: g++ -c -Wall -m64 -no-pie -o rectangle.o rectangle.cpp
//   Link: g++ -m64 -no-pie -o perimeter.out rectangle.o perimeter.o


//===== Begin code area =========================================================================================================
#include <stdio.h>
extern "C" double perimeter();
int main(int argc, char* argv[]){
  double total = 0.0;
  printf("Welcome to an friendly assembly by Andy Cao.\n");
  total = perimeter();
  printf("The main function received this number %5.1lf and has decided to keep it.\n", total);
  printf("A 0 will be returned to the operting system.\n");
  printf("Have a nice day.\n");

  return 0;
}
