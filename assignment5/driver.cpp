// ;Program name: "TimedArraySort".

// Author name: Victor Mercado
// Author email: vmercado29@csu.fullerton.edu


#include <stdio.h>
#include <iostream>
#include "sort.h"

extern "C" void manager();
// Color codes
// Yellow: driver
// Gold: manager
// Green: display_array
// White: input_array

int main()
{
    double *array = NULL;
    const int size = 10;
    double arr[size] = {4,5,2,6,10,9,8,4,6};
    double* point = arr;
    printf("\e[1;33mWelcome to Timed Array Sort by Victor Mercado. \n\e[33m");
    printf("\e[1;33mThis program will generate non-deterministic floating numbers and save them in an array.\n\e[33m");
    manager();
    fsort(point, size);
    printf("\e[1;33mThe driver function received an array whose first 3 numbers are: \n\e[0m");
    for (int i = 0; i < size; i++)
    {
        printf("\e[1;33m%lf \n\e[0m", arr[i]);
    }
    printf("\e[1;31mThis program is done and will now return 0 to the OS. \n\e[0m");
    return 0;
}