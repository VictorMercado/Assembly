global loadArray

extern scanf
extern printf



segment .data
single_float_format db "%f", 0

enterResistance1 db "Enter resistance on circuit 1: ", 0
enterResistanceLen equ $ - enterResistance1

enterResistance2 db "Enter resistance on circuit 2: ", 0
enterResistanceLen2 equ $ - enterResistance2

enterResistance3 db "Enter resistance on circuit 3: ", 0
enterResistanceLen3 equ $ - enterResistance3


msg db "here:", 0
msgLen equ $ - msg

segment .bss
; array resq 3

segment .text

loadArray:
;Prolog ===== Insurance for any caller of this assembly module ========================================================
;Any future program calling this module that the data in the caller's GPRs will not be modified.
push rbp
mov rbp, rsp
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
pushf 


; for int i = 0, i < 3, i++
;   array[i] = scanf()
;   scanf(single_float_format, array[i])
;                 %.15lf ,  i want to place here
; mov r15, 0
push qword 0
mov r15, rdi


push qword 0
mov rax, 0
mov rdi, enterResistance1
mov rsi, enterResistanceLen
call printf
pop rax


push qword 0
mov rax, 0
mov rdi, single_float_format
mov rsi, r15
call scanf
pop rax

push rax
mov rax, 0
mov rdi, msg
mov rsi, msgLen
call printf
pop rax

mov rax,0
mov rdi, enterResistance2
mov rsi, enterResistanceLen2
call printf

push qword 0
mov rax, 0
mov rdi, single_float_format
mov rsi, [r8 + 8]
call scanf
pop rax

mov rax,0
mov rdi, enterResistance3
mov rsi, enterResistanceLen3
call printf

push qword 0
mov rax, 0
mov rdi, single_float_format
mov rsi, [r8 + 16]
call scanf
pop rax


pop rax
; beginLoop:
;     cmp r15, 3
;     je endLoop

;     push qword 0
;     mov rax, 0
;     mov rdi, single_float_format
;     mov rsi, [r8 + 8*r15];array[i]
;     call scanf
;     inc r15
;     pop rax
;     ; when r15 == 3

    
;     jmp beginLoop
; endLoop:
; push qword -1
; push qword -2
; push qword -3
; mov rax, 0
; mov rdi, three_float_format
; mov rsi, array
; mov rdx, array
; add rdx, 8
; mov rcx, array
; add rcx, 16
; call scanf
; ; movsd xmm5, [rsp]
; ; movsd xmm6, [rsp + 8]
; ; movsd xmm7, [rsp + 16]
; pop rax
; pop rax
; pop rax

popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rbp
ret 