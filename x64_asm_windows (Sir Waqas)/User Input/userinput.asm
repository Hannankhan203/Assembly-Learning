default rel
extern printf, scanf
global main
section .data
msg1 db "Enter your 1st number",0
msg2 db "Enter your 2nd  number",0
msg3 db "add of both number is %d",10,0
fmt db "%d",0


section .bss
num1 resd 1
num2 resd 1
section .text

main :

lea rcx,[rel msg1]
call printf

lea rcx,[rel fmt]
lea rdx,[rel num1]
call scanf




lea rcx,[rel msg2]
call printf

lea rcx,[rel fmt]
lea rdx,[rel num2]
call scanf

mov eax,[num1]
mov ebx,[num2]
add eax,ebx

lea rcx,[rel msg3]
mov edx,eax

call printf
ret