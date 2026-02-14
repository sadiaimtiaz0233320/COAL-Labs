.model small
.stack 100h
.data
num1 db 3
num2 db 6
.code
main proc

    mov al, num1     ; direct addressing
    add al, num2

    add al, 30h

    mov dl, al
    mov ah, 2
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
