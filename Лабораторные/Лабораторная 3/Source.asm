.686
.model flat,stdcall
.stack 100h
.data
Matrix dw 1,2,3,4;

Rez dw ?;
.code
ExitProcess PROTO STDCALL: DWORD
Start:
mov esi,offset Matrix ; /*Указатель на матрицу*/
mov ecx,2 ; /*число строк/столбцов в матрице*/
xor eax,eax; /*Считаем сумму элементов главной диагонали*/
lea ebx,[ecx*2]
m1:
movzx edx,word ptr [esi]
add eax,edx
lea esi,[esi+ebx+2] ; /*Переходим к следующему элементу диагонали*/
loop m1; /*Если число делится на 2, то младший бит у него равен нулю*/
test eax,1
jz m2 ;/* Делится на 2*/
xor edx,edx
mov	ecx,5
div	ecx
or edx,edx
jnz m3 ;/* не делится на 5*/
m2:;/* Меняем местами элементы диагоналей (главной и побочной диагоналей в рамках строк)*/
mov esi,offset Matrix ;/* Указатель на первый элемент главной диагонали*/
mov edi,esi
mov ecx,2
lea ebx,[ecx*2]
add edi,ebx
m4:
sub edi,2 ; /*Указатель на элемент побочной диагонали*/
lodsw
xchg ax,[edi]
add esi,ebx ; /*Следующий элемент главной диагонали, в предыдущей команде esi увеличилось на 2*/
add edi,ebx ; /*Следующий элемент побочной диагонали (в начале цикла будет смещение на него)*/
loop m4
m3:

exit:
Invoke ExitProcess,Matrix
End Start