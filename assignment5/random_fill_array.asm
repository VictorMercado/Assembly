global randFillArray

extern scanf
extern isnan
extern printf

section .data
msg db "Here at 1", 10, 0
msgLen equ $ - msg

section .bss

section .text

; rdi will have the array to fill
; rsi will have number of inputs to accept

randFillArray:
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

mov r10, rdi ; r10 will be the array to fill
mov r11, rsi ; r11 will be the number of random numbers to accept
; this will be the counter
mov r12, 0

loop:
cmp r12, r11
jge endLoop

rdrand rax
cvtsi2sd xmm10, rax

; mov rax, 0
; mov rdi, msg
; mov rsi, msgLen
; call printf

; mov rax, 1
; movsd xmm0, xmm10
; call isnan
; cmp rax, 1
; je loop

movsd [r10 + r12 * 8], xmm10
inc r12
jmp loop

endLoop: 

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
ret  ; return xmm0