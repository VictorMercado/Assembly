; // ;Program name: "Great Reverse".

; // Author name: Victor Mercado
; // Author email: vmercado29@csu.fullerton.edu
; //     October 13, 2022
; //     Section ID : Section 7  | Section TuTh 8 - 10am
global reverse

section .data



section .text

reverse:

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
pushf                                                       ;Backup rflags


push qword 0

sub rsp, 16

mov r12, rdi    ; holds arrayB address
mov r14, rsi    ; holds arrayA address
mov r15, rdx    ; holds arrayA size

mov r13, 0

loop:
    cmp r13, r15
    je done

    push [r14 + r13 * 8]
    pop [r12 + r13 * 8]
    inc r13
jmp loop



done:
add rsp, 16

pop rax


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

