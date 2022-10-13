

global sum

section .data



section .text

; rdi has 1 param - pointer to array
; rsi has 2 param - size of array
; sum up all elements of array and return result in rax
mov r12, 0
mov rax, 0
sub [rsi], 1
sum:
cmp r12, rsi
je done

add rax, [rdi + r12 * 4]
inc r12
jmp sum



done:
ret




