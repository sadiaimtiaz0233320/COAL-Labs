.model small
.stack 100h
.data
num1 db 3
num2 db 6
result db ?

.code
main proc

    mov ax, @data
    mov ds, ax

    mov al, num1      ; direct addressing
    add al, num2      ; direct addressing

    mov result, al    ; store result in memory

    add al, 30h       ; convert to ASCII

    mov dl, al
    mov ah, 2
    int 21h           ; display result

    mov ah, 4ch
    int 21h

main endp
end main
