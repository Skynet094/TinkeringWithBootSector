;
; A simple boot sector that prints a message to the screen using a BIOS routine.
;
ORG 0 

mov ah , 0x0e ; int 10/ ah = 0eh -> scrolling teletype BIOS routine
mov al , 'H'
int 0x10
mov al , 'e'
int 0x10
mov al , 'l'
int 0x10
mov al , 'l'
int 0x10
mov al , 'o'
int 0x10
jmp $ ; Jump to the current address ( i.e. forever ).
;
; Padding and magic BIOS number.
;
TIMES 510-($-$$) DB 0 
DW 0xAA55