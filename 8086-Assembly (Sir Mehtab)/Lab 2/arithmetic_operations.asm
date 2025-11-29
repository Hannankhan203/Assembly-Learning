.model small
.stack 100h
.data
    msg1 db 'Enter first number: $'
    msg2 db 13, 10, 'Enter second number: $'
    addMsg db 13, 10, 'Addition: $'
    subMsg db 13, 10, 'Subtraction: $'
    mulMsg db 13, 10, 'Multiplication: $'
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
    lea dx, newline
    int 21h
    
    call Addition
    call Subtraction
    call Multiplication
    
    mov ah, 4ch
    int 21h
main endp

Addition proc
    mov ah, 9
    lea dx, addMsg
    int 21h
    
    mov al, num1
    add al, num2
    mov result, al
    
    call DisplayNumber
    ret
Addition endp

Subtraction proc
    mov ah, 9
    lea dx, subMsg
    int 21h
    
    mov al, num1
    cmp al, num2
    jl negative_result
    
    sub al, num2
    mov result, al
    call DisplayNumber
    jmp subtraction_done
    
negative_result:
    mov dl, '-'
    mov ah, 2
    int 21h
    
    mov al, num2
    sub al, num1
    mov result, al
    call DisplayNumber
subtraction_done:
    ret
Subtraction endp

Multiplication proc
    mov ah, 9
    lea dx, mulMsg
    int 21h
    
    mov al, num1
    mul num2
    mov result, al
    
    call DisplayNumber
    ret
Multiplication endp

DisplayNumber proc
    mov al, result
    mov ah, 0
    mov bl, 10
    div bl
    
    mov bh, ah
    
    cmp al, 0
    je skipFirstDigit
    mov dl, al
    add dl, 30h
    mov ah, 2
    int 21h
    
skipFirstDigit:
    mov dl, bh
    add dl, 30h
    mov ah, 2
    int 21h
    ret
DisplayNumber endp

end main