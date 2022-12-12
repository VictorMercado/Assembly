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

integer_Format db "%i", 0

timed_massage db "The time taken to sort the array is: ", 0
timed_massageLen equ $ - timed_massage

msg db "You entered: ", 0
msgLen equ $ - msg


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

mov rax, 0
mov rdi, msg
mov rsi, msgLen
call printf

mov rax, 0
mov rdi, integer_Format
mov rsi, qword [input]
call printf

