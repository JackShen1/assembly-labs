.586
.model flat, c
.data	
num11 dd 11

.code
    ;��������� StrHex_MY ������ ����� ����������������� ����
    ;������ �������� - ������ ������ ���������� (����� �������)
	;������ �������� - ������ �����
	;����� �������� - ���������� ����� � ���� 
Func proc
	push ebp
	mov ebp,esp
	mov ecx, [ebp+8]		;m
	mov eax, [ebp+12]		;X
	
	xor edx, edx
	mov ebx, eax
	shl ebx, 1
	jnc @plus
	sub edx, 1
	@plus:

	idiv num11
	sar eax, cl

	pop ebp
	ret 8
Func endp

End