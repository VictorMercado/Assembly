rm *.o
rm *.out

echo "Bash: This is program <Demonstrate Numeric IO>"

echo "Bash: Assemble the asm files"
nasm -f elf64 -l consineCalc.lis -o consineCalc.o consineCalc.asm
# nasm -f elf64 -l cosine.lis -o cosine.o cosine.asm
# nasm -f elf64 -l atof.lis -o atof.o atof.asm
# nasm -f elf64 -l ftoa.lis -o ftoa.o ftoa.asm


ld -m elf_x86_64 -o consineCalc consineCalc.o -fno-pie -no-pie -std=c++17  #cosine.o atof.o ftoa.o 

./consineCalc


