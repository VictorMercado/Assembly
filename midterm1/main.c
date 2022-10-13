// ;Program name: "ReverseArrayIO".

// Author name: Victor Mercado
// Author email: vmercado29@csu.fullerton.edu
//     October 13, 2022
//     Section ID : Section 7  | Section TuTh 8 - 10am

#include <stdio.h>

extern void manager();
// Color codes
// Yellow: driver
// Gold: manager
// Green: display_array
// White: input_array

int main()
{
    printf("\e[1;33mWelcome to the Great Reverse by Victor Mercado. \n\e[33m");
    manager();
    printf("\e[1;33mThe driver function received an array whose first 3 numbers are: \n\e[0m");
    // for (int i = 0; i < 3; i++)
    // {
    //     printf("\e[1;33m%lf \n\e[0m", arrayPtr[i]);
    // }
    printf("\e[1;31mThis program is done and will now return 0 to the OS. \n\e[0m");
    return 0;
}