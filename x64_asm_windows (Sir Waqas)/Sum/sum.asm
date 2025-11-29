default rel
extern printf
global main
section .data
fmt db "Result is %d",10,0
section .text
main:
mov ax,2
add ax,2
mov bx,3
add bx,3
add bx,3
add bx,ax
sub bx,5
lea rcx ,[rel fmt]
movzx rdx,bx
call printf

ret