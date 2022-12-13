#include <stdlib.h>
#include <stdio.h>
#include <stddef.h>

// extern void display(double* myarray[], size_t start, size_t how_many);

void display(double* myarray[], size_t start, size_t how_many)
{
    printf("start: %li \n", start);
    printf("end: %li \n", how_many);
    printf("this is how many: %lf\n", myarray[how_many]);
    for (size_t i = start; i < start + how_many; ++i) 
    {
        printf("%lf\n", myarray[i]);
    }
}