.model small
.stack 100h
.data
.code
main proc

    mov al, 7
    mov bl, 1
    add al, bl      ; register addressing

    add al, 30h

    mov dl, al
    mov ah, 2
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main
