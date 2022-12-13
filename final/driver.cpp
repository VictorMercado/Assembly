#include <stdio.h>
// #include <stdlib.h>
// #include <time.h>
// #include <sys/time.h>


extern "C" double manager();

int main()
{
    double totalResistance = 0.0;
    printf("Welcome to Electric Circuits programmed by Victor Mercado \n");
    totalResistance = manager();

    printf("The Resistance module received this number: %lf and will keep it. \n", totalResistance);
    // printf("The total resistance of the circuit is: %f \n", totalResistance);
}