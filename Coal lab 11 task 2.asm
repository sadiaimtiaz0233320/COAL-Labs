.model small
.stack 100h

.data
msg_input  db 0Dh, 0Ah, 'Enter string: $'
msg_pal    db 0Dh, 0Ah, 'PALINDROME', 0Dh, 0Ah, '$'
msg_notpal db 0Dh, 0Ah, 'NOT PALINDROME', 0Dh, 0Ah, '$'
input_str  db 20, ?, 20 dup('$')

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Get input
    mov dx, offset msg_input
    mov ah, 09h
    int 21h
    
    mov dx, offset input_str
    mov ah, 0Ah
    int 21h
    
    ; Push all characters to stack (excluding CR)
    mov cl, input_str[1]  ; Length
    mov ch, 0
    mov si, 2             ; Start of actual string
    
push_all:
    cmp cx, 0
    je compare_pal
    
    mov al, input_str[si]
    cmp al, 0Dh           ; Ignore carriage return
    je skip_cr
    
    push ax               ; Push character
skip_cr:
    inc si
    dec cx
    jmp push_all

compare_pal:
    ; Reset for comparison
    mov cl, input_str[1]
    mov ch, 0
    mov si, 2
    
check_loop:
    cmp cx, 0
    je is_palindrome
    
    mov al, input_str[si] ; Get original char
    cmp al, 0Dh
    je skip_orig
    
    pop bx                ; Pop from stack
    cmp al, bl            ; Compare
    jne not_palindrome
    
skip_orig:
    inc si
    dec cx
    jmp check_loop

is_palindrome:
    mov dx, offset msg_pal
    jmp print_result

not_palindrome:
    mov dx, offset msg_notpal

print_result:
    mov ah, 09h
    int 21h
    
    mov ah, 4Ch
    int 21h

main endp
end main