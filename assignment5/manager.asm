global timedArraySort
extern printf
extern scanf
extern isnan
extern fsort


section .data
inputPrompt db "Enter how many numbers you want to create not exceeding 10 million: ", 0
inputPromptLen equ $ - inputPrompt

displayArrayMessage db "Here are the first list values of the array ", 0
displayArrayMessageLen equ $ - displayArrayMessage

displayArrayMessage2 db "Here are the second list values of the sorted array ", 0
displayArrayMessage2Len equ $ - displayArrayMessage2

displayArrayMessage3 db "Here are the third list values of the sorted array ", 0
displayArrayMessage3Len equ $ - displayArrayMessage3

msg2 db "Jumped Loop:  ", 0
msg2Len equ $ - msg2

integer_Format db "%lld"

timed_massage db "The time taken to sort the array is: ", 0
timed_massageLen equ $ - timed_massage

anum dq 5

msg db "You entered: %d", 10 , 0
msgLen equ $ - msg

aNumber equ 5

section .bss 
array resq 10000000
input resq 1

section .text

timedArraySort: 

mov rax, 0
mov rdi, inputPrompt
mov rsi, inputPromptLen
call printf

mov rax, 0
mov rdi, integer_Format
mov rsi, input
call scanf


; this will be the counter
mov r14, qword [anum]
mov r15, qword [input]
loop:
cmp r15, r14
je endLoop
; mov rax, 0
; mov rdi, msg
; mov rsi, msgLen
; call printf
mov rax, 0
mov rdi, msg
mov rsi, qword [input]
call printf

endLoop: 
mov rax, 0
mov rdi, msg2
mov rsi, msg2Len
call printf