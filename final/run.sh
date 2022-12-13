rm *.o
rm *.out
echo "Assemble manager.asm"
nasm -f elf64  -o manager.o manager.asm
echo "Assemble getResistance.asm"
nasm -f elf64 -o getResistance.o getResistance.asm
echo "Assemble loadArray.asm"
nasm -f elf64 -o loadArray.o loadArray.asm
echo "compile driver.cpp using g++ compiler"
gcc -c -Wall -m64 -o driver.o driver.cpp -fno-pie -no-pie -std=c++17
echo "Link object files using the g++ Linker"
g++ -m64 -o finalElectricity.out manager.o driver.o  -fno-pie -no-pie -std=c++17
echo "Run the Electricity Program:"
./finalElectricity.out