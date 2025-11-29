default rel
extern printf
global main
section .data
fmt db "4 is less than 5",10,0
fmt1 db "5 is greater than 4",10,0
section .text
main:
    mov ax,2
    add ax,2
    mov bx,3
    add bx,3
    add bx,3
    cmp ax,bx
    jg greater
    lea rcx,[rel fmt]
    call printf
    jmp final
greater:
       lea rcx,[rel fmt1]
       call printf

final:
ret