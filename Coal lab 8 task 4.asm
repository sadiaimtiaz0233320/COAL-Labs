.model small
.stack 100h

.data
    msg1 db 0dh, 0ah, 'Task 4 - Even Numbers: $'  ; Title
    space db ' ', '$'                              ; Space between numbers
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
    ; TASK 4: Print 0 2 4 6 8
    ; ================================
    mov cx, 5           ; 5 even numbers
    mov dl, 0           ; Start from 0
    
print_even:
    push dx             ; Save original DL (number value)
    
    ; Convert to ASCII and print
    mov dh, dl          ; Copy to DH (temp)
    add dh, 30h         ; Convert binary ? ASCII ('0'=30h)
    mov dl, dh          ; Move ASCII to DL
    mov ah, 02h
    int 21h             ; Print number
    
    pop dx              ; Restore original DL (number value)
    
    ; Print space
    mov ah, 09h
    mov dx, offset space
    int 21h
    
    add dl, 2           ; HINT: Increment by 2 (0?2?4?6?8)
    loop print_even     ; CX--, jump if CX?0
    
    ; Final newline
    mov ah, 09h
    mov dx, offset newline
    int 21h
    
    ; Exit
    mov ah, 4ch
    int 21h
main endp
end main