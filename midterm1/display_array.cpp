// ;Program name: "SumArrayIO".

// Author name: Victor Mercado
// Author email: vmercado29@csu.fullerton.edu
//     October 13, 2022
//     Section ID : Section 7  | Section TuTh 8 - 10am

#include <stdio.h>

extern "C" void display_Array(int arr[], int size);

void display_Array(int arr[], int size)
{
    printf("\e[32m");
    for (int i = 0; i < size; i++)
    {
        printf("%d", arr[i]);
    }
    printf("\n");
    printf("\e[0m");
    printf("\e[1;33m");
}