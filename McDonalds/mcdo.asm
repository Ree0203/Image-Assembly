.MODEL SMALL
.STACK 100h

; MACRO: draw_rectangle
; Draws a filled rectangle using BIOS INT 10h
; Parameters:
;   X1, Y1 : Top-left corner
;   X2, Y2 : Bottom-right corner
;   COLOR  : Palette color byte
draw_rectangle MACRO x1, y1, x2, y2, color
    LOCAL row_loop, col_loop
    mov cx, x1          ; Starting X
row_loop:
    mov dx, y1          ; Starting Y
col_loop:
    mov al, color       ; Color
    mov ah, 0Ch         ; BIOS function: Write Graphics Pixel
    mov bh, 0           ; Page number
    int 10h             ; Call BIOS

    inc dx              ; Move to next row
    cmp dx, y2          ; Check if we hit Y2
    jle col_loop        ; If not, keep drawing column

    inc cx              ; Move to next column
    cmp cx, x2          ; Check if we hit X2
    jle row_loop        ; If not, keep drawing rows
ENDM

.DATA

.CODE
START:
    mov ax, @data
    mov ds, ax

    ; Switch to VGA Mode 13h (320x200, 256 colors)
    mov ax, 0013h
    int 10h

    ; Draw Background (Red)
    ; Mode 13h color 28 (0x1C) is solid red
    draw_rectangle 0, 0, 319, 199, 28

    ; Draw Golden Arches (Yellow - Color 14)
    
    ; --- LEFT ARCH ---
    draw_rectangle  90,  70, 105, 150, 14
    draw_rectangle 100,  55, 115,  75, 14
    draw_rectangle 110,  45, 135,  60, 14
    draw_rectangle 125,  40, 145,  50, 14
    draw_rectangle 140,  45, 155,  65, 14
    draw_rectangle 148,  60, 158,  90, 14
    draw_rectangle 152,  80, 162, 150, 14

    ; --- RIGHT ARCH ---
    draw_rectangle 158,  80, 168, 150, 14
    draw_rectangle 162,  60, 172,  90, 14
    draw_rectangle 165,  45, 180,  65, 14
    draw_rectangle 175,  40, 195,  50, 14
    draw_rectangle 185,  45, 210,  60, 14
    draw_rectangle 205,  55, 220,  75, 14
    draw_rectangle 215,  70, 230, 150, 14

    ; Red Negative-Space Overlays (Cutouts)
    draw_rectangle 106,  75, 137, 150, 28
    draw_rectangle 116,  61, 137,  75, 28
    
    draw_rectangle 183,  75, 214, 150, 28
    draw_rectangle 183,  61, 204,  75, 28

    ; Wait for a key press
    mov ah, 00h
    int 16h

    ; Restore original Text Mode (Mode 03h)
    mov ax, 0003h
    int 10h

    ; Exit program cleanly via DOS function 4Ch
    mov ax, 4C00h
    int 21h

END START