next week Tuesday

Start 8:00am

1. Software License
3 main types of software licenses
EULA: An end-user license agreement (short EULA, /ˈjuːlə/) is a legal contract entered into between a software developer or vendor and the user of the software, often where the software has been purchased by the user from an intermediary such as a retailer. A EULA specifies in detail the rights and restrictions which apply to the use of the software

4 rights from open Source(FOSS)
1.  The right to receive a copy of the source code along with executable file(s) and to install the program on multiple platforms

2.  The right to distribute copies of the program by any means including electronic transmissions.

3.  The right to modify the source code and run the modified program on multiple platforms

4.  The right to distribute the modified program via any media.

Limits

Legal lic & Notice of license
why?
1. to protect the software
2. to protect the user
3. to protect the developer
4. to protect the company
5. to protect the community

2. Famous People

king of linux
created Linux
Linus Torvalds

king of open source
created GNU
Richard Stallman

king of assembly
Chris Sawyer

king of assembly education
Chris Creel

made a computer
Charles Babbage

first programmer
Ada Lovelace

First electronic computer
Atanasof 1940 
ABC

Aiken made the Mark 1 in 1944
Grace Hopper found a bug in the Mark 1

5 things that every computer will have
John Von Neumann
von Neumann architecture

Classes of software
application 
library
which license is used for each
Intellectual property rights

Tim Berners-Lee
created the world wide web
HTML

## Integers
unsigned 
twos complement
0   F  
1   E
2   D
3   C
4   B
5   A
6   9
7   8
8   7
9   6
A
B
C
D
E
F
babbage created 10s complement 

16 complement int 
largest
smallest 
signed

floats
IEEE754
convert Decimal FLoat <--> IEEE Float

Properties of nans
properties of subnormal numbers
Bias number in binary, base 10 , hex
geometric sum 0x400B BBBB BBBB BBBB

smallest positive normal number
bias
base = -1022 = true exponent

## Architecture of numbers
MSB = Most significant bit
LSB = Least significant bit
Little Endian / Big Endian

## Ogranization of memory
Stack - high memory
Heap - can have low memory addresses
BSS - uninitialized data
data - initialized data
text - code
reserved - OS - low memory

## Famous computer 
Difference 
Analytical 
ABD 
MArk 1

## GDB 
how to output values
focus is on display of data
c++ variables
output vars in binary,hex,decimal
output values in regiesters GPRs & SSE XMMs registers as binary, hex, decimal
int * p 
output address of p is in the stack
output value of p is in the heap
dynamic memory allocation
int * p = new int[4]
stack stores the address of the heap
output variables, arrays, registers, region of memory
p/x 0x7FFFFFFF8760
p/d p 



## Maintain Software in Bash
echo $shell
lsb_release -a outputs the version of the OS
sudo apt update / updates all dependencies
sudo apt upgrade / upgrades all dependencies

little endian is least significant bit is stored first
big endian is most significant bit is stored first
arrays are stored in little endian
0x402A B000 0000 0000 is big endian
0x0000 0000 00B0 2A40 is little endian
40 and 2A stay together

big endian in source code but stored in memory as little endian

## Book

CHapter 1.3 benefits of learning assembly

Chapter 2 Von Neuamn Architecture for computer
2.2 Vocabulary of size
2.3 CPU (incomplete)
    GPRs
    cache
    ALU
    memory

|AVX | GPRS | SSE | FPU | ALU cache|
2.4 Endians
2.5 Memory Layout
2.6 not doing 

CHapter 3
two's complement
IEEE
focus on 64 bit

3.4 not doing

Chapter 4 Program format
Layout of source in assembly

4.3 declare constants in assembly

Chpater 5 Tool chain
whats a assembler
Linker - how to call linker    ld -o hello hello.o
Loader - apart of OS
Debugger
Bash files

Chapter 6 GDB
ignore all DDD
pg. 63 
<n> number of locations to display, 1 is default.
<f> format: 
d – decimal (signed)
x – hex
u – decimal (unsigned) 
c – character
s – string
f – floating-point

<u> unit size: 
b – byte (8-bits) 
h – halfword (16-bits)
w – word (32-bits) 
g – giant (64-bits)

x/<n><f><u> &<variable>

Chapter 7 Instruction
<reg> any GPRS
<dest> any register receiving data
<src> source
<mem> memory
<imm> immediate value
add <dest>, <src>
add <dest>, <mem>
add <dest>, <imm>
how to get remainder in assmebly
mov r9, 5
mov r10, 7
mov rax, r9
cqo = convert quadword to octword 
connects rdx and rax to make 128 bits
idiv r10 - subrracts 64 bits from 128 bits
rdx is the remainder
rax is the quotient

Logic 
xor
and
or
not

Labels:

cmp stores in rflag for jumps
signed ints
jg
jl
jge
jle
je
jne

ucomisd xmm0,xmm1 stores in rflag for jumps
floats/unsigned
ja
jae
jb
jbe
je
jne

chapter 8
none

chapter 9 stack + functions

chapter 10,11 
none

chapter 12 
calling functions

chapter 13
none

chapter 14
how to link files
gdb mode

Chapter 15,16,17
none

Chpater 18
cvtsi2sd- convert signed int to double
cvtsd2si- convert double to signed int
addsd xmm4, xmm5
addsd xmm4, rax will cause error
mov rcx, 15
cvtsi2sd xmm3, rcx
xmm3 is now 15.0
cvtsd2si rax, xmm3
rax is now 15
xorpd xmm3, xmm3 for fast zeroing

xmm3 = 0.0, rax = 0
cvtsi2sd xmm3 , rax / to zero out xmm3
