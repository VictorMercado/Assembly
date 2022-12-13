global manager

extern printf
extern scanf

segment .data

prompt db "Enter a number: ", 10, 0
promptLen equ $ - prompt

singleF db "The number is %f", 0


segment .bss

; array resq 5

segment .text 

manager:

push rax
mov rax, 0
mov rdi, prompt
mov rsi, promptLen
call printf
pop rax

; push qword 0
; mov rax, 0
; mov rdi, singleF
; mov rsi, array
; call scanf
; pop rax

; mov rax,0
; mov rdi, singleF
; mov rsi, array
; call printf

; movsd xmm0, [array]