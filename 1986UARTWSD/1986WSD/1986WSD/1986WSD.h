// 1986WSD.h : главный файл заголовка для приложения PROJECT_NAME
//

#pragma once

#ifndef __AFXWIN_H__
	#error "включить stdafx.h до включения этого файла в PCH"
#endif

#include "resource.h"		// основные символы


// CMy1986WSDApp:
// О реализации данного класса см. 1986WSD.cpp
//

class CMy1986WSDApp : public CWinApp
{
public:
	CMy1986WSDApp();

// Переопределение
	public:
	virtual BOOL InitInstance();

// Реализация

	DECLARE_MESSAGE_MAP()
};

extern CMy1986WSDApp theApp;