extern printf

global manager


section .data

message db "Hello, World!", 10, 0
string_form db "%s", 0

section .bss

section .text

manager:

mov rax, 0
mov rdi, string_form
mov rsi, message
call printf

ret
