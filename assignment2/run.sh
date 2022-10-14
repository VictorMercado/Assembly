#!/bin/bash

#Author: Victor Mercado
#Program name: Floating Point Processer
# To execute: ./run.sh (this will run all the statements below)

rm *.o
rm *.out

echo "Bash: This is program <Demonstrate Numeric IO>"

echo "Bash: Assemble the module floatin_point_processor.asm"
nasm -f elf64 -l triangle_processor.lis -o triangle_processor.o triangle_processor.asm

# echo "Bash: Compile the C++ module islfoat.cpp"
# g++ -c -m64 -Wall -o isfloat.o isfloat.cpp -fno-pie -no-pie -std=c++17

echo "Bash: Compile the C++ module pythagoras.cpp"
g++ -c -m64 -Wall -o pythagoras.o pythagoras.cpp -fno-pie -no-pie -std=c++17

echo "Bash: Link the two object files already created"
g++ -m64 -o triangle_processor pythagoras.o triangle_processor.o -fno-pie -no-pie -std=c++17

echo "Bash: Run the program Basic Float Operations"
./triangle_processor

echo "Bash: The bash script file is now closing."


