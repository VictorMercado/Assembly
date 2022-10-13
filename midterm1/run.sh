# // ;Program name: "SumArrayIO".

# // Author name: Victor Mercado
# // Author email: vmercado29@csu.fullerton.edu
# //     October 13, 2022
# //     Section ID : Section 7  | Section TuTh 8 - 10am

rm *.o
rm *.out

echo "Bash: This is program <Demonstrate Numeric IO>"

echo "Bash: Assemble the asm files"
nasm -f elf64 -l manager.lis -o manager.o manager.asm
# nasm -f elf64 -l reverse.lis -o reverse.o reverse.asm
nasm -f elf64 -l input_array.lis -o input_array.o input_array.asm

echo "Bash: Compile the C driver main.c"
gcc -c -m64 -Wall -o main.o main.c -fno-pie -no-pie -std=c11

echo "Bash: Compile the C++ module display_Array.cpp"
g++ -c -m64 -Wall -o display_Array.o display_Array.cpp -fno-pie -no-pie -std=c++17

echo "Bash: Link the object files already created"
g++ -m64 -o arrayIO main.o manager.o  -fno-pie -no-pie -std=c++17      #  input_array.o display_Array.o sum.o

echo "Bash: Run the program ArrayIO"
./arrayIO

echo "Bash: The bash script file is now closing."