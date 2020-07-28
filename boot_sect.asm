;
; A simple boot sector program that loops forever.
;

 ORG 0 

; some boot sector code 
loop : ; Define a label , " loop ", that will allow
; us to jump back to it , forever.
jmp loop ; Use a simple CPU instruction that jumps
; to a new memory address to continue execution.
; In our case , jump to the address of the current
; instruction.

TIMES 510-($-$$) DB 0 
DW 0xAA55