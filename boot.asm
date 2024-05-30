[org 0x7c00]
mov ah, 0x0e
mov bx, string

print:
    mov al, [bx]
    cmp al, 0
    je exit
    int 0x10
    inc bx
    jmp print

exit:
    jmp $

string:
    db "Hello World", 0

times 510-($-$$) db 0
db 0x55, 0xaa