#include <iostream>
#include <stdio.h>

using namespace std;

extern "C" double atof(string str, int length);

int main()
{
    cout << "Hello World!" << endl;
    string str = "123.456";
    double d = atof(str, str.length());
    cout << d << endl;
    return 0;
}