.686
.model flat,stdcall
.stack 100h
.data
Matrix dw 1,2,3,4;

Rez dw ?;
.code
ExitProcess PROTO STDCALL: DWORD
Start:
mov esi,offset Matrix ; /*��������� �� �������*/
mov ecx,2 ; /*����� �����/�������� � �������*/
xor eax,eax; /*������� ����� ��������� ������� ���������*/
lea ebx,[ecx*2]
m1:
movzx edx,word ptr [esi]
add eax,edx
lea esi,[esi+ebx+2] ; /*��������� � ���������� �������� ���������*/
loop m1; /*���� ����� ������� �� 2, �� ������� ��� � ���� ����� ����*/
test eax,1
jz m2 ;/* ������� �� 2*/
xor edx,edx
mov	ecx,5
div	ecx
or edx,edx
jnz m3 ;/* �� ������� �� 5*/
m2:;/* ������ ������� �������� ���������� (������� � �������� ���������� � ������ �����)*/
mov esi,offset Matrix ;/* ��������� �� ������ ������� ������� ���������*/
mov edi,esi
mov ecx,2
lea ebx,[ecx*2]
add edi,ebx
m4:
sub edi,2 ; /*��������� �� ������� �������� ���������*/
lodsw
xchg ax,[edi]
add esi,ebx ; /*��������� ������� ������� ���������, � ���������� ������� esi ����������� �� 2*/
add edi,ebx ; /*��������� ������� �������� ��������� (� ������ ����� ����� �������� �� ����)*/
loop m4
m3:

exit:
Invoke ExitProcess,Matrix
End Start