rm *.o
rm *.out

echo "Bash: This is program <Cosine Calc>"

echo "Bash: Assemble the asm files"
nasm -f elf64 -l consineCalc.lis -o consineCalc.o consineCalc.asm
# nasm -f elf64 -l cosine.lis -o cosine.o cosine.asm
# nasm -f elf64 -l atof.lis -o atof.o atof.asm
# nasm -f elf64 -l ftoa.lis -o ftoa.o ftoa.asm


ld -g -o consineCalc consineCalc.o #cosine.o atof.o ftoa.o 

./consineCalc


