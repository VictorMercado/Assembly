// Program name : "Triangle Processor".This program demonstrates inputting lengths of a triangle and;
// returning the area and hypothenuse.;
// Copyright(C) 2022 Victor Mercado.;
// Author information;
// Author name : Victor Mercado;
// Author email : vmercado29 @csu.fullerton.edu;
// Date Completed : 9 / 16 / 2022; This is the main executable file for the program.  It is written in Assembly language for the Intel 8086 microprocessor.
// This file is the driver for the program.  It calls the assembly language function to do the work.

#include <cmath>
#include <iostream>
#include <string>

using namespace std;

extern "C" double triangle_processor();


int main()
{
    double return_code = -1;
    // startmod and endmod are used to change the color of the text in the terminal to red
    const string START_MOD = "\033[1;31m";
    const string END_MOD = "\033[0m\n";
    cout << START_MOD << "Welcome to Triangle Processor programmed by Victor Mercado." << END_MOD;
    return_code = triangle_processor();
    cout << START_MOD << "This is the code received: " << return_code << END_MOD << endl;
}
