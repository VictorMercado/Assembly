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

section .bss 
array resq 10000000

section .text

timedArraySort: 

mov rdi, inputPrompt
mov rsi, inputPromptLen
call printf

