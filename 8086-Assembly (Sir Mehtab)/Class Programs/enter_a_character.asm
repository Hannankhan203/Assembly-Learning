.model small
.stack 100h
.data
    prompt db 'Enter a character: $'
    output_msg db 0Dh, 0Ah, 'You entered: $'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h
    lea dx, prompt
    int 21h
    
    mov ah, 01h
    int 21h
    mov bl, al
    
    mov ah, 09h
    lea dx, output_msg
    int 21h
    
    mov ah, 02h
    mov dl, bl
    int 21h
    
    mov ah, 4ch
    int 21h
main endp
end main