rm *o

nasm -f elf64 -o manager.o manager.asm

g++ -c -Wall -m64 -o driver.o driver.cpp  -fno-pie -no-pie -std=c++17

g++ -m64 -o finalElectricity manager.o driver.o  -fno-pie -no-pie -std=c++17

./finalElectricity