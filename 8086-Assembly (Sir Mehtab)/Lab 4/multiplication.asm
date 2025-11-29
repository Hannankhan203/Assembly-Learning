.model small
.stack 100h
.data
    msg1 db 'Enter first number: $'
    msg2 db 13, 10, 'Enter second number: $'
    resultMsg db 13, 10, 'Multiplication Result: $'
    newline db 13, 10, '$'
    num1 db ?
    num2 db ?
    result db ?
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
    mov num1, al
    
    mov ah, 9
    lea dx, msg2
    int 21h
    
    mov ah, 1
    int 21h
    sub al, 30h
    mov num2, al
    
    mov ah, 9
    lea dx, resultMsg
    int 21h
    
    mov al, num1
    mul num2
    mov result, al
    
    mov al, result
    mov ah, 0
    mov bl, 10
    div bl
    
    mov bh, ah
    
    cmp al, 0
    je single_digit
    
    mov dl, al
    add dl, 30h
    mov ah, 2
    int 21h
    
single_digit:
    mov dl, bh
    add dl, 30h
    mov ah, 2
    int 21h
    
    mov ah, 9
    lea dx, newline
    int 21h
    
    mov ah, 4ch
    int 21h
main endp
end main