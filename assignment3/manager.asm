extern printf
extern display_Array
extern scanf

global manager


section .data

welcome_message db "Hello, this program will add your floats!", 10, 0
show_numbers db "Your numbers are: ", 10, 0
sum_message db "The sum of your numbers is: ", 10, 0
exit_message db "This program will now exit back to the driver.", 10, 0
aCoolNumber dd 150

string_form db "%s", 0
; d is 32-bit
digit_form db "%d", 0



section .bss

section .text

manager:
push qword 0
mov rax, 0
mov rdi, digit_form
mov rsi, [aCoolNumber]
call printf

ret
