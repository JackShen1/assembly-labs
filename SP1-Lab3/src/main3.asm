.586
.model flat, stdcall

option casemap : none; ����������� ����� �� ������� �����

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc

include module.inc

includelib \lib\kernel32.lib
includelib \lib\user32.lib

.data
TextBuf db 64 dup(? )
Caption db "����������� ������ �3", 0
Text db "Hello!", 10, 13, "�����: �������� �������, ��-82", 0


value1 db 35; ���� 8 - �����
value2 db - 35; ���� 8 - �����
value3 dw 35; ���� 16 - �����
value4 dw - 35; ���� 16 - �����
value5 dd 35; ���� 32 - �����
value6 dd - 35; ���� 32 - �����
value7 dq 35; ���� 64 - �����
value8 dq - 35; ���� 64 - �����
value9 dd 35.0; ����� � 32 - ������� ������ � ��������� ������
value10 dd - 35.0; ����� � 32 - ������� ������ � ��������� ������
value11 dd 35.35; ����� � 32 - ������� ������ � ��������� ������
value12 dq 35.0; ����� � 64 - ������� ������ � ��������� ������
value13 dq - 70.0; ����� � 64 - ������� ������ � ��������� ������
value14 dq 35.35; ����� � 64 - ������� ������ � ��������� ������
value15 dt 35.0; ����� � 80 - ������� ������ � ��������� ������
value16 dt - 70.0; ����� � 80 - ������� ������ � ��������� ������
value17 dt 35.35; ����� � 80 - ������� ������ � ��������� ������

.code

main :
invoke MessageBoxA, 0, ADDR Text, ADDR Caption, 0

push offset TextBuf
push offset value1
push 8
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 0

push offset TextBuf
push offset value2
push 8
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 0

push offset TextBuf
push offset value3
push 16
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 0

push offset TextBuf
push offset value4
push 16
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 0

push offset TextBuf
push offset value5
push 32
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 0

push offset TextBuf
push offset value6
push 32
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 0

push offset TextBuf
push offset value7
push 64
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 0

push offset TextBuf
push offset value8
push 64
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 0

push offset TextBuf
push offset value9
push 32
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 0

push offset TextBuf
push offset value10
push 32
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 0

push offset TextBuf
push offset value11
push 32
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 0

push offset TextBuf
push offset value12
push 64
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 0

push offset TextBuf
push offset value13
push 64
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 0

push offset TextBuf
push offset value14
push 64
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 0

push offset TextBuf
push offset value15
push 80
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 0

push offset TextBuf
push offset value16
push 80
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 0

push offset TextBuf
push offset value17
push 80
call StrHex_MY
invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 0


invoke ExitProcess, 0
end main
