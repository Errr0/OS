mov sp, bp
input:
    mov ah, 0
    int 0x16
    cmp al, 13
    je go
    mov bh, al
    push bx
    jmp input

go:
    mov bh, 0
    push bx

mov ah, 0x0e
mov al, bh
int 0x10

pop bx

mov ah, 0x0e
mov al, bh
int 0x10


exit:
    jmp $
times 510-($-$$) db 0
db 0x55, 0xaa