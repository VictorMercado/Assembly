extern printf
extern display_Array
extern scanf
extern sum

global manager


section .data

welcome_message db "Hello, this program will add your floats!", 10, 0
show_numbers db "Your numbers are: ", 10, 0
sum_message db "The sum of your numbers is: %d", 10, 0
exit_message db "This program will now exit back to the driver.", 10, 0
aCoolNumber dd 150

string_form db "%s", 0
; d is 32-bit
digit_form db "%d", 0



section .bss

section .text

manager:

push rbp
mov rbp, rsp

push rdi                                                    ;Backup rdi
push rsi                                                    ;Backup rsi
push rdx                                                    ;Backup rdx
push rcx                                                    ;Backup rcx
push r8                                                     ;Backup r8
push r9                                                     ;Backup r9
push r10                                                    ;Backup r10
push r11                                                    ;Backup r11
push r12                                                    ;Backup r12
push r13                                                    ;Backup r13
push r14                                                    ;Backup r14
push r15                                                    ;Backup r15
push rbx                                                    ;Backup rbx
pushf  

push qword 0        ; push 0 to the stack to stay aligned

sub rsp, 24

mov dword [rsp], 1
mov dword [rsp + 4], 2
mov dword [rsp + 8], 3
mov dword [rsp + 12], 4
mov dword [rsp + 16], 5

; moving rsp which holds the address where the array is stored 
mov rdi, rsp
mov rsi, 5
call display_Array


mov rax, 0
mov rdi, rsp
mov rsi, 5
call sum
;rax has the return value

mov rdi, sum_message
mov rsi, rax
call printf

; call display_Array



add rsp, 24
pop rax ; pop for the push qword 0

popf                                                        ;Restore rflags
pop rbx                                                     ;Restore rbx
pop r15                                                     ;Restore r15
pop r14                                                     ;Restore r14
pop r13                                                     ;Restore r13
pop r12                                                     ;Restore r12
pop r11                                                     ;Restore r11
pop r10                                                     ;Restore r10
pop r9                                                      ;Restore r9
pop r8                                                      ;Restore r8
pop rcx                                                     ;Restore rcx
pop rdx                                                     ;Restore rdx
pop rsi                                                     ;Restore rsi
pop rdi                                                     ;Restore rdi
pop rbp 


ret
