// Program name: "Floating Point Processer".  This program demonstrates input and output float numbers, check for invalid inputs, and
// compare two float numbers.  Copyright(C) 2022 Victor Mercado.
//  Author information
//    Author name: Victor Mercado
//    Author email: vmercado29@csu.fullerton.edu

#include <stdio.h>
#include <iostream>
#include <stdlib.h>
using namespace std;

// extern keyword is used to declare a variable that is defined in another file.
extern "C" double floating_point_processor();

// this is the driver function for the program
int main()
{
    const string START_MOD = "\033[1;31m";
    const string END_MOD = "\033[0m\n";
    double return_code = -1;
    cout << START_MOD << "Welcome to Floating Points Numbers programmed by Victor Mercado." << END_MOD;
    cout << START_MOD << "You will be entering 2 Floating Point numbers and its my job to see if you did just that." << END_MOD;

    //assmebly function call to process the floating point numbers
    return_code = floating_point_processor();
    cout << START_MOD << "The driver received this float number: " << return_code << ".  The driver will now exit.  GoodBye." << END_MOD;
    cout << START_MOD << "The driver module will return integer 0 to the operating system." << END_MOD;
    return 0;
}
