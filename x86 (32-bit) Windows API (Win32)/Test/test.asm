section .data
    msg db 'Nigga wigga wigga', 0
    msg_len equ $ - msg

section .text
    global _start
    extern _GetStdHandle@4
    extern _WriteConsoleA@20
    extern _ExitProcess@4

_start:
    ; Get stdout handle
    push -11                  ; STD_OUTPUT_HANDLE = -11
    call _GetStdHandle@4
    mov ebx, eax              ; save handle in ebx
    
    ; Write to console
    push 0                    ; lpReserved
    push 0                    ; lpNumberOfCharsWritten
    push msg_len              ; nNumberOfCharsToWrite
    push msg                  ; lpBuffer
    push ebx                  ; hConsoleOutput  
    call _WriteConsoleA@20
    
    ; Exit process
    push 0
