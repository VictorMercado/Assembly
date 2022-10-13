#include <stdio.h>

extern void manager();

int main() 
{
    // double number = 0;
    printf("\e[1;31mWelcome to ArrayIO \n \e[1;33m ");
    manager();
    printf("\e[0mThis program is done and will now return 0 to the OS. \e[0m");
    return 0;
}