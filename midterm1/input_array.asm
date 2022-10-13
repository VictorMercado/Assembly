; ;// ;Program name: "SumArrayIO".

; // Author name: Victor Mercado
; // Author email: vmercado29@csu.fullerton.edu
; //     October 13, 2022
; //     Section ID : Section 7  | Section TuTh 8 - 10am

extern printf
extern scanf
extern isfloat
extern atof

global input_array

segment .data

enter_prompt db "Please enter integers separated by ws and press <enter><control+d> to terminate inputs.", 10, 0
good_input db "Good input.", 10, 0
string_form db "%s" , 0 ; string type
float_format db "%lf", 0


segment .bss  ;Reserved for uninitialized data

segment .text ;Reserved for executing instructions.

input_array:

; backup
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

push qword 0 ; boundry

; Taking information from parameters
mov r15, rdi  ; This holds the first parameter (the array address)
mov r14, rsi  ; This holds the second parameter (the size of array)


push qword 0
mov rax, 0
mov rdi, enter_prompt
call printf
pop rax


; let user enter numbers until cntrl + d is entered

mov r13, 0 ; for loop counter
beginLoop:
  cmp r14, r13 ; we want to exit loop when we hit the size of array
  je outOfLoop
  mov rax, 0
;   mov rdi, float_format
  mov rdi, string_form
  push qword 0
  mov rsi, rsp
  call scanf    ; if user enters a non-integer, scanf will return 0
;   cdqe
  cmp rax, -1  ; loop termination condition: user enters cntrl + d.
  je outOfLoop

  mov rax, 0
  mov rdi, rsp
  call isfloat          ; is expecting a string
  cmp rax, 0
  je beginLoop
  
  mov rdi, good_input
  call printf

  mov rax, 0
  mov rdi, rsp
  call atof             ; convert string to double
  pop rax

  movsd [r15 + 8*r13], xmm0  ;at array[counter], place the input number
  inc r13  ;increment loop counter
  jmp beginLoop
outOfLoop:

pop rax ; counter push at the beginning

mov rax, r13  


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