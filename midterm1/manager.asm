; // ;Program name: "SumArrayIO".

; // Author name: Victor Mercado
; // Author email: vmercado29@csu.fullerton.edu
; //     October 13, 2022
; //     Section ID : Section 7  | Section TuTh 8 - 10am

extern printf
extern scanf
extern input_array
extern display_array
extern reverse

global manager

segment .data
welcome_control db "Welcome to Great Reverse. The accuracy and reliability of this program is guaranteed by Victor Mercado.",10,0
present_numbers db "The numbers you entered are these: ",10,0
the_sum_is db "The sum of these values: %.10lf.", 10 ,0
exit_message db "The control module will now return the sum to the caller module.",10,0
MAX equ 10

segment .bss  ;Reserved for uninitialized data
arrayA resq 10
arrayB resq 10


; Color codes
; Yellow: driver
; Gold: manager
; Green: display_array
; White: input_array

segment .text ;Reserved for executing instructions.
manager:
push rbp
mov  rbp,rsp
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

push qword 0


mov rax, 0
mov rdi, welcome_control
call printf


push qword 0
mov rax, 0
mov rdi, arrayA ; array passed in as first param
mov rsi, 10         ; array size passed in as second param
call input_array
mov r15, rax
pop rax

mov rax, 0
mov rdi, present_numbers
call printf

push qword 0
mov rax, 0
mov rdi, arrayA
mov rsi, r15
call display_Array
pop rax



pop rax ; pop at the beginning of the program


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
pop rbp                                                     ;Restore rbp

ret