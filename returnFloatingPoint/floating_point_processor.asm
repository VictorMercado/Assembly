; Program name: "Floating Point Processer".  This program demonstrates input and output float numbers, check for invalid inputs, and
; compare two float numbers.  
; Copyright(C) 2022 Victor Mercado.
;  Author information
;   Author name: Victor Mercado
;   Author email: vmercado29@csu.fullerton.edu
;   Date Completed: 9/4/2022
; This is the main executable file for the program.  It is written in Assembly language for the Intel 8086 microprocessor.

extern printf
extern scanf
extern isfloat
extern atof

global floating_point_processor
; segment .data declares initialized data
segment .data
one_hun equ 16 ; 100 bytes
string_form db "%s" , 0 ; string type
number_form db "%f" , 0 ; float type
goodbye_form db "%s %s" , 0 ; string type
float_form db "ASM: You entered these numbers: %1.13f   %1.13f ", 10 , 0
message db "ASM: Please enter 2 float numbers: ", 10, 0
goodbye db "ASM: Goodbye! Thank you for using my program", 10, 0
wrong_input db "ASM: Invalid input. Please try again", 10, 0
greater_input db "ASM: This number is greater: %1.13f", 10, 0
return db "ASM: This assembly module will now return. The smaller number will now be accessible to the driver.", 10, 0

segment .bss

; segment .text declares the code
segment .text

; invalid_input is a function that prints an error message and exits the program
invalid_input:
; adding 
add rsp, one_hun
mov rax, 0
mov rdi, string_form
mov rsi, wrong_input
call printf

floating_point_processor:
; output instructions for input
mov rax, 0
mov rdi, string_form
mov rsi, message
call printf

; setup for scanf, to read a string
mov rax, 0
mov rdi, string_form
sub rsp, one_hun
mov rsi, rsp
call scanf ; scanf("%f", &number)


;check if the input is a float, pass a block of memory to the function, if it is a float, return 1, else return 0, this will be stored in rax
mov rax, 0
mov rdi, rsp
call isfloat

; conditional jump, if rax is 0, jump to invalid_input
cmp rax, 0
je invalid_input

; atof will convert the string to a float, and store it in xmm0
mov rax, 0
mov rdi, rsp
call atof
movsd xmm14, xmm0 
add rsp, one_hun

; -------------------------------------------second input

; setup for scanf, to read a string
mov rax, 0
mov rdi, string_form
sub rsp, one_hun
mov rsi, rsp
call scanf ; scanf("%f", &number)


;check if the input is a float, pass a block of memory to the function, if it is a float, return 1, else return 0, this will be stored in rax
mov rax, 0
mov rdi, rsp
call isfloat

; conditional jump
cmp rax, 0
je invalid_input

; atof will convert the string to a float, and store it in xmm0
mov rax, 0
mov rdi, rsp
call atof
movsd xmm13, xmm0 
add rsp, one_hun

; push bytes to the stack to make room for the return address
push qword 0
mov rax,1
mov rdi, float_form
movsd xmm0, xmm14
movsd xmm1, xmm13
call printf

; compare the two floats
movsd xmm0, xmm14
movsd xmm1, xmm13
ucomisd xmm0, xmm1

; conditional jump instructions
ja greater

; conditional jump instructions
jb less

; function that prints the greater number if xmm0 is greater than xmm1
greater: 
mov rax,1
mov rdi, greater_input
movsd xmm0, xmm14
call printf
; print goodbye message
mov rax, 0
mov rdi, string_form
mov rsi, return
mov rdx, goodbye
call printf
movsd xmm0, xmm13
pop rax
ret

; function that prints the greater number if xmm0 is less than xmm1
less:
mov rax,1
mov rdi, greater_input
movsd xmm0, xmm13
call printf
; print goodbye message
mov rax, 0
mov rdi, string_form
mov rsi, return
mov rdx, goodbye
call printf
movsd xmm0, xmm14
pop rax


ret