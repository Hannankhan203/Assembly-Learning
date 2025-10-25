default rel
extern printf,scanf
global main
section .data
msg1 db "Enter your number 1:",0
msg2 db "Enter your number 2:",0
fmt db "%d",0
compResult db "%d is less than %d",10,0


section .bss
n1 resd 1
n2 resd 1
section .text
main:
	;for num 1
	lea rcx,[rel msg1]
	call printf
	lea rcx,[rel fmt]
	lea rdx,[rel n1]
	call scanf

	;for num 2
	lea rcx,[rel msg2]
	call printf
	lea rcx,[rel fmt]
	lea rdx,[rel n2]
	call scanf

        ;for compare num1 and num2
  	mov eax,[n1]
  	mov ebx,[n2]
	cmp eax,ebx   ; eax-ebx 5-6
        jg greater
        lea rcx,[rel compResult]
        mov rdx,[n1]
        mov r8d,[n2]

	call printf
	jmp done
greater:
	lea rcx,[rel compResult]
        mov rdx,[n2]
        mov r8d,[n1]

	call printf
done:
	ret