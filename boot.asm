GDT_Start:
    null_descriptor:
        dd 0
        dd 0
    code_descriptor:
        dw 0xffff
        dw 0
        dd 0
        db 10011010
        db 11001111
        db 0
    data_descriptor:
        dw 0xffff
        dw 0
        dd 0
        db 10010010
        db 11001111
        db 0
GDT_End:
    
GDT_Descriptor:
    dw GDT_End - GDT_Start - 1
    dd GDT_Start

CODE_SEG equ code_descriptor - GDT_Start
DATA_SEG equ data_descriptor - GDT_Start

cli
lgdt [GDT_Descriptor]

mov eax, cr0
or eax, 1
mov cr0, eax; yay, 32 bit mode!!
; far jump (jmp to other segment)
jmp CODE_SEG:start_protected_mode

[bits 32]
start_protected_mode:
    ; videoMemory = oxb8000
    ; first  byte: char
    ; second byte: colour
    mov al, 'A'
    mov ah, 0x0f ; white
    mov [0xb8000], ax
jmp $
times 510-($-$$) db 0
db 0x55, 0xaa