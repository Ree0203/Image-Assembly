.MODEL SMALL
.STACK 100h

; ============================================================
; REUSABLE MACRO: draw_rectangle
; ============================================================
; Usage: draw_rectangle x_start, y_start, color, height, width
; ============================================================
draw MACRO x, y, color, height, width
    LOCAL row_loop, col_loop

    MOV CX, x
    MOV DX, y
    MOV AL, color
    MOV SI, height
    
row_loop:
    PUSH CX
    MOV DI, width
col_loop:
    MOV AH, 0Ch
    INT 10h

    INC CX
    DEC DI
    JNZ col_loop

    POP CX
    INC DX
    DEC SI
    JNZ row_loop
ENDM

.DATA
red       EQU 28h 
yellow    EQU 0Eh
dorange   EQU 41
orange    EQU 2Ah
vga_orange EQU 2Ah  
grey      EQU 08h
lightgrey EQU 7     
black     EQU 0
white     EQU 0Fh   

.CODE
START:
    MOV AX, 13h
    INT 10h
    
    ;outer rectangle
    draw 0, 0, white, 200, 320

    ; ===== WHITE BACKGROUND =====
    draw 35, 10, white, 180, 250
    
    ;outline
    draw 95, 10, black, 10, 40
    draw 85, 20, black, 10, 10
    draw 135, 20, black, 10, 10
    draw 75, 30, black, 20, 10
    draw 145, 30, black, 20, 10 
    draw 65, 50, black, 10, 10
    draw 155, 50, black, 20, 10
    draw 55, 60, black, 30, 10
    draw 65, 90, black, 10, 10
    draw 75, 100, black, 10, 20
    draw 95, 110, black, 10, 20
    draw 105, 120, black, 20, 10
    draw 95, 140, grey, 10, 10
    draw 105, 140, lightgrey, 10, 10
    draw 115, 140, grey, 10, 10
    draw 105, 150, grey, 10, 30
    draw 135, 160, grey, 10, 30
    draw 145, 170, grey, 10, 10
    draw 155, 180, grey, 10, 30
    draw 165, 70, black, 20, 10
    draw 175, 90, black, 10, 10
    draw 185, 100, black, 20, 10
    draw 195, 110, black, 30, 10
    draw 205, 100, black, 10, 10
    draw 215, 80, black, 20, 10
    draw 205, 50, black, 30, 10
    draw 215, 20, black, 30, 10
    draw 225, 10, black, 10, 10
    draw 235, 20, black, 10, 10
    draw 245, 30, black, 20, 10
    draw 255, 50, black, 30, 10
    draw 245, 80, black, 10, 10
    draw 235, 90, black, 20, 10
    draw 225, 110, black, 20, 10
    draw 215, 130, black, 10, 10
    draw 195, 140, grey, 10, 20
    draw 185, 150, grey, 10, 20
    draw 175, 160, grey, 10, 20
    draw 185, 170, grey, 10, 10
    draw 115, 110, grey, 10, 10
    draw 145, 110, black, 10, 10
    draw 135, 120, black, 10, 10
    draw 145, 130, black, 10, 10
    draw 155, 130, grey, 10, 10

    ; main body color (main)
    draw 65, 60, vga_orange, 30, 10
    draw 75, 50, vga_orange, 40, 10
    draw 85, 30, vga_orange, 70, 10
    draw 95, 20, vga_orange, 80, 10
    draw 105, 20, vga_orange, 80, 10
    draw 115, 20, vga_orange, 80, 10
    draw 125, 30, vga_orange, 70, 10
    draw 135, 40, vga_orange, 30, 10
    draw 145, 120, orange, 10, 20
    draw 215, 100, orange, 30, 10
    draw 225, 90, orange, 20, 10

    ;eye 
    draw 105, 60, black, 30, 20
    draw 105, 60, white, 10, 10

    ;shadows
    draw 75, 90, dorange, 10, 10
    draw 95, 100, dorange, 10, 90
    draw 125, 90, dorange, 10, 50
    draw 135, 80, dorange, 10, 30
    draw 135, 70, dorange, 10, 30
    draw 145, 50, dorange, 20, 10
    draw 125, 20, dorange, 10, 10
    draw 135, 30, dorange, 10, 10
    draw 125, 110, dorange, 10, 20
    draw 155, 110, dorange, 10, 30
    draw 165, 120, dorange, 10, 30
    draw 165, 130, dorange, 10, 30
    draw 155, 140, dorange, 10, 40
    draw 155, 150, dorange, 10, 30
    draw 165, 160, dorange, 20, 10
    draw 205, 110, dorange, 30, 10

    ;belly 
    draw 115, 120, yellow, 10, 20
    draw 115, 130, yellow, 10, 30
    draw 125, 140, yellow, 10, 30
    draw 135, 150, yellow, 10, 20

    ;flame
    draw 225, 70, yellow, 20, 10
    draw 235, 60, yellow, 20, 10
    draw 235, 80, grey, 10, 10
    draw 215, 50, dorange, 30, 10
    draw 225, 20, dorange, 40, 10
    draw 235, 30, dorange, 20, 10
    draw 245, 50, dorange, 30, 10
    draw 225, 60, orange, 10, 10
    draw 235, 50, orange, 10, 10

    ; Wait for key press
    XOR AH, AH
    INT 16h
    
    ; Return to text mode and exit
    MOV AX, 3
    INT 10h
    MOV AX, 4C00h
    INT 21h

END START