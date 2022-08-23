#!/bin/bash


#Author: Victor
#hello world

rm *.o
rm *.out

echo "This is hello world program"

echo "Assemble hello.asm"
nasm -f macho64 -o hello.o hello.asm
# -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem
ld hello.o -o hello -macosx_version_min 11.0 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem

echo "Run the program"
./hello

echo "The bash script file is now closing."