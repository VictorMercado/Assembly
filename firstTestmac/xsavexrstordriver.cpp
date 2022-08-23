//****************************************************************************************************************************
//Program name: "Xsave Example".  This program demonstrates the use of assembly instructions xsave and xrstor to back up and *
//restore values in the state compnents of an X86 processor.  Copyright (C) 2020  Floyd Holliday                             *
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
//version 3 as published by the Free Software Foundation.                                                                    *
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
//****************************************************************************************************************************
//
//
//
//
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//Author information
// Author name: Floyd Holliday
//  Author email: holliday@fullerton.edu
//
//Program information
//  Program name: Xsave Example
//  Programming languages: One modules in C++, one module in X86-64, and one module in Bash.
//  Date program began: 2020-Apr-12
//  Date of last update: 2020-Feb-15
//  Files in this program: sxavexrstordriver.cpp, xsavexrstor.asm, run.sh
//  Status: This program is in development
//  Purpose: The purpsoe of this program to demonstrate the use of assembly instructions xstor and xrstor
//
//This file
//  Name: xsavexrstordriver.cpp
//  Language: C++
//  Compile: g++ -c -m64 -Wall -o xsavexrstordriver.o xsavexrstordriver.cpp -fno-pie -no-pie -std=c++14
//  Purpose: This is the main function.  The purpose is to call xsavexrstormain.
//  Max page width: 132 columns
//
//
//
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//===== Begin code area ============================================================================================================

#include <stdio.h>
#include <stdint.h>
#include <ctime>
#include <cstring>

extern "C" long int xsavexrstormain();

int main(){
  long int return_code = -13;
  printf("%s","Welcome to a demonstration of the X86 instructions xsave and xrstor.\n");
  return_code = xsavexrstormain();
  printf("%s%1ld%s\n","The return code is. ",return_code,".  The driver will now return 0 to the operating system.  Bye.");
  return 0;
}//End of main

