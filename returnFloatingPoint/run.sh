#!/bin/bash


#Author: Floyd Holliday
#Program name: Basic Float Operations

rm *.o
rm *.out

echo "This is program <Demonstrate Numeric IO>"

echo "Assemble the module floatin_point_processor.asm"
nasm -f elf64 -l floating_point_processor.lis -o floating_point_processor.o floating_point_processor.asm

echo "Compile the C++ module main.cpp"
g++ -c -m64 -Wall -o main.o main.cpp -fno-pie -no-pie -std=c++17

echo "Link the two object files already created"
g++ -m64 -o floating_point_processor main.o floating_point_processor.o -fno-pie -no-pie -std=c++17

echo "Run the program Basic Float Operations"
./floating_point_processor.out

echo "The bash script file is now closing."