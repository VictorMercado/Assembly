// #include "display_Array.hpp"
#include <stdio.h>

extern "C" void display_Array(int arr);

void display_Array(int arr) {
    // for (int i = 0; i < size; i++) {
        printf("%d ", arr);
    // }
    printf("\n");
}