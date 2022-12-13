global manager

extern printf
extern scanf

; extern getResistance
; extern loadArray



segment .data
single_float_format db "%f", 0

inputprompt db "Enter the resistance numbers of the two subcircuits separated by ws and press enter: ",0

three_float_format db "%lf%lf%lf",0

outputResistances db "These resistances were received: %.15lf Ω, %.15lf Ω, %.15lf Ω.",10,0
outputTotalR db "The resistance of the entire circuit is %.15lf Ω.", 10, 0

goodbye db "The total resistance will be returned to the caller module.",10,0



enterResistance1 db "Enter resistance on circuit 1: ", 0
enterResistanceLen equ $ - enterResistance1

enterResistance2 db "Enter resistance on circuit 2: ", 0
enterResistanceLen2 equ $ - enterResistance2

enterResistance3 db "Enter resistance on circuit 3: ", 0
enterResistanceLen3 equ $ - enterResistance3



msg db "hereeeeeeeeeeeeeeeeeeeeeeeeeee:",10, 0
msgLen equ $ - msg

; one dq 1.0

segment .bss
array resq 4

segment .text

manager:
;=========begin inputs for the 3 resistances===================

push rax
mov rax, 0
mov rdi, msg
mov rsi, msgLen
call printf
pop rax

; push rax
; mov rax, 0
; mov rdi, single_float_format
; mov rsi, array
; call scanf
; pop rax

; push qword 0
; ;Display a prompt message asking for the inputs
; mov rax, 0
; mov rdi, inputprompt         ;"Enter the resistance numbers of the two subcircuits separated by ws and press enter: "
; call printf
; pop rax




push qword 0
mov rax, 0
mov rdi, enterResistance1
mov rsi, enterResistanceLen
call printf
pop rax


push qword 0
mov rax, 0
mov rdi, single_float_format
mov rsi, array
call scanf
pop rax

push rax
mov rax, 0
mov rdi, msg
mov rsi, msgLen
call printf
pop rax

; mov rax,0
; mov rdi, enterResistance2
; mov rsi, enterResistanceLen2
; call printf

; push qword 0
; mov rax, 0
; mov rdi, single_float_format
; mov rsi, [r8 + 8]
; call scanf
; pop rax

; mov rax,0
; mov rdi, enterResistance3
; mov rsi, enterResistanceLen3
; call printf

; push qword 0
; mov rax, 0
; mov rdi, single_float_format
; mov rsi, [r8 + 16]
; call scanf
; pop rax




; void loadArray(array)
; push rax
; mov rax, 0
; mov rdi, array
; call loadArray
; pop rax

;Input the 3 resistances
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
; for int i = 0, i < 3, i++
; =============End input of 3 resistances===========

; ========== output the 3 resistances received =======










; push qword 0
; mov rax, 3
; mov rdi, outputResistances        ;"These resistances were received %.15lf, %.15lf, %.15lf..."
; movsd xmm0, [array]
; movsd xmm1, [array + 8]
; movsd xmm2, [array + 16]
; call printf
; pop rax

; double getResistance(array) -> xmm0



; mov rdi, array
; call getResistance
; movsd xmm11, xmm0






; ===========End output of 3 resistances==========

; =====Time to calculate the total resistance=======
; 1/r = 1/R1 + 1/R2 + 1/R3
; r = 1/(1/R1 + 1/R2 + 1/R3)
; first we need to add the resistances (each divided by 1.0)
; one declared in segment.data
; movsd xmm8, [one]
; movsd xmm9, [one]
; movsd xmm10, [one]
; ; doing 1/R1, 1/R2, 1/R3 and adding them, registers xmm5-7 contain our resistances
; divsd xmm8, xmm5
; divsd xmm9, xmm6
; divsd xmm10, xmm7
; ; adding them together, total will now be stored in xmm8
; addsd xmm8, xmm9
; addsd xmm8, xmm10
; ; doing 1/rTotal (stored in xmm11)
; movsd xmm11, [one]
; divsd xmm11, xmm8
; ============End of calculations==============

; ; =========== Output total resistance ===========
; push qword 0
; mov rax, 1
; mov rdi, outputTotalR
; movsd xmm0, xmm11
; call printf
; pop rax
; ; ========== end output total resistance =========

; ; =========== goodbyes ===============
; push qword 0
; mov rax, 0
; mov rdi, goodbye
; call printf
; pop rax
; ; =========== really goodbye now ============

; pop rax     ;counteract push at beginning of code

; movsd xmm0, xmm11
;===== Restore original values to integer registers ===================================================================
