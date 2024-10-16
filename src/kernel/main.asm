org 0x7C00
bits 16

%define ENDL 0x0D, 0x0A 

start:
    jmp main

; print function
; Parameters: 
;   - ds:si points to starting memory adress of string 
puts:
    push si
    push ax

.loop:
    lodsb         ; loads next character in al
    or al, al     ; verify if next character is null (meaning the end of the string)
    jz .done

    mov ah, 0x0e  ; call bios interrupt
    mov bh, 0
    int 0x10      ; interrupt #10

    jmp .loop

.done:
    pop ax
    pop si
    ret    


main:
    ; set up data segments 
    mov ax, 0
    mov ds, ax
    mov es, ax

    ; set up stack
    mov ss, ax
    mov sp, 0x7C00 ; Stack grows downward from where we are loaded in memory so it doesn't overwrite the OS

    ; print message
    mov si, msg_hello
    call puts

    hlt

.halt:
    jmp .halt


msg_hello: db 'Hello World', ENDL, 0

times 510-($-$$) db 0
dw 0AA55h