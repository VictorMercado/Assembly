global _start


section .data
welcomeMsg db "Welcome to Cosine Calc!", 10, 0
lenWelcomeMsg equ $-welcomeMsg

timeNow db "This is the time now in ticks is: ", 0
lenTimeNow equ $-timeNow

inputMsg db "Please enter an angle in degress and press enter: ", 0
lenInputMsg equ $-inputMsg

outputAngleMsg db "You entered this angle: ", 0
lenOutputMsg equ $-outputAngleMsg

outputInputMsg db "You entered: ", 0
lenOutputInputMsg equ $-outputInputMsg

outputRadiansMsg db "The angle in radians is: ", 0
lenOutputRadiansMsg equ $-outputRadiansMsg

outputCosineMsg db "The cosine of the angle in radians is: ", 0
lenOutputCosineMsg equ $-outputCosineMsg

goodbyeMsg db "Goodbye!", 0
lenGoodbyeMsg equ $-goodbyeMsg

STRLEN equ 50
newLine db LF, NULL

;  system codes 
STDIN equ 0
STDOUT equ 1

SYS_read equ 0
SYS_write equ 1
SYS_exit equ 60

SYS_time equ 201

EXIT_SUCCESS equ 0

; reserve space for string 
section .bss
character resb 1
inputStr resb STRLEN+2

section .text

_start:

mov rax, SYS_write
mov rdi, STDOUT
mov rsi, welcomeMsg
mov rdx, lenWelcomeMsg
syscall

loop:




mov	rax, SYS_exit
mov	rdi, EXIT_SUCCESS
syscall


printString:
