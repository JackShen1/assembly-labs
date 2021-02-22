.586
.model flat, c

include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
include Module.inc
include Longop.inc

includelib \masm32\lib\user32.lib							;��������� ������ �������
includelib \masm32\lib\kernel32.lib

.const														;����������� const ���������
Caption db "Assembler - Lab4", 0


.data														;����������� global ���������

;Debug Value
;regA dd 00000001h, 00000000h, 00000000h, 00000000h 
;regB dd 0FFFFFFFFh, 0FFFFFFFFh, 0FFFFFFFFh, 0EFFFFFFFh 

regA dd 80010001h, 80020001h, 80030001h, 80040001h 
regB dd 80000001h, 80000001h, 80000001h, 80000001h 
regC dd 4 dup (?)

regA_add dd 27 dup (0)
regB_add dd 27 dup (0)
regC_LONG dd 27 dup (?)

regA_sub dd 8 dup (0)
regB_sub dd 8 dup (0)

TextBuff dd 2 dup (?), 0

.code
Display_HEX proc
	push ebp
	mov ebp,esp

	PUSH [regC + 12]
	PUSH offset [TextBuff]
	MOV EDI, 7								;������������ ��� ������� ���� ����� ��� ��������
	CALL DwordToStrHex

	PUSH [regC + 8]
	PUSH offset [TextBuff + 8]
	MOV EDI, 7								;������������ ��� ������� ���� ����� ��� ��������
	CALL DwordToStrHex

	PUSH [regC + 4]
	PUSH offset [TextBuff + 16]
	MOV EDI, 7								;������������ ��� ������� ���� ����� ��� ��������
	CALL DwordToStrHex

	PUSH [regC]
	PUSH offset [TextBuff + 24]
	MOV EDI, 7								;������������ ��� ������� ���� ����� ��� ��������
	CALL DwordToStrHex

	invoke MessageBoxA, 0, ADDR TextBuff, ADDR Caption, 0

	POP EBP
	RET
Display_HEX endp

setIntoRegC proc
	push ebp
	mov ebp,esp

	MOV EDX, [EBP + 8]							;EDX = ������ ������� �����
	
	MOV EAX, 10H
@loop:
	SUB EAX, 04H
	MOV ECX, DWORD ptr[EDX + EAX]
	MOV DWORD ptr [regC + EAX], ECX
	JNZ @loop

	POP EBP
	RET
setIntoRegC endp

main:

	PUSH offset regA
	PUSH offset regB
	PUSH 04H								;������������ ������ ������
	PUSH offset regC	
	CALL ADD_128_LONGOP
	
	CALL Display_HEX


	MOV ECX, 01BH							;ECX = 27
	MOV EAX, 019H							;EAX = 25 (EAX = N)
	MOV EBX, 00H							;�� ����� ��� ������ ������
@loop:
	MOV DWORD ptr[regA_add + EBX], EAX
	MOV DWORD ptr[regB_add + EBX], 80000001H
	MOV DWORD ptr[regB_sub + EBX], EAX

	ADD EBX, 04H
	ADD EAX, 01H
	DEC ECX
	JNZ @loop



	PUSH offset regA_add
	PUSH offset regB_add
	PUSH 1BH									;������������ ������ ������ � 27 ����
	PUSH offset regC_LONG
	CALL ADD_128_LONGOP

	PUSH offset [regC_LONG]
	CALL setIntoRegC
	CALL Display_HEX



	PUSH offset regA_sub
	PUSH offset regB_sub
	PUSH 08H									;������������ ������ ������ � 08 ����
	PUSH offset regC_LONG
	CALL SUB_128_LONGOP

	PUSH offset [regC_LONG]
	CALL setIntoRegC
	CALL Display_HEX

	invoke ExitProcess, 0
end main
