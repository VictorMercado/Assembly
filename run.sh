#!/bin/bash

#Author: Floyd Holliday
#Program name: Xbackup

rm *.o, *.lis, *.out
echo " " #Blank line

echo "This program Xbackup is compiled without PIC (Position Independent Code)."
echo "The C++ compiler command and the linker command both include switches to turn off PIC."
echo "This program was tested successfully in an Ubuntu derivative distro version 19.10 in April 2020."

echo "Assemble the X86 file xsavexrstor.asm"
nasm -f elf64 -l xsavexrstor.lis -o xsavexrstor.o xsavexrstor.asm

echo "Compile the C++ file xsavexrstordriver.cpp"
g++ -c -m64 -Wall -l xsavexrstordriver.lis -o xsavexrstordriver.o xsavexrstordriver.cpp -fno-pie -no-pie -std=c++14


echo "Link the 'O' files xsavexrstor.o and xsavexrstordriver.o"
g++ -m64 -std=c++14 -fno-pie -no-pie -o xbackup.out xsavexrstor.o xsavexrstordriver.o

echo "Run the program Xbackup."
./xbackup.out

echo "This Bash script file will now terminate.  Bye."


