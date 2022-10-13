extern printf
extern display_Array

global manager


section .data

message db "Hello, World!", 10, 0
string_form db "%s", 0
aCoolNumber db 135

section .bss

section .text

manager:

mov rdi, "Dude no way sicko mode"
call printf

ret
