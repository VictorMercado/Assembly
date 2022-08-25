; Program name: "Float Processer".  This program demonstrates input and output float numbers, check for invalid inputs, and
; compare two float numbers.  
; Copyright(C) 2022 Victor Mercado.
;  Author information
;   Author name: Victor Mercado
;   Author email: vmercado29@csu.fullerton.edu


; this is a nasm assembly file

; data
; d = define
; b = bytes
; w = words (2 bytes)
; d = double words (4 bytes)
; l = longwords (4 bytes)
; q = quadwords (8 bytes)

extern printf
extern scanf
extern isfloat
extern atof

global floating_point_processor
; segment .data declares initialized data
segment .data
one_k equ 1024
string_form db "%s" , 0
message db "ASM: Please enter 2 float numbers: ", 10, 0
goodbye db "ASM: Goodbye! Thank you for using my program", 10, 0

segment .bss
;empty

; segment .text declares the code
segment .text

; invalid_input is a function that prints an error message and exits the program

; invalid_input:
; mov rax, 0
; mov rdi, message
; mov rsi, invalmess
; call printf

; xmm12 is our special location

; push qword 0
; movsd xmm12, [rsp]
; pop rax

floating_point_processor:
; backup the registers(GRP)
; print welcome message

; output instructions for input
mov rax, 0
mov rdi, string_form
mov rsi, message
call printf

pop rsi
pop rdi
mov rdi, string_form
mov rsi, goodbye
call printf
; read input
; mov rax, 0
; mov rdi, string_form
; sub rsp, one_k
; mov rsi, rsp
; call scanf

; check if input is a float
; mov rax, 0
; mov rdi, rsp
; call isfloat

; if input is not a float, print error message and exit
; cmp rax, 0
; je invalid_input
; mov rax, 0
; mov rdi, rsp
; call atof
; movsd xmm14, xmm0   ; xmm14 = first number

; restore the registers(GRP)

; movsd xmm0, xmm14
; ret

mov rax, 12345
ret