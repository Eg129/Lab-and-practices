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
public asfun; /*���������� �������, ������� ����� �������� ��� �++*/
asfun proc C x:dword; /*���������� ����������, ������� ����� �������� �� �++*/
mov eax, x; /*�������� � ������� ��*/
push eax; /*���������� � ����*/
call func; /*����� ������� �� ���� C++ �� Assembler*/
fst fly; /*�������� ������������ �������� �� ����� � ����������*/

mov eax, y1; /*�������� �������� y1 � ������� ax*/
mov ebx, i; /*�������� 0 ��� ������ ��������� � ������� bx*/
mov ecx, fly; /*�������� ���������� ���������� � ������� cx*/
cmp eax, ebx; /*��������� y1 � 0 (��������, ��� ���������� ������)*/
JNE Next; /*���� � y1 ��� �������� ��������, �� ��������� � ��������� ����������*/
mov y1, ecx; /*���� ���������� �����, �� ���������� � �1*/
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
asfun endp; /*����� ������� ������, ������� �������� � C++*/
End 

