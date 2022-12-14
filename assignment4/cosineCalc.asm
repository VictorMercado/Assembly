; name: Victor Mercado
; email: vmercado29@csu.fullerton.edu

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
extern cosine

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

radians dq 0.0174533

lenOfBuffer dq 50

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
inputStr2 resb STRLEN
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

mov rax, SYS_write
mov rdi, STDOUT
mov rsi, inputMsg
mov rdx, lenInputMsg
syscall

mov r14, 0                          ; our counter for the loop
mov rbx, inputStr                   ; pointer to input string storage buffer

loop:
    ; syscall calls read(int filedescriptor, void *buf, size_t count)  since SYS_read is in rax
    mov rax, SYS_read
    mov rdi, STDIN
    mov rsi, character       ; pointer to character address
    mov rdx, CHARLEN                ; read 1 byte
    syscall

    mov al, byte [character]       ; move the character into low byte of rax
    cmp al, newLine                     ; check if it is a new line
    je endLoop                      ; if it is a new line, jump to endLoop cause were done

    cmp r14, STRLEN                  ; check if we have reached the max length of the string
    jae loop                        ; if we have reached STRLEN, jump to loop to cut off any input except for newLine

    inc r14                     ; increment counter
    mov byte [rbx], al          ; store character in string stack address
    inc rbx                     ; increment pointer to next byte

    jmp loop                    ; jump back to loop
endLoop:
mov byte [rbx], 0                   ; add null terminator to end of string
mov rdi, inputStr                   ; pointer to the beginning of input string
call atof
movsd xmm15, xmm0

mov rdi, inputStr2
mov rsi, 50
call ftoa

mov rax, SYS_write               
mov rdi, STDOUT                     ; file descriptor 1 is standard output
mov rsi, outputInputMsg                 ; address of string to write
mov rdx, lenOutputInputMsg              ; length of string
syscall 

mov rdi, inputStr2
call printString

mov rax, SYS_write               
mov rdi, STDOUT                     ; file descriptor 1 is standard output
mov rsi, outputRadiansMsg                 ; address of string to write
mov rdx, lenOutputRadiansMsg              ; length of string
syscall

movsd xmm2, qword [radians]
mulsd xmm15, xmm2

movsd xmm0, xmm15
mov rdi, inputStr2
mov rsi, 50
call ftoa

mov rdi, inputStr2
call printString 

mov rax, SYS_write
mov rdi, STDOUT
mov rsi, outputCosineMsg
mov rdx, lenOutputCosineMsg
syscall

movsd xmm0, xmm15
call cosine

mov rdi, inputStr2
mov rsi, 50
call ftoa


mov rdi, inputStr2
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

