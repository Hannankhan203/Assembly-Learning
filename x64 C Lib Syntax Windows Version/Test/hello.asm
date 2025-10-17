; hello.asm - x64 NASM using C printf
extern printf                ; C library function

section .data
    msg db "Hello from NASM x64!", 10, 0

section .text
    global main              ; entry point for C-style programs

main:
    sub rsp, 40              ; shadow space for Windows x64 ABI
    lea rcx, [rel msg]       ; RCX = address of string (1st arg)
    call printf              ; call printf(msg)
    add rsp, 40
    ret
