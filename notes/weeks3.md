long float 64bit otherwise its 32 bit
floatform db "%lf"

mov rax, 0
mov rdi, floatform
push qword 0        ; 64bit push of all 0s
mov rsi, rsp
call scanf
movsd xmm10, [rsp]
pop rax

; block to input 2 floats

mov rax, 0
mov rdi, floatform2
push qword 3
mov rsi, rsp
push qword 5000
mov rdx, rsp
call scanf
movsd xmm13, [rsp]
pop rax
movsd xmm12, [rsp]
pop rax

; square both numbers stored xmm13 xmm14, add them then square root them

movsd xmm8, xmm13       ; to store original number if you want
mulsd xmm13, xmm13

addsd xmm13, xmm14

; xmm13= sum of square

sqrtsd xmm8, xmm13


each function has a stack frame rbp at the bottom and rsp at the top

after execution of a function is stack location gets popped and returns control to the caller of the function

use gdb to output the top of stack's frame

qword in stack frame (rbp-rsp)/ 8 + 1

gdb make break (b) at some line or funciton name like main

b cosmos.asm:22 to place breakpoints in functions 

i b to show breakpoints

r to run 

n to move to next breakpoint

p/d m (m is a variable) used to show the value of the variable

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

p/d output in decimal
p/t output in binary
p/f output in floats
p/x for hex
for address p/x $rsp p/x $rbp  
p/x &m to return address of var m
p/d ($rbp-$rsp)/8+1
x/19xg $rsp

x/(number of things to show)(type of command)(datasize)

ni for next info
in gdb g stands for qword 64-bit
in gdb w stands for double 32-bit
in gdb h stands for word 16-bit
in gdb b stands for byte 8-bit

x/1dg 0x7fffffffde9c to check the contents of the address
x/1dw 

p/x $xmm0.v2_double[0] to access elements in an array

SSE all xmm registers streaming SIMD Extension
SIMD = SIngle Instruction Multiple Data

