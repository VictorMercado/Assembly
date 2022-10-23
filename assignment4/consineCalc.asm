global manager


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

manager:

mov rax, 4
mov rbx, 1
mov rcx, welcomeMsg
mov rdx, lenWelcomeMsg
syscall



