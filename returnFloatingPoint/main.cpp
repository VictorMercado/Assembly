// Program name: "Float Processer".  This program demonstrates input and output float numbers, check for invalid inputs, and
// compare two float numbers.  Copyright(C) 2022 Victor Mercado.
//  Author information
//    Author name: Victor Mercado
//    Author email: vmercado29@csu.fullerton.edu

#include <stdio.h>
#include <iostream>
using namespace std;

// extern keyword is used to declare a variable that is defined in another file.
extern "C" int floating_point_processor();

// this is the driver function for the program
int main()
{

    //double return_code = -1;

    //cout << "Welcome you will be entering 2 Floating Point numbers and its my job to see if you did just that." << endl;
    //assmebly function call to process the floating point numbers
    // return_code = 
    cout << "this is the output"<< endl << floating_point_processor() << endl;
    //cout <<"The driver received return code: " <<  return_code << ".  The driver will now exit.  GoodBye." << endl;
    return 0;
}
