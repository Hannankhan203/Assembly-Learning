.model small
.stack 100h
.data
    month db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov dx, 266Ah
    mov ax, dx
    shr ax, 5
    and al, 00001111b
    mov month, al
    
    add month, al
    
    add month, 30h
    mov dl, month
    mov ah, 2
    int 21h
    
    mov ah, 4ch
    int 21h
main endp
end main