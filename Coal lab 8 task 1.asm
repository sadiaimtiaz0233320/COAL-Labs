 .model small
.stack 100h

.data
    msg1 db 0dh, 0ah, 'Reverse Digits: $'  ; Title + newline
    newline db 0dh, 0ah, '$'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Print title
    mov ah, 09h
    mov dx, offset msg1
    int 21h
    
    ; ================================
    ; TASK 1: Print 9 to 0 (REVERSE)
    ; ================================
    mov cx, 10          ; Loop counter (10 digits: 9,8,7,6,5,4,3,2,1,0)
    mov bl, 9           ; Start from 9
    
print_reverse:
    mov dl, bl          ; Move current digit to DL
    add dl, 30h         ; Convert to ASCII ('0' = 30h)
    mov ah, 02h         ; Print character function
    int 21h             ; DOS interrupt - print DL
    
    dec bl              ; KEY: DEC instead of INC (9?8?7?...?0)
    loop print_reverse  ; CX auto-decrements, jump if CX != 0
    
    ; Print newline
    mov ah, 09h
    mov dx, offset newline
    int 21h
    
    ; Exit program
    mov ah, 4ch
    int 21h
main endp
end main
 