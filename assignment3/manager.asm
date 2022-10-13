extern printf
extern display_Array

global manager


section .data

message db "Hello, World!", 10, 0
string_form db "%s", 0
aCoolNumber db 135
number_form db "%d", 0

section .bss

section .text

manager:

mov rdi, number_form
mov rsi, aCoolNumber
call printf

ret
