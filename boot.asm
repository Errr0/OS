[org 0x7c00]
string:
    times 5 db 0
    mov cl, '0'
input:
    mov bx, string
    mov ah, 0x00
    int 0x16
    mov [bx], al
    mov ah, 0x0e
    mov al, cl
    int 0x10
    inc bx
    inc cx
    cmp cx, 4
    je go
    jmp input
go:
    mov bx, string
    mov ah, 0x0e
    mov cl, 49
print:
    mov al, [bx]
    cmp al, 0
    je exit
    int 0x10
    mov al, cl
    int 0x10
    inc bx
    inc cx
    jmp print

; loop:
;     mov ah, 0x00
;     int 0x16         
;     mov ah, 0x0e
;     int 0x10
;     cmp al, 13
;     je exit
;     jmp loop
mov al, 40
int 0x10
exit:
    jmp $
times 510-($-$$) db 0
db 0x55, 0xaa