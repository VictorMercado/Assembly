
section .data
welcomeMsg db "Welcome to Cosine Calc!", 0
lenWelcomeMsg equ $ - welcomeMsg

timeNow db "This is the time now in ticks is: ", 0
lenTimeNow equ $ - timeNow

inputMsg db "Please enter an angle in degress and press enter: ", 0
lenInputMsg equ $ - inputMsg

outputAngleMsg db "You entered this angle: ", 0
lenOutputMsg equ $ - outputAngleMsg

outputInputMsg db "You entered: ", 0
lenOutputInputMsg equ $ - outputInputMsg

outputRadiansMsg db "The angle in radians is: ", 0
lenOutputRadiansMsg equ $ - outputRadiansMsg

outputCosineMsg db "The cosine of the angle in radians is: ", 0
lenOutputCosineMsg equ $ - outputCosineMsg

goodbyeMsg db "Goodbye!", 0
lenGoodbyeMsg equ $ - goodbyeMsg

STDOUT equ 1
SYS_write equ 1
SYS_exit equ 60
EXIT_SUCCESS equ 0

section .text

global _start


_start:

mov rax, SYS_write
mov rdi, STDOUT
mov rsi, welcomeMsg
mov rdx, qword [lenWelcomeMsg]
syscall


exit:
   mov	rax, SYS_exit
   mov	rdi, EXIT_SUCCESS
   syscall


