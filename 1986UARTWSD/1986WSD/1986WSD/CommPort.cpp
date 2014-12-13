// CommPort.cpp: implementation of the CCommPort class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "CommPort.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CCommPort::CCommPort()
{
	osRead.Offset = 0;
	osRead.OffsetHigh = 0;
	osRead.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);
	osWrite.Offset = 0;
	osWrite.OffsetHigh = 0;
	osWrite.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);
}

CCommPort::~CCommPort()
{
	CloseHandle(osRead.hEvent);
	CloseHandle(osWrite.hEvent);
}

BOOL CCommPort::Open(LPCTSTR lpFileName)
{
	hCom = CreateFile( lpFileName, GENERIC_READ | GENERIC_WRITE,	
                 0,                    // exclusive access
                 NULL,                 // no security attrs
                 OPEN_EXISTING,
                 FILE_FLAG_OVERLAPPED, // overlapped I/O
                 NULL );
	if (hCom == INVALID_HANDLE_VALUE)
		return (FALSE) ;
	// get any early notifications
	// SetCommMask( lpMuk002Info->hCom, EV_RXCHAR ) ;
	// setup device buffers
	SetupComm(hCom, 8192, 8192) ;
	// purge any information in the buffer
	PurgeComm(hCom, PURGE_TXABORT | PURGE_RXABORT |
                    PURGE_TXCLEAR | PURGE_RXCLEAR);
	GetCommTimeouts(hCom, &CommTimeOuts);
	//  set up for overlapped I/O
	CommTimeOuts.ReadIntervalTimeout = 100; 
	CommTimeOuts.ReadTotalTimeoutMultiplier = 100;
	CommTimeOuts.ReadTotalTimeoutConstant = 100;
//    CommTimeOuts.WriteTotalTimeoutMultiplier = 0 ;
//    CommTimeOuts.WriteTotalTimeoutConstant = 1000 ;
	SetCommTimeouts(hCom, &CommTimeOuts);
	//
	dcb.DCBlength = sizeof(DCB);
	GetCommState(hCom, &dcb);
	dcb.BaudRate = CBR_9600;
	dcb.ByteSize = 8;
	dcb.Parity = NOPARITY;
	dcb.StopBits = ONESTOPBIT;
//	dcb.StopBits = TWOSTOPBITS;

	dcb.fAbortOnError = FALSE ;
	SetCommState(hCom, &dcb);
//	ClearCommError(hCom, NULL, NULL);
//
	return (TRUE);
}

BOOL CCommPort::Close()
{
	if(hCom == INVALID_HANDLE_VALUE)
		return ( FALSE ) ;
	//disable event notification and wait for thread
	//to halt
	SetCommMask(hCom, 0 ) ;
	// drop DTR
	EscapeCommFunction(hCom, CLRDTR ) ;
	// purge any outstanding reads/writes and close device handle
	PurgeComm(hCom, PURGE_TXABORT | PURGE_RXABORT |
                    PURGE_TXCLEAR | PURGE_RXCLEAR ) ;
	CloseHandle(hCom) ;
	hCom = INVALID_HANDLE_VALUE;
	return ( TRUE ) ;
} 

BOOL CCommPort::ReadBlock(LPSTR lpByte, DWORD dwBytesToRead)
{
	DWORD	dwBytesRead;
	if (!ReadFile(hCom,lpByte,dwBytesToRead,&dwBytesRead,&osRead))
		GetOverlappedResult(hCom,&osRead,&dwBytesRead,TRUE);
	if(dwBytesRead != dwBytesToRead)
		return (FALSE);
	return (TRUE);
}
BOOL CCommPort::WriteBlock(LPSTR lpByte, DWORD dwBytesToWrite)
{
	DWORD	dwBytesWrite;
	if(!WriteFile(hCom,lpByte,dwBytesToWrite,&dwBytesWrite,&osWrite))
		GetOverlappedResult(hCom,&osWrite,&dwBytesWrite,TRUE);
	if(dwBytesWrite != dwBytesToWrite)
		return (FALSE);
	return (TRUE);
}
