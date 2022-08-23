// Program name: "Float Processer".  This program demonstrates input and output float numbers, check for invalid inputs, and
// compare two float numbers.  Copyright(C) 2022 Victor Mercado.
//  Author information
//    Author name: Victor Mercado
//    Author email: vmercado29@csu.fullerton.edu

#include <stdio.h>
#include <iostream>

    using namespace std;

extern "C" double floating_point_processer();

int main()
{

    double return_code = -1;

    cout << "Welcome you will be entering 2 Floating Point numbers and its my job to see if you did just that." << endl;
    return_code = floating_point_processer();
    cout <<"The driver received return code: " <<  return_code << ".  The driver will now exit.  GoodBye." << endl;
    return 0;
}