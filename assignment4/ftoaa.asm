base_number equ 10                      ;10 base of the decimal number system
ascii_zero equ 48                       ;48 is the ascii value of '0'
null equ 0
minus equ '-'
decimal_point equ '.'

;Global declaration for linking files.
global ftoaa                          ;This makes atolong callable by functions outside of this file.

segment .data                           ;Place initialized data here
   ;This segment is empy
inputLabel db "Input: ", 0
lenInputLabel equ $-inputLabel

segment .bss                            ;Declare pointers to un-initialized space in this segment.
   ;This segment is empty
   ; [ 12.34, 23.5] resq (64 bits)
   ; ['a', 'b', 'c'] (8 bits (1 byte) per element)

;==============================================================================================================================
;===== Begin the executable code here.
;==============================================================================================================================
segment .text                           ;Place executable instructions in this segment.

ftoaa:                                ;Entry point.  Execution begins here.

;The next two instructions should be performed at the start of every assembly program.
push rbp                                ;This marks the start of a new stack frame belonging to this execution of this function.
mov  rbp, rsp                           ;rbp holds the address of the start of this new stack frame.
;The following pushes are performed for safety of the data that may already be in the remaining GPRs.
;This backup process is especially important when this module is called by another asm module.  It is less important when called
;called from a C or C++ function.
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
; save the arguments
mov rax, 1
mov rdi, 1
mov rsi, inputLabel
mov rdx, lenInputLabel
syscall
xor rax, rax
xor rdi, rdi
xor rsi, rsi
xor rdx, rdx

movsd xmm15, xmm0
; multiply by 10 until we get this -> 15623

xorpd xmm12, xmm12 ; just to have a 0.0 to compare
; 156.23 -> 15623
mov r11, 0
whileLoop:
    ; 156.23 - 156
    ; original_num - int_converted_num
    ; original_num - the original float is in xmm15
    cvtsd2si r15, xmm15 ; original_num
    cvtsi2sd xmm14, r15 ; int_converted_num
    
    movsd xmm13, xmm15
    subsd xmm13, xmm14 ; xmm13 = original_num - int_converted_num

    ucomisd xmm13, xmm12
    je OutOfLoop
    ; else
    mov rax, 10
    cvtsi2sd xmm11, rax
    ; 156.23 * 10 -> 1562.3
    mulsd xmm15, xmm11
    inc r11
    jmp whileLoop
OutOfLoop:


; 15623 as integer, r11 = 2
; 15623/10 = 1562 R3
; 1562/10 = 156 R2
; 15 R6
; 1 R5
; 0 R1

; counter for how many times you divided - r8
; convert 15623 to a integer
; continually divide by 10 until we reach 0.
; (use idiv (rdx the remainder, rax is the quotient))
; Take the modulus and add 48 to it to get the ascii value
; push onto the stack
; decrement r11
; when r11 is zero push a '.' in ascii on the stack
; do again until r11 = 0

; for i = r8:
;    pop the stack and place the character into the char array



; condition
; when "it" equals to zero


; printf("...")
; ftoa(float) -> string

; 156.23 -> "156.23"
; need an array DONE
; 156.23 
; multiply by 10 until we get this -> 15623
; 156.23-> 156 -> 156.0
; 156.23 - 156.0 = 0.23
; 1562.3 -> 1562
; 1562.3 - 1562 = 0.3
; 15623.0 - 15623.0 = 0
; 
;


; divide by how many places we moved decimal

; decimal point 156.23
; set a counter until we hit decimal point

; 156.23 - xmm15
; 56.23
; divide until under 10 - count how many times we divide
; 10^counter = 100
; 1.5623 = 1 (place into the array)
;
; 1506.23
; - 15
; 06.23
; 6.23


; 0.23 / 10 = 0 - once we hit this point, we are at a decimal
; [1, 5, 6]



; The rest of the numbers

; take something from xmm0 (float)


; end of the function -> return a string in rax
;==================================================================================================================================
;Epilogue: restore data to the values held before this function was called.
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
pop rbp                       ;Now the system stack is in the same state it was when this function began execution.
ret  