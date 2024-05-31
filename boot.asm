;[org 0x7c00]
string:
    db 0
    mov
input:
    mov bx, string
    mov ah, 0x00
    int 0x16
    mov ah, 0x0e
    int 0x10
    mov [bx], al
    inc bx
    cmp al, 13
    je go
    jmp input
go:
    mov bx, string
    mov ah, 0x0e
print:
    mov al, [bx]
    cmp al, 0
    je exit
    int 0x10
    inc bx
    jmp print

loop:
    mov ah, 0x00
    int 0x16         
    mov ah, 0x0e
    int 0x10
    cmp al, 13
    je exit
    jmp loop

exit:
    jmp $
times 510-($-$$) db 0
db 0x55, 0xaa