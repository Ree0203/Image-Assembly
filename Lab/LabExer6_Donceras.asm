.model small
.stack 100h

.data
message db "Hello World$"
fname db "Ryan", 13, 10, "$"
lastName db "Donceras", 13, 10, "$"
studentnum db "202403622", 13, 10, "$"
course db "BSCS 2-3$"
.code
MAIN: 
    mov ax, SEG fname
    mov ds, ax

    ;first name
    mov dx, OFFSET fname
    mov ah, 9
    int 21h

    ;last name
    mov dx, OFFSET lastName
    mov ah, 9
    int 21h

    ;student number
    mov dx, OFFSET studentnum
    mov ah, 9
    int 21h

    ;course and section
    mov dx, OFFSET course
    mov ah, 9
    int 21h
    
    mov ax, 4c00h
    int 21h
END MAIN

END