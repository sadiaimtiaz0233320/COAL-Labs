 .model small
.stack 100h

.data
    msg1 db 0dh, 0ah, 'Task 2 - Stars: $'   ; Title + newline
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
    ; TASK 2: Print ***** (5 Stars)
    ; ================================
    mov cx, 5           ; Loop counter (5 stars)
    
print_stars:
    mov dl, '*'         ; ASCII '*' = 2Ah
    mov ah, 02h         ; Print character function
    int 21h             ; DOS interrupt - print DL
    loop print_stars    ; CX auto-decrements, jump if CX != 0
    
    ; Print newline
    mov ah, 09h
    mov dx, offset newline
    int 21h
    
    ; Exit program
    mov ah, 4ch
    int 21h
main endp
end main