print_string:
pusha
keep_printing: 
mov al, [bx]
mov ah, 0x0e
int 0x10
add bx, 1
cmp al, 0
jne keep_printing
popa
ret

print_reverse_string:
pusha
; count size
mov dx, bx
sub dx, 1

keep_counting: 
mov al, [bx]
add bx, 1
cmp al, 0
jne keep_counting
sub bx, 2

keep_reverse_printing: 
mov al, [bx]
mov ah, 0x0e
int 0x10
sub bx, 1
cmp dx, bx
jne keep_reverse_printing
popa
ret