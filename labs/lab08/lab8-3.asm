%include 'in_out.asm'
section .data
msg2 db "Min: ",0h
A dd '81'
B dd '22'
C dd '72'
section .bss
m resb 10
section .text
global _start
_start:
mov eax,B
call atoi ; Вызов подпрограммы перевода символа в число
mov [B],eax ; запись преобразованного числа в 'B'
mov ecx,[A] ; 'ecx = A'
mov [m],ecx ; 'max = A'
; ---------- Сравниваем 'A' и 'С' (как символы)
cmp ecx,[C] ; Сравниваем 'A' и 'С'
jl check_B ; если 'A>C', то переход на метку 'check_B',
mov ecx,[C] ; иначе 'ecx = C'
mov [m],ecx ; 
; ---------- Преобразование 'max(A,C)' из символа в число
check_B:
mov eax,m
call atoi ; Вызов подпрограммы перевода символа в число
mov [m],eax ; запись преобразованного числа в `max`

mov ecx,[m]
cmp ecx,[B] ; 
jl fin ;
mov ecx,[B] ; иначе 'ecx = B'
mov [m],ecx
; ---------- Вывод результата
fin:
mov eax, msg2
call sprint ;
mov eax,[m]
call iprintLF ; 
call quit ; Выход

