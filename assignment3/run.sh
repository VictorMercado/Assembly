rm *.o
rm *.out

echo "Bash: This is program <Demonstrate Numeric IO>"

echo "Bash: Assemble the asm files"
nasm -f elf64 -l manager.lis -o manager.o manager.asm
nasm -f elf64 -l sum.lis -o sum.o sum.asm
# nasm -f elf64 -l input_array.lis -o input_array.o input_array.asm

echo "Bash: Compile the C driver main.c"
gcc -c -m64 -Wall -o main.o main.c -fno-pie -no-pie -std=c11

echo "Bash: Compile the C++ module display_Array.cpp"
g++ -c -m64 -Wall -o display_Array.o display_Array.cpp -fno-pie -no-pie -std=c++17

echo "Bash: Link the object files already created"
g++ -m64 -o arrayIO main.o manager.o display_Array.o sum.o -fno-pie -no-pie -std=c++17      #  input_array.o 

echo "Bash: Run the program ArrayIO"
./arrayIO

echo "Bash: The bash script file is now closing."
