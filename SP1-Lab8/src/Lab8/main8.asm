.586
.model flat, stdcall

option casemap : none; ����������� ����� �� ������� �����
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc

include module.inc
include longop.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

.data
CaptionHello db '����������� ������ � 8', 0
TextHello db '�����: �������� ������', 13, 10, '�����: ��-82', 13, 10, "����� � ������: 25", 13, 10, "г�: 2020", 0

Caption1 db "X1", 0
Caption2 db "X2", 0
;�������� ����������� ������� ����
;A11*X1 + A12*X2 = B1
;A21*X1 + A22*X2 = B2
valueA11 dd 2.3
valueA22 dd 1.2
valueA21 dd 3.4
valueA12 dd 0.6
valueB1 dd 4.1
valueB2 dd 2.6

buffOperand1 dd ?
buffOperand2 dd ?
buffOperand3 dd ?

resultX1 dd 0
resultX2 dd 0
X1Text dd 100 dup(0)
X2Text dd 100 dup(0)

.code
main:
	invoke MessageBoxA, 0, ADDR TextHello, ADDR CaptionHello, 0
	;������ ���������� �������
	fld valueA11 
	fmul valueA22
	fld valueA21
	fmul valueA12
	fsub
	fst buffOperand1

	;������ �������� X1
	fld valueB1
	fmul valueA22
	fld valueB2
	fmul valueA12
	fsub
	fst buffOperand2
	fld buffOperand2
	fdiv buffOperand1
	fstp resultX1
	
	;������ �������� X2
	fld valueB2
	fmul valueA11
	fld valueB1
	fmul valueA21
	fsub
	fst buffOperand3
	fld buffOperand3
	fdiv buffOperand1
	fstp resultX2

	push offset X1Text
	push  resultX1
	call FloatDec_MY
	invoke MessageBoxA, 0, ADDR X1Text, ADDR Caption1, 0

	push offset X2Text
	push  resultX2
	call FloatDec_MY
	invoke MessageBoxA, 0, ADDR X2Text, ADDR Caption2, 0
	invoke ExitProcess, 0
end main
