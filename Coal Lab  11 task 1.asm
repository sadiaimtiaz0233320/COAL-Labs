.model small
.stack 100h

.data
msg1 db 0Dh, 0Ah, 'Total characters pushed: $'
count_msg db ' $'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 0          ; CX = Counter (as required)
    mov si, offset msg1 + 25  ; Point to count_msg for result
    
    ; Input string (manually for demo, replace with input if needed)
    mov dx, offset str
    mov ah, 09h
    int 21h
    
str_loop:
    mov al, str[bx]    ; Get character
    cmp al, '$'        ; End of string?
    je done_push
    
    ; Push character to stack
    mov ah, 0
    push ax            ; Push character
    inc cx             ; CX++ (counter increment)
    inc bx             ; Next character
    jmp str_loop

done_push:
    ; Store count in count_msg
    add cl, '0'        ; Convert to ASCII
    mov [si], cl
    
    ; Print result
    mov dx, offset msg1
    mov ah, 09h
    int 21h
    
    mov ah, 4Ch
    int 21h

str db 'HELLO$'

main endp
end main