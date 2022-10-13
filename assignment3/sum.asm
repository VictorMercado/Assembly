
extern printf

global sum

section .data
digit_form db "This is how many array items there is: %d", 0

section .text

; sum up all elements of array
sum:

mov rax, 0
mov rdi, digit_form
call printf