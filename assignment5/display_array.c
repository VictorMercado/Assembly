#include <stdlib.h>
#include <stdio.h>

extern void display(double myarray[], unsigned long start, unsigned long how_many);

void display(double myarray[], unsigned long start, unsigned long how_many)
{
    unsigned long i;
    for (i = start; i < start + how_many; i++) 
    {
        printf("%f \n", myarray[i]);
    }
}