# ; name: Victor Mercado
# ; email: vmercado29@csu.fullerton.edu
rm *.o
rm *.out

echo "Bash: This is program <Cosine Calc>"

echo "Bash: Assemble the asm files"
nasm -f elf64 -l cosineCalc.lis -o cosineCalc.o cosineCalc.asm
nasm -f elf64 -l ltoa.lis -o ltoa.o ltoa.asm
nasm -f elf64 -l cosine.lis -o cosine.o cosine.asm
nasm -f elf64 -l atof.lis -o atof.o atof.asm
nasm -f elf64 -l itoa.lis -o itoa.o itoa.asm
nasm -f elf64 -l ftoa.lis -o ftoa.o ftoa.asm


ld -o cosineCalc cosineCalc.o ltoa.o atof.o ftoa.o itoa.o cosine.o  

./cosineCalc


