3..686
.model flat,stdcall
.stack 100h
.data
X dw 15; 
Y dw -10;
Z dw 65;
.code
ExitProcess PROTO STDCALL :DWORD
Start:
mov al,X ; 15
mov ah,Y ; -10
mov dl,Z ; 65
movsx dx,dl ; dx = 65
clc
ror al,5 ; al = -16
clc
ror ah,5 ; ah = 103
mov bx,ax
imul ah ; ax = -1648
add dx,ax ; dx = -1583
add	bl,bh ; bl = 87
movsx bx,bl ; bx = 87
xor dx,bx ; dx = -1658
exit:
Invoke ExitProcess, dx; /*вывод результатат на экран*/
End Start