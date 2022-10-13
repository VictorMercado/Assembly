#include <stdio.h>

extern "C" void display_Array(int arr[], int size);

void display_Array(int arr[], int size) {
    printf("\e[32m");
    for (int i = 0; i < size; i++) {
        printf("%d", arr[i]);
    }
    printf("\n");
    printf("\e[0m");
    // size = 6;
}