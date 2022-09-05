// Program name: "Float Processer".  This program demonstrates input and output float numbers, check for invalid inputs, and
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

    double return_code = -1;
    cout << "\033[1;31m Welcome to Floating Points Numbers programmed by Victor Mercado. \033[0m\n";
    cout << "C++: You will be entering 2 Floating Point numbers and its my job to see if you did just that." << endl;
    
    //assmebly function call to process the floating point numbers
    return_code = floating_point_processor();
    cout <<"C++: The driver received this float number: " <<  return_code << ".  The driver will now exit.  GoodBye." << endl;
    cout << "C++: The driver module will return integer 0 to the operating system." << endl;
    return 0;
}
