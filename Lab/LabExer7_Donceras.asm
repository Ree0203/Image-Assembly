.model small
.stack 100h

.data

cr equ 13
lf equ 10

a db "A", cr, lf, "$"
b db "B", cr, lf, "$"
c db "C", cr, lf, "$"
d db "D", cr, lf, "$"
e db "E", cr, lf, "$"
f db "F$"


.code
MAIN: 
    mov ax, @data
    mov ds, ax

    ;A
    mov dx, OFFSET a
    mov ah, 9
    int 21h

    ;B
    mov dx, OFFSET b
    mov ah, 9
    int 21h

    ;C
    mov dx, OFFSET c
    mov ah, 9
    int 21h

    ;D
    mov dx, OFFSET d
    mov ah, 9
    int 21h

    ;E 
    mov dx, OFFSET e
    mov ah, 9
    int 21h

    ;F
    mov dx, OFFSET f
    mov ah, 9
    int 21h 
        
    mov ax, 4c00h
    int 21h
END MAIN

END