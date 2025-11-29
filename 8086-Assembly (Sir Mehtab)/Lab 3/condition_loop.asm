.model small
.stack 100h
.data
    msg1 db 'Enter x: $'
    msg2 db 13, 10, 'Enter y: $'
    newline db 13, 10, '$'
    zero db '0$'
    x db ?
    y db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg1
    int 21h
    
    mov ah, 1
    int 21h
    sub al, 30h
    mov x, al
    
    mov ah, 9
    lea dx, msg2
    int 21h
    
    mov ah, 1
    int 21h
    sub al, 30h
    mov y, al
    
    mov ah, 9
    lea dx, newline
    int 21h
    
    mov al, x
    cmp al, 4
    jg else_part    
    
    mov al, y
    cmp al, 9
    jg else_part
    
    mov cl, 0
    
loop_start:
    cmp cl, x
    jge end_loop
    
    mov dl, x
    add dl, 30h
    mov ah, 2
    int 21h
    
    inc cl
    jmp loop_start
    
else_part:
    mov ah, 9
    lea dx, zero
    int 21h
    
end_loop:
    mov ah, 9
    lea dx, newline
    int 21h
    
    mov ah, 4ch
    int 21h
main endp
end main