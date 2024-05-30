mov ah, 0x0e
mov al, 65
int 0x10

low:
    inc al
    cmp al, 91
    je exit
    add al, 32
    int 0x10
    jmp high


high:
    sub al, 32
    inc al
    cmp al, 91
    je exit
    int 0x10
    jmp low

exit:
    jmp $
times 510-($-$$) db 0
db 0x55, 0xaa