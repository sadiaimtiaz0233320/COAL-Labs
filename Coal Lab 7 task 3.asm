.model small
.stack 100h
.data
    length dw 0
    breadth dw 0
    area dw 0
    msg1 db 'Enter length: $'
    msg2 db 'Enter breadth: $'
    msg3 db 'Area = $'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Input length
    lea dx, msg1
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    mov length, ax

    ; Input breadth
    lea dx, msg2
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    mov breadth, ax

    ; Calculate area = length * breadth
    mov ax, length
    mov bx, breadth
    mul bx
    mov area, ax

    ; Display area
    lea dx, msg3
    mov ah, 09h
    int 21h
    
    ; Display area value
    mov ax, area
    call display_num

    mov ah, 4Ch
    int 21h

main endp

; Subroutine to display number in AX
display_num proc
    push ax
    push bx
    push cx
    push dx

    mov cx, 0
    mov bx, 10

next_digit:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz next_digit

print_loop:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_loop

    pop dx
    pop cx
    pop bx
    pop ax
    ret
display_num endp

end main