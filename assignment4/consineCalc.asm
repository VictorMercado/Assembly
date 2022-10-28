; functions needed
; cos(x).asm
; atof.asm
; ftoa.asm
; ltoa.asm
; consineCalc.asm
; run.sh
global _start
global printString
extern ltoa
extern atof
extern ftoa

section .data
welcomeMsg db "Welcome to Cosine Calc!", 10, 0
lenWelcomeMsg equ $-welcomeMsg

aNumToPrint db 52, 53, 54, 55, 56, 0xA
lenANumToPrint equ $-aNumToPrint

timeNow db "This is the time now in ticks: ", 0
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

inputLabel db "Input: ", 0
lenInputLabel equ $-inputLabel

enterPrintString db "Entered Print string call", 10, 0
lenEnterPrintString equ $-enterPrintString

goodbyeMsg db "Goodbye!", 10, 0
lenGoodbyeMsg equ $-goodbyeMsg

testAdd dq 10.0

lenOfBuffer db 50

newLineData db 10


STRLEN equ 50                   ; max length of string for this program only
CHARLEN equ 1                   ; 1 byte per character
newLine equ 0xA                 ; newline character ascii code

;  system codes 
STDIN equ 0                     ; standard input
STDOUT equ 1                    ; standard output

SYS_read equ 0                  ; system code to indicate read from file descriptor 
SYS_write equ 1                 ; system code to indicate write to file descriptor
SYS_exit equ 60                 ; system code to indicate exit

SYS_time equ 201                ; system code to indicate get time

EXIT_SUCCESS equ 0              ; exit code to indicate success

; reserve space for string 
section .bss
character resb 1                ; reserve space for character on low address stack
inputStr resb STRLEN+2          ; reserve space for input string on low address stack 50 + 2 for newline and null terminator
ticksStr resq 1
ticksStr2 resq 1

section .text

_start:
; syscall calls write(int filedescriptor, const void *buf, size_t count)  since SYS_write is in rax 
mov rax, SYS_write               
mov rdi, STDOUT                     ; file descriptor 1 is standard output
mov rsi, welcomeMsg                 ; address of string to write
mov rdx, lenWelcomeMsg              ; length of string
syscall


mov rax, SYS_write
mov rdi, STDOUT
mov rsi, timeNow
mov rdx, lenTimeNow
syscall

xor rax, rax
xor rdi, rdi
xor rdx, rdx
xor rsi, rsi

cpuid
rdtsc
shl rdx, 32
add rdx, rax


mov rdi, rdx
mov rsi, ticksStr
call ltoa

mov rdi, rax
call printString

; mov rax, SYS_write               
; mov rdi, STDOUT                     ; file descriptor 1 is standard output
; mov rsi, aNumToPrint                 ; address of number to write
; mov rdx, lenANumToPrint              ; length of number
; syscall

; change decimal to radians
; save in put value in xmm9
; mov xmm9, rdi
; mov rax, 180
; cvtsi2sd xmm10, rax
; pie = 4009 21fb 5444 2d18 for xmm registers

; mov rax, 0x4009 21fb 5444 2d18
; push rax
; movsd xmm15, [rsp]
; pop rax

; 

mov rax, SYS_write
mov rdi, STDOUT
mov rsi, inputLabel
mov rdx, lenInputLabel
syscall

mov r12, 0                          ; our counter for the loop
mov rbx, inputStr                   ; pointer to input string storage buffer

loop:
    ; syscall calls read(int filedescriptor, void *buf, size_t count)  since SYS_read is in rax
    mov rax, SYS_read
    mov rdi, STDIN
    lea rsi, byte [character]       ; pointer to character address
    mov rdx, CHARLEN                ; read 1 byte
    syscall

    mov al, byte [character]       ; move the character into low byte of rax
    cmp al, newLine                     ; check if it is a new line
    je endLoop                      ; if it is a new line, jump to endLoop cause were done

    cmp r12, STRLEN                  ; check if we have reached the max length of the string
    jae loop                        ; if we have reached STRLEN, jump to loop to cut off any input except for newLine

    inc r12                     ; increment counter
    mov byte [rbx], al          ; store character in string stack address
    inc rbx                     ; increment pointer to next byte

    jmp loop                    ; jump back to loop
endLoop:
mov byte [rbx], 0                   ; add null terminator to end of string
mov rdi, inputStr                   ; pointer to the beginning of input string
call atof

movsd xmm2, qword [testAdd]
addsd xmm0, xmm2

mov rdi, inputStr
mov rsi, r12
call ftoa

mov rdi, rax
call printString                    ; call printString to print the string/ print string will count the string and pass to syscall


exampleDone:


    mov rax, SYS_write
    mov rdi, STDOUT
    mov rsi, timeNow
    mov rdx, lenTimeNow
    syscall

    xor rax, rax
    xor rdx, rdx
    xor rdi, rdi
    xor rsi, rsi

    cpuid
    rdtsc
    shl rdx, 32
    add rdx, rax

    mov rdi, rdx
    mov rsi, ticksStr2
    call ltoa

    mov rdi, rax
    call printString    
    
    mov rax, SYS_write
    mov rdi, STDOUT
    mov rsi, goodbyeMsg
    mov rdx, lenGoodbyeMsg
    syscall

    mov rax, SYS_exit
    mov rdi, EXIT_SUCCESS
    syscall

printString:
    push rbx
    mov rbx, rdi                        ; move rdi pointer of input string to rbx
    
    mov r15, 0
    loop2:
        cmp byte [rbx], 0               ; check if it is a null terminator
        je endLoop2                     ; if it is a null terminator, jump to endLoop2 cause were done

        inc r15                         ; increment counter
        inc rbx                         ; increment pointer to next byte

        jmp loop2                       ; jump back to loop
    endLoop2:

    cmp r15, 0                          ; check if the string is empty
    je printDone                        ; if it is empty, dont print anything

    mov rax, SYS_write
    mov rsi, rdi                
    mov rdi, STDOUT
    mov rdx, r15                            ; length of string
    syscall

    mov rax, SYS_write
    mov rdi, STDOUT
    mov rsi, newLineData                 ; syscall needs an address to newline character
    mov rdx, 1 
    syscall

    printDone:
    pop rbx
    ret

