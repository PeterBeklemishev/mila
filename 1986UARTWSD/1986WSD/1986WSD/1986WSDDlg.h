// 1986WSDDlg.h : файл заголовка
//

#pragma once
#include "afxwin.h"
#include "CommPort.h"
#include "afxcmn.h"

// диалоговое окно CMy1986WSDDlg
class CMy1986WSDDlg : public CDialog
{
// Создание
public:
	CMy1986WSDDlg(CWnd* pParent = NULL);	// стандартный конструктор

// Данные диалогового окна
	enum { IDD = IDD_MY1986WSD_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// поддержка DDX/DDV


// Реализация
protected:
	HICON m_hIcon;

	// Созданные функции схемы сообщений
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
public:
	CCommPort com;
	char bufcurdir[512];
	char txdbuf[512];
	char rxdbuf[512];
	BYTE bufcod[0x20000];
	BYTE bufram[0x8000];
	BYTE buf_hexstr[530];
	BYTE buf_data_hex[256];
	BYTE bl_hex,btype_hex;
	WORD wadr_offs_hex;
	DWORD dwadr_seg_hex,dwadr_lineoffs_hex;
	DWORD dwadrboot;
	int ilboot,ilcod;
	CString str;
	CEdit m_com;
	HANDLE hthread;
	DWORD ThreadId;
	struct
	{
		char filename[512];	
		char comname[6];
	}InitParam;
	BOOL GetInitParam(void);
protected:
	virtual void OnCancel();
public:
	CEdit m_file;
	CListBox m_list;
	CButton m_erase;
	CButton m_program;
	CButton m_verify;
	afx_msg void OnBnClickedBrowse();
	afx_msg void OnBnClickedStart();
	afx_msg void OnBnClickedRun();
protected:
	virtual void OnOK();
public:
	BOOL GetBootCod(void);
	BOOL GetHexCod(void);
	BYTE GetHexByte(int ibuf);
	BOOL GetDataHex(void);
	BOOL Erase(void);
	BOOL Program(void);
	BOOL Verify(void);
	static DWORD WINAPI StartThreadFunction( LPVOID lpParam ); 
	CProgressCtrl m_progress;
	void Start(void);
	CButton m_run;
};
