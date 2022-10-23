global _start


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
SYS_exit equ 1

section .text
_start:

mov rax, SYS_write
mov rbx, STDOUT
mov rcx, welcomeMsg
mov rdx, qword [lenWelcomeMsg]
syscall


exit:
   mov	rax, SYS_exit
   xor	rbx, rbx
   int	80h


