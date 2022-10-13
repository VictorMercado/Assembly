// #include "display_Array.hpp"
#include <stdio.h>

extern "C" void display_Array(int arr[], int size);

void display_Array(int arr[], int size) {
    for (int i = 0; i < size; i++) {
        printf("%d", arr[i]);
    }
    printf("\n");
}