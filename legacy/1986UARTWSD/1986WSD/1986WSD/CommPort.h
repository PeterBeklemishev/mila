// CommPort.h: interface for the CCommPort class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_COMMPORT_H__B75DD8A0_F54F_11D5_85F4_00E0294B1287__INCLUDED_)
#define AFX_COMMPORT_H__B75DD8A0_F54F_11D5_85F4_00E0294B1287__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CCommPort  
{
public:
	DCB        dcb ;
	COMMTIMEOUTS  CommTimeOuts ;
	BOOL WriteBlock(LPSTR lpByte, DWORD dwBytesToWrite);
	BOOL Close();
	BOOL ReadBlock(LPSTR lpByte, DWORD dwBytesToRead);
	BOOL Open(LPCTSTR lpFileName);
	HANDLE hCom;
	CCommPort();
	virtual ~CCommPort();

protected:
	OVERLAPPED osRead;
	OVERLAPPED osWrite;
};

#endif // !defined(AFX_COMMPORT_H__B75DD8A0_F54F_11D5_85F4_00E0294B1287__INCLUDED_)
