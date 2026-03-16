.model small
.stack 100h
.data
    num dw 0
    quotient dw 0
    remainder dw 0
    msg1 db 'Enter number: $'
    msg2 db 0Dh, 0Ah, 'Quotient = $'
    msg3 db 0Dh, 0Ah, 'Remainder = $'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Input number
    lea dx, msg1
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    mov num, ax

    ; divide number by 10
    mov ax, num
    mov bx, 10
    xor dx, dx
    div bx

    mov quotient, ax
    mov remainder, dx

    ; Display quotient
    lea dx, msg2
    mov ah, 09h
    int 21h
    mov ax, quotient
    call display_num

    ; Display remainder
    lea dx, msg3
    mov ah, 09h
    int 21h
    mov ax, remainder
    call display_num

    mov ah, 4Ch
    int 21h

main endp

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