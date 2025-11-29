.model small
.stack 100h
.data
.code

main proc
    mov ah, 2
    mov cx, 256
    mov dl, 0
    
print:
    int 21h
    
    mov bl, dl
    mov dl, 32
    int 21h
    mov dl, bl
    
    inc dl
    dec cx
    jnz print
    
    mov ah, 4ch
    int 21h
main endp
end main