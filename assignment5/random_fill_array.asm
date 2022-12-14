global randFillArray

extern scanf
extern isnan
extern printf

section .data
msg db " data %lf ", 10, 0
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

mov r10, rdi    ; r10 will be the array to fill
mov r11, rsi    ; r11 will be the number of random numbers to accept

mov r12, 0      ; this will be the counter

loopp:
    cmp r11, r12
    jge endLoop

    rdrand r9

    ; mov rax, 0
    ; mov rdi, msg
    ; mov rsi, r8
    ; call printf

    movq xmm2, r9
    ucomisd xmm2, xmm2
    jp loopp

    ; mov rax, 1
    ; movsd xmm0, xmm10
    ; call isnan
    ; cmp rax, 1
    ; je loopp
    ; mov rax, 0
    ; mov rdi, msg
    ; mov rsi, xmm0 
    ; call printf

    movsd [r10 + (r12 * 8)], xmm2
    inc r12
    mov r9, 0
    jmp loopp

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
; randFillArray:
;         push rbp
;         mov  rbp, rsp

;         push r12
;         push r13
;         push r14
;         push r15

;         mov r14, rdi                   ; arg1: array pointer
;         mov r15, [rsi]                   ; arg2: array size

;         mov r13, 0                     ; initialize index
        
;         mov rax, 0
;         mov rdi, msg
;         mov rsi, r13
;         call printf
; loopp:
; ; Length check.
;         cmp r13, r15
;         jge done

; ; Generate random number using rdrand.
; ;         mov    rax, 0
; ;         rdrand rax

; ; ; Convert to double and store in xmm0.
; ;         cvtsi2sd xmm0, rax

; ; Assert that it's not NaN, regenerate if it is.
;         ; ucomisd xmm0, xmm0             ; if NaN, then parity flag is set
;         ; jp      .loop                  ; (j)ump if (p)arity

; ; Store random float number in array.
;         ; movsd [r14 + (r13 * 8)], xmm0

; ; Increment index and reloop.
;         inc r13
;         jmp loopp

; done:
;         mov rax, 0
;         mov rdi, msg
;         mov rsi, r13
;         call printf


;         pop r15
;         pop r14
;         pop r13
;         pop r12

;         pop rbp
;         ret 
