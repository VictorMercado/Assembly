// ;Program name: "TimedArraySort".

// Author name: Victor Mercado
// Author email: vmercado29@csu.fullerton.edu


#include <stdio.h>
#include <iostream>
#include "sort.h"

extern "C" void timedArraySort();
// Color codes
// Yellow: driver
// Gold: manager
// Green: display_array
// White: input_array

int main()
{
    printf("\e[1;33mWelcome to Timed Array Sort by Victor Mercado. \n\e[33m");
    printf("\e[1;33mThis program will generate non-deterministic floating numbers and save them in an array.\n\e[33m");
    timedArraySort();
    // printf("\e[1;33mThe driver function received an array whose first 3 numbers are: \n\e[0m");
    printf("\e[1;31mThis program is done and will now return 0 to the OS. \n\e[0m");
    return 0;
}