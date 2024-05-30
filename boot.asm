;[org 0x7c00]
buff:
    times 10 db 0
input:
    mov bx, buff
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
    mov bx, buff
    mov ah, 0x0e
print:
    mov al, [bx]
    int 0x10
    inc bx
    cmp al, 0
    je exit
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
