# ; name: Victor Mercado
# ; email: vmercado29@csu.fullerton.edu
rm *.o
rm *.out

echo "Bash: This is program <Cosine Calc>"

echo "Bash: Assemble the asm files"
# nasm -f elf64 -l cosineCalc.lis -o cosineCalc.o cosineCalc.asm
# nasm -f elf64 -l ltoa.lis -o ltoa.o ltoa.asm
# nasm -f elf64 -l cosine.lis -o cosine.o cosine.asm
# nasm -f elf64 -l atof.lis -o atof.o atof.asm
# nasm -f elf64 -l itoa.lis -o itoa.o itoa.asm
# nasm -f elf64 -l ftoa.lis -o ftoa.o ftoa.asm


# ld -o cosineCalc cosineCalc.o ltoa.o atof.o ftoa.o itoa.o cosine.o 
gcc -c -m64 -Wall -o sort.o sort.c -fno-pie -no-pie -std=c11

g++ -c -m64 -o driver.o driver.cpp -fno-pie -no-pie -std=c++17

g++ -m64 -o TimedArraySort driver.o sort.o -fno-pie -no-pie -std=c++17

./TimedArraySort


