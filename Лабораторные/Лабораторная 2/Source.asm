.686
.model flat,stdcall
.stack 100h
.data
X dd 47351,15782,37148,26163; 

Rez dw ?;
.code
ExitProcess PROTO STDCALL:DWORD
Start:
mov esi,offset X ; Указатель на первое число; Меняем знаки у младших байтов четырех слов
sub esi,2 ; корректировка указателя т.к. ecx в цикле всегда больше нуля
mov ecx,4
m1:
neg byte ptr [esi+ecx*2]
loop m1
add esi,2
; Вычисляем M
mov ax,[esi+2]
and ax,[esi]
mov dx,[esi+4]
or dx,[esi+6]
add ax,dx ; ax = M
cmp ax,4
jl m2 ; M >= 4
sub ax,999
sub ax,0cfh
jmp m3
m2:
add ax,[esi+2]
m3:; Здесь в ax результат R
cmp ax,0
js m4 ; Отрицательный
xor ax,1011b
jmp ax
m4:
xor ax,[esi]
jmp ax
exit:

Invoke ExitProcess,ax;
End Start