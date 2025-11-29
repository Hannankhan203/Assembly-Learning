.model small
.stack 100h
.data
    msg db 'Enter a number: $'
    newline db 13, 10, '$'
    num db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg
    int 21h
    
    mov ah, 1
    int 21h
    sub al, 30h
    mov num, al
    
    mov ah, 9
    lea dx, newline
    int 21h
    
    mov cl, 1
    
printTable:
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    
    mov dl, num
    add dl, 30h
    int 21h
    
    mov dl, ' '
    int 21h
    mov dl, 'x'
    int 21h
    mov dl, ' '
    int 21h
    
    mov dl, cl
    add dl, 30h
    int 21h
    
    mov dl, ' '
    int 21h
    mov dl, '='
    int 21h
    mov dl, ' '
    int 21h
    
    mov al, num
    mov bl, cl
    mul bl
    
    mov bl, 10
    div bl
    
    mov bh, ah
    
    cmp al, 0
    je skip_tens
    mov dl, al
    add dl, 30h
    mov ah, 2
    int 21h
    
skip_tens:
    mov dl, bh
    add dl, 30h
    mov ah, 2
    int 21h
    
    inc cl
    cmp cl, 10
    jbe printTable
    
    mov ah, 4ch
    int 21h
main endp
end main