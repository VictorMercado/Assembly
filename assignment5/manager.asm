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

displayFrequencyMessage db "Here is the frequency of the cpu: %f", 10, 0
displayFrequencyMessageLen equ $ - displayFrequencyMessage

startingTics db "Starting tics: %lu", 10, 0
startingTicsLen equ $ - startingTics

endingTics db "Ending tics: %lu", 10, 0
endingTicsLen equ $ - endingTics

differenceTics db "Difference tics: %lu", 10, 0
differenceTicsLen equ $ - differenceTics

msg2 db "Here at 2", 10, 0
msg2Len equ $ - msg2

msg3 db "here at 3", 10, 0
msg3Len equ $ - msg3

double_Format db "%lf"

integer_Format db "%i"

timed_massage db "The time taken to sort the array is: ", 0
timed_massageLen equ $ - timed_massage

msg db "You entered: %d", 10 , 0
msgLen equ $ - msg


section .bss 
array resq 10
input resq 1

section .text

timedArraySort: 

mov rax, 0
mov rdx, 0
cpuid
rdtsc
shl rdx, 32
add rdx, rax
mov r11, rdx

mov rax, 0
mov rdi, startingTics
mov rsi, r11
call printf

mov rax, 0
mov rdi, inputPrompt
mov rsi, inputPromptLen
call printf

push rax
mov rax, 0
mov rdi, integer_Format
mov rsi, input
call scanf
pop rax

push rax
mov rax, 0
mov rdi, array
mov rsi, [input]
call randFillArray
pop rax

mov rax, 0
mov rdi, array
mov rsi, 0
mov rdx, [input]
call display


; mov rax, 0
; mov rdi, msg3
; mov rsi, msg3Len
; call printf

push rax
mov rax, 1
call clock_speed
movsd xmm11, xmm0
pop rax

push rax
mov rax, 1
mov rdi, displayFrequencyMessage
movsd xmm0, xmm11
call printf
pop rax

; mov rax, 0
; mov rdi, double_Format
; movsd rsi, xmm0