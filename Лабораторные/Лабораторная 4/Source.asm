.586
.XMM
.MODEL flat, C
.DATA
fly dd 0
y1 dd 0
y2 dd 0
y3 dd 0
y4 dd 0
y5 dd 0
y6 dd 0
y7 dd 0
y8 dd 0
y9 dd 0
y10 dd 0
y11 dd 0
i dd 0
.CODE
extern func:near
public asfun; /*Объявление функции, которую будет вызывать код С++*/
asfun proc C x:dword; /*Объявление переменных, которые будут переданы из С++*/
mov eax, x; /*Передача в регистр ах*/
push eax; /*Добавление в стек*/
call func; /*Вызов функции из кода C++ из Assembler*/
fst fly; /*Передача расчитанного значения из стека в переменную*/

mov eax, y1; /*Передаем значение y1 в регистр ax*/
mov ebx, i; /*Передача 0 для работы ветвления в регистр bx*/
mov ecx, fly; /*Передача результата вычисления в регистр cx*/
cmp eax, ebx; /*Сравнение y1 и 0 (проверка, что переменная пустая)*/
JNE Next; /*Если в y1 уже записано значение, то переходим в следующую переменную*/
mov y1, ecx; /*Если переменная пуста, то записываем в у1*/
JMP Exit;

Next:
mov eax, y2;
cmp eax, ebx;
JNE Go;
mov y2, ecx; 
JMP Exit;

Go:
mov eax, y3;
cmp eax, ebx;
JNE Another;
mov y3, ecx; 
JMP Exit;

Another:
mov eax, y4;
cmp eax, ebx;
JNE ABC;
mov y4, ecx;
JMP Exit;

ABC:
mov eax, y5;
cmp eax, ebx;
JNE BCA;
mov y5, ecx;
JMP Exit;

BCA:
mov eax, y6;
cmp eax, ebx;
JNE CBA;
mov y6, ecx;
JMP Exit;

CBA:
mov eax, y7;
cmp eax, ebx;
JNE ACB;
mov y7, ecx;
JMP Exit;

ACB:
mov eax, y8;
cmp eax, ebx;
JNE CAB;
mov y8, ecx;
JMP Exit;

CAB:
mov eax, y9;
cmp eax, ebx;
JNE CLA;
mov y9, ecx;
JMP Exit;

CLA:
mov eax, y10;
cmp eax, ebx;
JNE Last;
mov y10, ecx;
JMP Exit;

Last:
mov y11, ecx;

Exit:
ret
asfun endp; /*Конец функции вызова, возврат значения в C++*/
End 

