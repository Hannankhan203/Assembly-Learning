.model small
.stack 100h
.data
    msg db 'MASTER$'
.code
main proc
    mov ax, @data
    mov ds, ax
    lea si, msg
    mov cx, 6
    
label:
    mov al, [si]
    OR al, 00100000b
    mov dl, al
    mov ah, 2
    int 21h
    inc si
    loop label
    
    mov ah, 4ch
    int 21h
main endp
end main