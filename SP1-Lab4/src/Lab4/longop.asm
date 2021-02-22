.586
.model flat, c


.code

ADD_128_LONGOP proc
	push ebp
	mov ebp,esp

	mov esi, [ebp+20]							;ESI = ������ A
	MOV EDX, [EBP + 12]							;��� ������ � ���������� ��� ����� while
	mov edi, [ebp+8]							;EDI = ������ ����������

	MOV ECX, 00H								;��� ������ ������� ��� ����� ������ � ����,
												;� ����� ������� �� �� ������ ��������������� CH, ���� ���� ���������������� � loop2
	
	MOV EAX, DWORD ptr[ESI]						;�������� � �������� 32-������ ����

@loop: 
	MOV EBX, [ebp+16]							;EBX = ������ B
	ADD EAX, DWORD ptr[EBX + ECX]						;��������� 32-��
	MOV DWORD ptr[EDI + ECX], EAX						;����� �������� 32 �� ����
	
	JNC @else
	ADD ECX, 04H								;�� ������� ��� ����, ��� ����� �� ���� �������
	MOV EBX, ECX								;�� ��������������� ��� loop2, �� �������� ECX, � ����� ���������� �������� � ECX
@loop2:
	MOV EAX, DWORD ptr[ESI + EBX]
	ADD EAX, 01H								;������ ������ CF
	MOV DWORD ptr[ESI + EBX], EAX				;���������� ��������, ��� �� �������� � ���������� ���������
	JNC @endif									;�������� �� ��� �� ����������� ������ CF?

	ADD EBX, 04H								;���� ������ ����� �������

	MOV EAX, [EBP + 12]							;EAX ��� ����� �� �������, ���� �� ������ ��������������� ���� ��� ���������� ������ ������
	SHL EAX, 2									;� ����� ������� �� ������� ����� ������ �� 4, �� ������� ��� ������������ ���������, ���� � EBX
	ADD EAX, 04H
	CMP EBX, EAX
	JNZ @loop2

	JMP @endIf
@else:
	ADD ECX, 04H

@endIf:
	MOV EAX, DWORD ptr[ESI + ECX]

	DEC EDX
	JNZ @loop

	POP EBP
	RET 12
ADD_128_LONGOP endp

SUB_128_LONGOP proc	
	push ebp
	mov ebp,esp

	mov esi, [ebp+20]							;ESI = ������ A
	MOV EDX, [EBP + 12]							;��� ������ � ���������� ��� ����� while
	mov edi, [ebp+8]							;EDI = ������ ����������

	MOV ECX, 00H								;��� ������ ������� ��� ����� ������ � ����,
												;� ����� ������� �� �� ������ ��������������� CH, ���� ���� ���������������� � loop2
	
	MOV EAX, DWORD ptr[ESI]						;�������� � �������� 32-������ ����

@loop: 
	MOV EBX, [ebp+16]							;EBX = ������ B
	SUB EAX, DWORD ptr[EBX + ECX]						;��������� 32-��
	MOV DWORD ptr[EDI + ECX], EAX						;����� �������� 32 �� ����
	
	JNC @else
	ADD ECX, 04H								;�� ������� ��� ����, ��� ����� �� ���� �������
	MOV EBX, ECX								;�� ��������������� ��� loop2, �� �������� ECX, � ����� ���������� �������� � ECX
@loop2:
	MOV EAX, DWORD ptr[ESI + EBX]
	SUB EAX, 01H								;³������ ������ CF
	MOV DWORD ptr[ESI + EBX], EAX				;���������� ��������, ��� �� �������� � ���������� ���������
	JNC @endif									;�������� �� ��� �� ����������� ������ CF?

	ADD EBX, 04H								;���� ������ ����� �������

	MOV EAX, [EBP + 12]							;EAX ��� ����� �� �������, ���� �� ������ ��������������� ���� ��� ���������� ������ ������
	SHL EAX, 2									;� ����� ������� �� ������� ����� ������ �� 4, �� ������� ��� ������������ ���������, ���� � EBX
	ADD EAX, 04H
	CMP EBX, EAX
	JNZ @loop2

	JMP @endIf
@else:
	ADD ECX, 04H

@endIf:
	MOV EAX, DWORD ptr[ESI + ECX]

	DEC EDX
	JNZ @loop

	POP EBP
	RET 12
SUB_128_LONGOP endp
end
