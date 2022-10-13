; ;// ;Program name: "SumArrayIO".

; // Author name: Victor Mercado
; // Author email: vmercado29@csu.fullerton.edu
; //     October 13, 2022
; //     Section ID : Section 7  | Section TuTh 8 - 10am

extern printf
extern scanf
extern isfloat

global input_array

segment .data

enter_prompt db "Please enter integers separated by ws and press <enter><control+d> to terminate inputs.", 10, 0
good_input db "Good input.", 10, 0

float_format db "%lf", 0

segment .bss  ;Reserved for uninitialized data

segment .text ;Reserved for executing instructions.

input_array:

;Prolog ===== Insurance for any caller of this assembly module ========================================================
;Any future program calling this module that the data in the caller's GPRs will not be modified.
push rbp
mov  rbp,rsp
push rdi                                             
push rsi                                             
push rdx                                             
push rcx                                             
push r8                                              
push r9                                              
push r10                                             
push r11                                             
push r12                                             
push r13                                             
push r14                                            
push r15                                             
push rbx                                             
pushf                                                

push qword 0 ;staying on the boundary

; Taking information from parameters
mov r15, rdi  ; This holds the first parameter (the array address)
mov r14, rsi  ; This holds the second parameter (the size of array)

;Prompts:
;"Please enter floating point numbers separated by ws,"
;"When finished press enter followed by Cntrl+D."
push qword 0
mov rax, 0
mov rdi, enter_prompt
call printf
pop rax


; let user enter numbers until cntrl + d is entered
; this for loop will go to 6, the chosen array size, or end once cntrl d is pressed.
mov r13, 0 ; for loop counter
beginLoop:
  cmp r14, r13 ; we want to exit loop when we hit the size of array
  je outOfLoop
  mov rax, 0
  mov rdi, float_format
  push qword 0
  mov rsi, rsp
  call scanf
  cdqe
  
  mov rax, 0
  mov rdi, rsp
  call isfloat
  cmp rax, 0
  pop r12
  je beginLoop
  jl outOfLoop

;   cmp rax, -1  ; loop termination condition: user enters cntrl + d.
;   je outOfLoop
  mov [r15 + 8*r13], r12  ;at array[counter], place the input number
  inc r13  ;increment loop counter
  jmp beginLoop
outOfLoop:

pop rax ; counter push at the beginning
mov rax, r13  ; store the number of things in the aray from the counter of for loop

;===== Restore original values to integer registers ===================================================================
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