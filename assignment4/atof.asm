base_number equ 10                      ;10 base of the decimal number system
ascii_zero equ 48                       ;48 is the ascii value of '0'
null equ 0
minus equ '-'
decimal_point equ '.'

;Global declaration for linking files.
global atof                          ;This makes atolong callable by functions outside of this file.

segment .data                           ;Place initialized data here
   ;This segment is empy

segment .bss                            ;Declare pointers to un-initialized space in this segment.
   ;This segment is empty

;==============================================================================================================================
;===== Begin the executable code here.
;==============================================================================================================================
segment .text                           ;Place executable instructions in this segment.

atof:                                ;Entry point.  Execution begins here.

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

;Designate the purpose of selected registers: r8, r9, r10
mov r8, rdi                   ;Copy the pointer to char data to r8
mov r9, 0                     ;r9 = array index
mov r10, 0                    ;r10 = long integer; final answer will be here.
xorpd xmm15, xmm15 ; Final answer float

;The first byte in the array may be '+' or '-', which are valid numeric characters.
;We need to check for the presence of a leading sign.
cmp byte [r8+1*0], '+'        ;Check for leading plus sign
jne next_comparison
mov r9, 1
jmp begin_loop

next_comparison:
cmp byte [r8+1*0], '-'        ;Check for leading minus sign
jne begin_loop

mov r9, 1

; '1235.23'
; 123523 -> integer -> cvtsi2sd into xmm register -> divide by 10 however many decimal places
; count 2 decimal places
mov r12, 0 ; num_decimal_places
mov r13, 0 ; This represents if we already decimal place (flag: hit_decimal_place)
begin_loop:
cmp byte [r8+1*r9], null      ;Check the termination condition of the loop
je loop_finished
; if we reach the decimal point
    ; check if equal
        ; move the index forward
        ; set hit_decimal_place = True
cmp byte [r8+1*r9], decimal_point
je HasDecimalPoint

mov rax, base_number
mul r10 ; rax = r10 * 10       mul rax,     r10, 1 on the second iteration
; r10 contains 12
; multiply 10 against 12 = 120
mov r10, rax ; second iteration r10 contains 1*10

;This is the instuction we want to perform: "add r10, byte [r8+1*r9]".  But the problem is that the
;sizes of operands do not match.  You cannot add a 1-byte number to an 8-byte number.  However, the
;problem can be fixed by using the extension instructions documented on page 77 of the Jorgensen textbook.
mov al, byte [r8+1*r9]        ;The 1-byte number has been copied to al (1-byte register)
cbw                           ;The 1-byte number in al has been extended to 2-byte number in ax
cwde                          ;The 2-byte number in ax has been extended to 4-byte number in eax
cdqe                          ;The 4-byte number in eax has been extended to 8-byte number in rax

; current char is placed into rax
; 1234.45
; 1234(T)4
; 123445 decimal_place = 2
; '1' - ascii character - 1 + 48 = 49
; '2' - ascii character - 2 + 48
; subtract 48 from the ascii character to get the actual number
;Now addition is possible
add r10, rax                  ;To students in 240 class: wasn't that simply great fun?
; 10 + 2 = 12
sub r10, ascii_zero           ;A declared constant is compatible with various sizes of registers; explained in Jorgensen.
jmp OverHasDecimalPoint
HasDecimalPoint:
; set decimal flag to true
mov r13, 1

OverHasDecimalPoint:
; check if flag: hit_decimal_place r13 is true
; increment decimal counter
cmp r13, 1
je IncrementDecimalCounter
jmp OverIncrementCounter
IncrementDecimalCounter:
inc r12
OverIncrementCounter:

inc r9
jmp begin_loop
loop_finished:


; 123445 decimal_place = 2 

; TODO: Place 123445 into GPR

; TODO: Convert GPR to XMM register
cvtsi2sd xmm15, r10

; TODO: Divide the XMM register the number of decimal places
; if r12 doesnt work use r15
sub r12, 1

mov rax, 10
cvtsi2sd xmm14, rax
; run for loop by r12 times to divide by 10 for each decimal place
mov r10, 0
loop2: 
    cmp r10, r12
    je endloop2

    ; divide by 10
    ; decrement r12
    ; check if r12 is 0
    ; if not, jump to loop2
    ; if 0, break
    ; divide by 10
    divsd xmm15, xmm14
    inc r10
    jmp loop2

endloop2:
; TODO: Return the answer in xmm0


;Set the computed value to negative if needed
cmp byte [r8+1*0], minus      ;Check for leading minus sign
jne positive
neg r10

positive:
mov rax, r10
movsd xmm0, xmm15
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
ret                           ;Pop a qword from the stack into rip, and continue executing..