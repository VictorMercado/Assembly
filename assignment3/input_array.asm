extern printf
extern scanf

global fill

segment .data

enter_prompt db "Please enter up to 6 floating point numbers separated by ws,", 10, 0
enter_prompt_two db "When finished press enter followed by Cntrl+D.", 10, 0
float_format db "%lf", 0

segment .bss  ;Reserved for uninitialized data

segment .text ;Reserved for executing instructions.

fill:
