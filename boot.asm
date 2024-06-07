diskNum:
    db 0 
    mov [diskNum], dl
mov ah, 2
mov al, 1
mov ch, 0
mov cl, 2
mov dh, 0
mov dl, [diskNum]
mov bx, 0
mov es, bx
mov bx, 0x7e00
int 0x13
mov ah, 0x0e
mov al, [0x7e00]
int 0x10
jmp $
times 510-($-$$) db 0
db 0x55, 0xaa