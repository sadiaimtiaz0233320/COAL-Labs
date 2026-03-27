 .model small
.stack 100h

.data
    msg1 db 0dh, 0ah, 'Task 3 - A to Z:$'    ; Title
    newline db 0dh, 0ah, '$'                 ; HINT: CR+LF for new line

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Print title
    mov ah, 09h
    mov dx, offset msg1
    int 21h
    
    ; ================================
    ; TASK 3: Print A-Z (New Line Each)
    ; ================================
    mov cx, 26          ; 26 letters (A-Z)
    mov dl, 'A'         ; Start from 'A' (ASCII 41h)
    
print_alphabet:
    ; Print current letter
    mov ah, 02h
    int 21h             ; Print DL (current letter)
    
    ; Print newline (HINT USED!)
    mov ah, 09h
    mov dx, offset newline
    int 21h             ; New line after each letter
    
    inc dl              ; Next letter (A?B?C...)
    loop print_alphabet ; CX--, jump if CX?0
    
    ; Exit
    mov ah, 4ch
    int 21h
main endp
end main