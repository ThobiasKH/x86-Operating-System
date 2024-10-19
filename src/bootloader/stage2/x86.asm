bits 16

section _TEXT class=CODE

global _x86_VideoWriteCharTeletype
_x86_VideoWriteCharTeletype:
    push bp
    mov bp, sp

    push bx

    ; [bp + 2] - return adress
    ; [bp + 4] - arg1 character
    ; [bp + 6] - arg2 page num
    mov ah, 0Eh
    mov al, [bp + 4]
    mov bh, [bp + 6]

    int 10h

    pop bx

    mov sp, bp 
    pop bp
    ret
