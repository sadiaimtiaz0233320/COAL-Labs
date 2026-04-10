.model small
.stack 100h

.data
str db 'HELLO WORLD$'        ; Input string
msg db 0Dh, 0Ah, 'Reversed words: $'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Print original string
    mov dx, offset str
    mov ah, 09h
    int 21h
    
    ; Print message
    mov dx, offset msg
    mov ah, 09h
    int 21h

    mov si, offset str

; ========= STEP 1: FIND END OF STRING =========
find_end:
    mov al, [si]
    cmp al, '$'          ; Is it end marker?
    je start_reverse
    inc si               ; Move to next char
    jmp find_end

; ========= STEP 2: START FROM END =========
start_reverse:
    dec si               ; Point to last char 'D'

; ========= STEP 3: MAIN LOOP - PROCESS EACH WORD BACKWARDS =========
reverse_loop:
    cmp si, offset str   ; Past beginning?
    jb done              ; Yes ? Exit

    mov cx, 0            ; CX = 0 (word length counter)

; ========= STEP 4: COUNT CHARACTERS IN CURRENT WORD =========
count_word:
    cmp si, offset str   ; Past start?
    jb push_word
    mov al, [si]         ; Get current char
    cmp al, ' '          ; Is it space?
    je push_word         ; Yes ? Word ends
    inc cx               ; CX++ (count char)
    dec si               ; Move backward
    jmp count_word

; ========= STEP 5: PUSH WORD CHARACTERS TO STACK =========
push_word:
    mov bx, cx           ; BX = word length
    mov di, si           ; DI = current position
    inc di               ; DI points to first char of word

push_chars:
    cmp bx, 0            ; All chars pushed?
    je print_word
    mov al, [di]         ; Get char
    mov ah, 0
    push ax              ; PUSH to stack
    inc di               ; Next char
    dec bx               ; BX--
    jmp push_chars

; ========= STEP 6: POP AND PRINT CHARACTERS =========
print_word:
    mov bx, cx           ; BX = word length again

print_chars:
    cmp bx, 0            ; All chars printed?
    je print_space
    pop dx               ; POP from stack
    mov ah, 2            ; Print char function
    int 21h              ; Print DL
    dec bx
    jmp print_chars

; ========= STEP 7: PRINT SPACE =========
print_space:
    mov dl, ' '          ; Space char
    mov ah, 2
    int 21h
    
    dec si               ; Move to next word
    jmp reverse_loop

done:
    mov ah, 4Ch
    int 21h

main endp
end main