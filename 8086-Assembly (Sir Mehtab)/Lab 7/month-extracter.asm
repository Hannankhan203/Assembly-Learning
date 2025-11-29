.model smapp
.stack 100h
.data
    date dw 2A2Ah
    month db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, date
    and ax, 01E0h
    mov cl, 5
    shr ax, cl
    mov month, al
    
    add month, 30h
    mov dl, month
    mov ah, 2
    int 21h
    
    mov ah, 4ch
    int 21h
main endp
end main