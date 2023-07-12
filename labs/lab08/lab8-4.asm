%include 'in_out.asm'
section .data
msg1 db 'Введите X: ',0h
msg11 db 'Введите A: ', 0h
msg2 db "Результат: ",0h
section .bss
max resb 10
X resb 10
A resb 10
section .text
global _start
_start:

mov eax,msg1
call sprint

mov ecx,X
mov edx,10
call sread

mov eax,X
call atoi ; Вызов подпрограммы перевода символа в число
mov [X],eax ; запись преобразованного числа

mov eax,msg11
call sprint

mov ecx,A
mov edx,10
call sread

mov eax,A
call atoi ; Вызов подпрограммы перевода символа в число
mov [A],eax ; запись преобразованного числа 

mov eax, [X]
cmp [A], eax
jg n_
jle y_

n_:
mov eax, 3
mov esi, [A]
mul esi
mov esi, 1
add eax, esi
mov esi, eax
jmp fin

y_:
mov eax, 3
mov esi, [X]
mul esi
mov esi, 1
add eax, esi
mov esi, eax
jmp fin


fin:
mov eax, msg2
call sprint ; 
mov eax, esi
call iprintLF ; 
call quit ; Выход

