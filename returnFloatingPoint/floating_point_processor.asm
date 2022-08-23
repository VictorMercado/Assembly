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

; segment .data declares initialized arrays
segemnt .data
string_form db "%s" , 0
message db "Please enter 2 float numbers: ", 0


; myinfo resq 50
; double myinfo[50]

section .text

floating_point_processor:

; back up registers
; segment .backup

; push rbp
; mov rbp, rsp

; output instructions for input

mov rax, 0
mov rdi, string_form
mov rsi, message
call prinf
