#!/bin/bash


#Author: Floyd Holliday
#Program name: Basic Float Operations

rm *.o
rm *.out

echo "This is program <Demonstrate Numeric IO>"

echo "Assemble the module fp-io.asm"
nasm -f elf64 -l floating_point_processor.lis -o floating_point_processor.o isfloat.o floating_point_processor.asm isfloat.asm

echo "Compile the C++ module fp-io-driver.cpp"
g++ -c -m64 -Wall -o main.o main.cpp -fno-pie -no-pie -std=c++17

echo "Link the two object files already created"
g++ -m64 -o floating_point_processor.out main.o floating_point_processor.o isfloat.o -fno-pie -no-pie -std=c++17

echo "Run the program Basic Float Operations"
./floating_point_processor.out

echo "The bash script file is now closing."