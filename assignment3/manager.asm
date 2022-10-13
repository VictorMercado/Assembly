extern printf
extern display_Array
extern scanf
extern sum

global manager


section .data

welcome_message db "Hello, this program will add your floats!", 10, 0
show_numbers db "Your numbers are: ", 10, 0
sum_message db "The sum of your numbers is: %d", 10, 0
exit_message db "This program will now exit back to the driver.", 10, 0
aCoolNumber dd 150

string_form db "%s", 0
; d is 32-bit
digit_form db "%d", 0



section .bss

section .text

manager:

push rbp
mov rbp, rsp

push qword 0

sub rsp, 24

mov dword [rsp], 1
mov dword [rsp + 4], 2
mov dword [rsp + 8], 3
mov dword [rsp + 12], 4
mov dword [rsp + 16], 5

mov rdi, rsp
mov rsi, 5
call display_Array


mov rdi, sum_message
call printf

add rsp, 24

pop rbp
pop rax


ret
