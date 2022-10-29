rm *.o
rm *.out

echo "Bash: Assemble the module atof.asm"
nasm -f elf64 -o atof.o atof.asm

# echo "Bash: Compile the C++ module islfoat.cpp"
# g++ -c -m64 -Wall -o isfloat.o isfloat.cpp -fno-pie -no-pie -std=c++17

echo "Bash: Compile the C++ module driver.cpp"
g++ -c -m64 -Wall -o driver.o driver.cpp -fno-pie -no-pie -std=c++17

echo "Bash: Link the two object files already created"
g++ -m64 -o testEnv driver.o atof.o -fno-pie -no-pie -std=c++17

echo "Bash: Run the program testENV"
./testEnv