# ; name: Victor Mercado
# ; email: vmercado29@csu.fullerton.edu
rm *.o
rm *.out
rm *.lis

echo "Bash: This is program <Timed Array Sort>"

echo "Bash: Assemble the asm files"
nasm -f elf64 -o manager.o manager.asm
nasm -f elf64 -o get_frequency.o get_frequency.asm
# nasm -f elf64 -l cosine.lis -o cosine.o cosine.asm
# nasm -f elf64 -l atof.lis -o atof.o atof.asm
# nasm -f elf64 -l itoa.lis -o itoa.o itoa.asm
# nasm -f elf64 -l ftoa.lis -o ftoa.o ftoa.asm


# ld -o cosineCalc cosineCalc.o ltoa.o atof.o ftoa.o itoa.o cosine.o 
gcc -c -m64 -Wall -o sort.o sort.c -fno-pie -no-pie -std=c11

g++ -c -m64 -o driver.o driver.cpp -fno-pie -no-pie -std=c++17

g++ -m64 -o TimedArraySort driver.o sort.o manager.o get_frequency.o -fno-pie -no-pie -std=c++17

./TimedArraySort


