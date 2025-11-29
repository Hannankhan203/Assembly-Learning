.model small
.stack 100h
.data
    newline db 13, 10, '$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 1
    
print_odd:
    mov ax, cx
    mov bl, 2
    div bl
    
    cmp ah, 0
    je skip_print
    
    mov ax, cx
    mov bl, 10
    div bl
    
    mov bh, ah
    
    cmp al, 0
    je print_single
    mov dl, al
    add dl, 30h
    mov ah, 2
    int 21h
    
print_single:
    mov dl, bh
    add dl, 30h
    mov ah, 2
    int 21h
    
    mov dl, ' '
    int 21h
    
skip_print:
    inc cx
    cmp cx, 100
    jle print_odd
    
    mov ah, 9
    lea dx, newline
    int 21h
    
    mov ah, 4ch
    int 21h
main endp
end main