.model small
.stack 100h

.data
    cr equ 13
    lf equ 10
    banner db "==========================================================", cr, lf
           db "                HELLO!", cr, lf
           db "THIS                 IS", cr, lf
           db "                     LABORATORY 8", cr, lf
           db "==========================================================", cr, lf, "$"

.code
MAIN:
    mov ax, SEG banner
    mov ds, ax

    mov dx, OFFSET banner
    mov ah, 9
    int 21h

    ; Exit program cleanly
    mov ax, 4c00h
    int 21h

END MAIN