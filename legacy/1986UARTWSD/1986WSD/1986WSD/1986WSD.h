// 1986WSD.h : ������� ���� ��������� ��� ���������� PROJECT_NAME
//

#pragma once

#ifndef __AFXWIN_H__
	#error "�������� stdafx.h �� ��������� ����� ����� � PCH"
#endif

#include "resource.h"		// �������� �������


// CMy1986WSDApp:
// � ���������� ������� ������ ��. 1986WSD.cpp
//

class CMy1986WSDApp : public CWinApp
{
public:
	CMy1986WSDApp();

// ���������������
	public:
	virtual BOOL InitInstance();

// ����������

	DECLARE_MESSAGE_MAP()
};

extern CMy1986WSDApp theApp;