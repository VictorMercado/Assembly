; Program name: "Triangle Processor".  This program demonstrates inputting lengths of a triangle and 
; returning the area and hypothenuse.
; Copyright(C) 2022 Victor Mercado.
;  Author information
;   Author name: Victor Mercado
;   Author email: vmercado29@csu.fullerton.edu
;   Date Completed: 9/16/2022
; This is the main executable file for the program.  It is written in Assembly language for the Intel 8086 microprocessor.

extern printf
extern scanf
extern pythagoras


global triangle_processor

section .data
one_hun = 100 
one_half dd 0.5 ; 0.5 is a constant value that is used to calculate the area of a triangle.
float_format db "%f", 10, 0 ; This is a float form that is used to print the hypotenuse/area of the triangle.
string_format db "%s", 10, 0 ; This is a string format for I/O
name_prompt db "Enter your name: ", 0 ; This is a prompt that asks the user to enter their name.
occupation_prompt db "Please enter your title (Mr, Ms, Nurse, Engineer, etc): ", 0 ; This is a prompt that asks the user to enter their occupation.

section .bss

section .text

triangle_processor:


mov rax, 0
mov rdi, string_format
mov rsi, name_prompt
call printf

; setup for scanf, to read a string
mov rax, 0
mov rdi, float_format
sub rsp, one_hun
mov rsi, rsp
call scanf ; scanf("%f", &number)

; setup for printf, to print a string

