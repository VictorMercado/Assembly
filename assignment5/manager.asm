global timedArraySort
extern printf
extern scanf
extern isnan
extern fsort
extern clock_speed
extern randFillArray
extern display

section .data
inputPrompt db "Enter how many numbers you want to create not exceeding 10 million: ", 0
inputPromptLen equ $ - inputPrompt

displayArrayMessage db "Here are the first list values of the array ", 0
displayArrayMessageLen equ $ - displayArrayMessage

displayArrayMessage2 db "Here are the second list values of the sorted array ", 0
displayArrayMessage2Len equ $ - displayArrayMessage2

displayArrayMessage3 db "Here are the third list values of the sorted array ", 0
displayArrayMessage3Len equ $ - displayArrayMessage3

displayFrequencyMessage db "Here is the frequency of the cpu: %lf", 10, 0
displayFrequencyMessageLen equ $ - displayFrequencyMessage

msg2 db "Jumped Loop", 10, 0
msg2Len equ $ - msg2

double_Format db "%lf"

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

mov rax, 0
mov rdi, array
mov rsi, input
call randFillArray

mov rax, 0
mov rdi, array
mov rsi, 0
mov rdx, input
call display

mov rax, 0
mov rdi, msg2
mov rsi, msg2Len
call printf


mov rax, 0
call clock_speed


; mov rax, 0
; mov rdi, displayFrequencyMessage
; movq rsi, xmm0 
; call printf

; mov rax, 0
; mov rdi, double_Format
; movsd rsi, xmm0