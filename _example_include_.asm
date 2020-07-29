org 0x7c00

mov dx, 0xabc
call print_hex
jmp $

; data area
string_location:
db "This is amazing, always remember the memory layout, the table",0

; more assembly code 
%include "print_string.asm"

HEX_OUT: db 'XYZE', 0

;function parameter dx
; put hex value within dx
print_hex:
pusha
; manipulate valuable inside DX
; and write it in HEX_OUT
mov bx, HEX_OUT
process_hex:
mov ax , dx
cmp ax, 0
je all_done

and dx,	 0xF 
;; dx now has one hex digit
; if value between 0 and 9 add 48
; if value between A to F , add 65
;---if else code to get ascii values--
cmp dl, 10
jl add_48
; add 55 here.. so for 10 it becomes 55 + 10 = 65 = A
add dl, 55 
jmp else_done
add_48:
add dl, 48
else_done:
;---- generating ascii value---

mov [bx], dl 
add bx, 1
; putting ascii value in memory

;; restore dx
mov dx, ax
shr dx, 4

cmp ax, 0
jne process_hex
all_done:
mov  [bx], dl; adding null terminator  
mov bx, HEX_OUT

; adding  0x... 
mov ah, 0x0e
mov al, '0'
int 0x10

mov ah, 0x0e
mov al, 'x'
int 0x10

call print_reverse_string
popa
ret

times 510 - ($- $$) db 0
dw 0xAA55