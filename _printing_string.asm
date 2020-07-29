org 0x7c00

mov bx, my_string 

not_equal:
mov al, [bx]
mov ah, 0x0e
int 0x10
add bx, 1
cmp al, 0 
jne not_equal

jmp $
 

my_string:
db 'My name is Salman Estyak',0

times 510 - ($-$$) db 0
dw 0xAA55