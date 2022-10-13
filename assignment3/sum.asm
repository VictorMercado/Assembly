
extern printf

global sum

section .data
digit_form db "This is how many array items there is: %d \n", 0
start_code db "\e[32m", 0
end_code db "\e[0m", 0

section .text

; sum up all elements of array
sum:
mov r12, rsi
mov rsi, 0
mov rdi, start_code
call printf

mov rax, 0
mov rdi, digit_form
mov rsi, r12
call printf

mov rdi, end_code
call printf
