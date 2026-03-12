.model small
.stack 100h
.data
    fullname db "SADIA IMTIAZ", 13, 10, '$'
    sapid db "SAP Id:  69199", 13, 10, '$'
    batch db "Batch: 2025", 13, 10, '$'
    program_semester db "Program:  Software Engineering - Sem 3", 13, 10, '$'

.code
start:
    mov ax, @data
    mov ds, ax

    ; print fullname
    lea dx, fullname
    mov ah, 09h
    int 21h

    ; print sapid
    lea dx, sapid
    mov ah, 09h
    int 21h

    ; print batch
    lea dx, batch
    mov ah, 09h
    int 21h

    ; print program_semester
    lea dx, program_semester
    mov ah, 09h
    int 21h

    ; exit program
    mov ah, 4Ch
    int 21h
end start