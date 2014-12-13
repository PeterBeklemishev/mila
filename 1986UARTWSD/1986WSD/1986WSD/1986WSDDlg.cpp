// 1986WSDDlg.cpp : файл реализации
//

#include "stdafx.h"
#include "1986WSD.h"
#include "1986WSDDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// Диалоговое окно CAboutDlg используется для описания сведений о приложении

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Данные диалогового окна
	enum { IDD = IDD_ABOUTBOX };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // поддержка DDX/DDV

// Реализация
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
END_MESSAGE_MAP()


// диалоговое окно CMy1986WSDDlg




CMy1986WSDDlg::CMy1986WSDDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CMy1986WSDDlg::IDD, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CMy1986WSDDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_COM, m_com);
	DDX_Control(pDX, IDC_FILE, m_file);
	DDX_Control(pDX, IDC_LIST1, m_list);
	DDX_Control(pDX, IDC_ERASE, m_erase);
	DDX_Control(pDX, IDC_PROGRAM2, m_program);
	DDX_Control(pDX, IDC_VERIFY, m_verify);
	DDX_Control(pDX, IDC_PROGRESS1, m_progress);
	DDX_Control(pDX, IDRUN, m_run);
}

BEGIN_MESSAGE_MAP(CMy1986WSDDlg, CDialog)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	//}}AFX_MSG_MAP
	ON_BN_CLICKED(IDBROWSE, &CMy1986WSDDlg::OnBnClickedBrowse)
	ON_BN_CLICKED(IDSTART, &CMy1986WSDDlg::OnBnClickedStart)
	ON_BN_CLICKED(IDRUN, &CMy1986WSDDlg::OnBnClickedRun)
END_MESSAGE_MAP()


// обработчики сообщений CMy1986WSDDlg

BOOL CMy1986WSDDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Добавление пункта ''О программе...'' в системное меню.

	// IDM_ABOUTBOX должен быть в пределах системной команды.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Задает значок для этого диалогового окна. Среда делает это автоматически,
	//  если главное окно приложения не является диалоговым
	SetIcon(m_hIcon, TRUE);			// Крупный значок
	SetIcon(m_hIcon, FALSE);		// Мелкий значок

	// TODO: добавьте дополнительную инициализацию
	if(!GetInitParam())
	{
		MessageBox("Ошибка открытия файла конфигурации","File Error",MB_OK|MB_ICONSTOP);
		CDialog::OnCancel();
		return 0;  
	}
	if(!GetBootCod())
	{
	    MessageBox("Ошибка открытия файла 1986_BOOT_UART.HEX","File Error",
			MB_OK|MB_ICONSTOP);
		CDialog::OnCancel();
		return 0;  
	}
	m_com.SetWindowTextA(InitParam.comname);
	m_file.SetWindowTextA(InitParam.filename);
	m_erase.SetCheck(BST_CHECKED);
	m_program.SetCheck(BST_CHECKED);
	m_verify.SetCheck(BST_CHECKED);
	str = "Подключите 1986ВЕ9x к РС ";
	str += InitParam.comname;
	m_list.AddString(str);
	str = "Нажмите Start";
	m_list.InsertString(m_list.GetCount(),str);
	

	return TRUE;  // возврат значения TRUE, если фокус не передан элементу управления
}

void CMy1986WSDDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// При добавлении кнопки свертывания в диалоговое окно нужно воспользоваться приведенным ниже кодом,
//  чтобы нарисовать значок. Для приложений MFC, использующих модель документов или представлений,
//  это автоматически выполняется рабочей средой.

void CMy1986WSDDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // контекст устройства для рисования

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// Выравнивание значка по центру клиентского прямоугольника
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Нарисуйте значок
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// Система вызывает эту функцию для получения отображения курсора при перемещении
//  свернутого окна.
HCURSOR CMy1986WSDDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}

BOOL CMy1986WSDDlg::GetInitParam(void)
{
CString strfn;
CFile file;
int i;

	i = GetModuleFileName(NULL,bufcurdir,512);
	if(i == 0)
		return 0;
	while(bufcurdir[i] !='\\')
		i--;
	bufcurdir[i] = 0;
	strfn = "\\1986WSD.cfg";
	strfn = bufcurdir + strfn;
	if(!file.Open(strfn,CFile::modeRead,NULL))
	{
		strcpy_s(InitParam.comname,"COM1");
		strcpy_s(InitParam.filename,"");
		if(!file.Open(strfn,CFile::modeCreate|CFile::modeWrite,NULL))
			return 0;
		file.Write(&InitParam,sizeof(InitParam));
		file.Close();
		return 1;
	}
	file.Read(&InitParam,sizeof(InitParam));
	file.Close();
	return 1;
}

void CMy1986WSDDlg::OnCancel()
{
	// TODO: добавьте специализированный код или вызов базового класса
CString strfn;
CFile file;
	strfn = "\\1986WSD.cfg";
	strfn = bufcurdir + strfn;
	file.Open(strfn,CFile::modeCreate|CFile::modeWrite,NULL);
	file.Write(&InitParam,sizeof(InitParam));
	file.Close();
	CDialog::OnCancel();
}

void CMy1986WSDDlg::OnBnClickedBrowse()
{
	// TODO: добавьте свой код обработчика уведомлений
CFileDialog dlgFile(TRUE);
	dlgFile.GetOFN().lpstrFilter = "hex Files\0*.hex\0\0";
	dlgFile.DoModal();
	strcpy_s(InitParam.filename,dlgFile.GetPathName());
	m_file.SetWindowTextA(InitParam.filename);
}

DWORD WINAPI CMy1986WSDDlg::StartThreadFunction( LPVOID lpParam )
{
	((CMy1986WSDDlg*)lpParam)->Start();
	return 0;
}
void CMy1986WSDDlg::OnBnClickedStart()
{
	// TODO: добавьте свой код обработчика уведомлений
	hthread = CreateThread( 
            NULL,                   // default security attributes
            0,                      // use default stack size  
            StartThreadFunction,       // thread function name
			this,			      // argument to thread function 
            0,                      // use default creation flags 
            &ThreadId);			   // returns the thread identifier
}
void CMy1986WSDDlg::Start(void)
{
int i,j;
BOOL f;
const char id_str[13]= "1986BOOTUART";

	if((m_program.GetCheck()==BST_CHECKED)||(m_verify.GetCheck()==BST_CHECKED))
	{
		if(!GetHexCod())
		{
			str = "Ошибка открытия HEX-файла!";
			m_list.InsertString(m_list.GetCount(),str);			
			return;
		}
	}
	if(!com.Open(InitParam.comname))
	{
		str = "Ошибка открытия COM порта!";
		m_list.InsertString(m_list.GetCount(),str);
		return;
	}
	
	str = "Синхронизация...";
	m_list.InsertString(m_list.GetCount(),str);
	txdbuf[0] = 0x0;
	for(i=0;i<512;i++)
		com.WriteBlock(txdbuf,1);
	if	(!com.ReadBlock(rxdbuf,3))
	{
		for(i=0;i<512;i++)
			com.WriteBlock(txdbuf,1);		
		if	(!com.ReadBlock(rxdbuf,3))
		{
			str = "ошибка синхронизации!";
			m_list.InsertString(m_list.GetCount(),str);		
			com.Close();
			return;
		}
	}

	m_list.DeleteString(m_list.GetCount()-1);
	str = "Синхронизация...ОК!";
	m_list.InsertString(m_list.GetCount(),str);

	txdbuf[0] = 'B';
	txdbuf[1] = 0x0;
	txdbuf[2] = (char)0xc2;
	txdbuf[3] = 0x01;
	txdbuf[4] = 0x0;
	com.WriteBlock(txdbuf,5);
	while(com.ReadBlock(rxdbuf,1));

	com.dcb.BaudRate = CBR_115200;
	SetCommState(com.hCom, &com.dcb);
	txdbuf[0] = 0xd;
	com.WriteBlock(txdbuf,1);
	if	((!com.ReadBlock(rxdbuf,3))||(rxdbuf[0]!=0xd)||(rxdbuf[1]!=0xa)||(rxdbuf[2]!=0x3e))
	{
		str = "ошибка обмена";
		m_list.InsertString(m_list.GetCount(),str);		
		com.Close();
		return;
	}
	str = "baud rate 115200 OK!";
	m_list.InsertString(m_list.GetCount(),str);
	str = "boot load...";
	m_list.InsertString(m_list.GetCount(),str);
	txdbuf[0] = 'L';
	txdbuf[1] = dwadrboot & 0xff;
	txdbuf[2] = (dwadrboot>>8) & 0xff;
	txdbuf[3] = 0;
	txdbuf[4] = 0x20;
	txdbuf[5] = ilboot & 0xff;
	txdbuf[6] = (ilboot>>8) & 0xff;
	txdbuf[7] = 0;
	txdbuf[8] = 0;
	com.WriteBlock(txdbuf,9);
	if	((!com.ReadBlock(rxdbuf,1))||(rxdbuf[0]!='L'))
	{
		str = "ошибка обмена";
		m_list.InsertString(m_list.GetCount(),str);		
		com.Close();
		return;
	}
	com.WriteBlock((LPSTR)(bufram+dwadrboot),ilboot);
	if	((!com.ReadBlock(rxdbuf,1))||(rxdbuf[0]!='K'))
	{
		str = "ошибка обмена";
		m_list.InsertString(m_list.GetCount(),str);		
		com.Close();
		return;
	}
	for(i=0;i<(ilboot>>3);i++)
	{
		txdbuf[0] = 'Y';
		txdbuf[1] = (dwadrboot+8*i) & 0xff;
		txdbuf[2] = ((dwadrboot+8*i)>>8) & 0xff;
		txdbuf[3] = 0;
		txdbuf[4] = 0x20;
		txdbuf[5] = 8;
		txdbuf[6] = 0;
		txdbuf[7] = 0;
		txdbuf[8] = 0;
		com.WriteBlock(txdbuf,9);
		f = TRUE;
		if((com.ReadBlock(rxdbuf,10))&&(rxdbuf[0]=='Y')&&(rxdbuf[9]=='K'))
		{
			for(j=0;j<8;j++)
			{
				if(rxdbuf[j+1] != (char)bufram[dwadrboot+8*i+j])
					f= FALSE;
			}
		}
		else
			f= FALSE;
		if(!f)
		{
			str = "ошибка обмена";
			m_list.InsertString(m_list.GetCount(),str);		
			com.Close();
			return;
		}
	}
	txdbuf[0] = 'R';
	txdbuf[1] = dwadrboot & 0xff;
	txdbuf[2] = (dwadrboot>>8) & 0xff;
	txdbuf[3] = 0;
	txdbuf[4] = 0x20;
	com.WriteBlock(txdbuf,5);
	if	((!com.ReadBlock(rxdbuf,1))||(rxdbuf[0]!='R'))
	{
		str = "ошибка обмена";
		m_list.InsertString(m_list.GetCount(),str);		
		com.Close();
		return;
	}
	txdbuf[0] = 'I';
	com.WriteBlock(txdbuf,1);
	f = TRUE;
	if(com.ReadBlock(rxdbuf,12))
	{
		for(j=0;j<12;j++)
			{
				if(rxdbuf[j] != id_str[j])
					f= FALSE;
			}
	}
	else
		f = FALSE;
	if(!f)
	{
		str = "ошибка идентификации загрузчика!";
		m_list.InsertString(m_list.GetCount(),str);		
		com.Close();
		return;
	}
	m_list.DeleteString(m_list.GetCount()-1);
	str = "boot load...ОК!";
	m_list.InsertString(m_list.GetCount(),str);

	if(m_erase.GetCheck()==BST_CHECKED)
		if(!Erase())
			return;
	if(m_program.GetCheck()==BST_CHECKED)
		if(!Program())
			return;
	if(m_verify.GetCheck()==BST_CHECKED)
		if(!Verify())
			return;
	com.Close();
}

void CMy1986WSDDlg::OnBnClickedRun()
{
	// TODO: добавьте свой код обработчика уведомлений
	m_run.EnableWindow(0);
	if(!com.Open(InitParam.comname))
	{
		str = "Ошибка открытия COM порта!";
		m_list.InsertString(m_list.GetCount(),str);
		return;
	}
	com.dcb.BaudRate = CBR_115200;
	SetCommState(com.hCom, &com.dcb);
	str = "Run at 0x08000000...";
	m_list.InsertString(m_list.GetCount(),str);
	txdbuf[0] = 'R';
	com.WriteBlock(txdbuf,1);
	if	((!com.ReadBlock(rxdbuf,1))||(rxdbuf[0]!='R'))
	{
		str = "ошибка обмена";
		m_list.InsertString(m_list.GetCount(),str);
	}
	else
	{
		m_list.DeleteString(m_list.GetCount()-1);
		str = "Run at 0x08000000 OK!";
		m_list.InsertString(m_list.GetCount(),str);
	}
	com.Close();
	return;
}

void CMy1986WSDDlg::OnOK()
{
	// TODO: добавьте специализированный код или вызов базового класса
	m_com.GetWindowTextA(InitParam.comname,6);
	str = "Подключите 1986ВЕ9x к РС ";
	str += InitParam.comname;
	m_list.InsertString(m_list.GetCount(),str);
	str = "Нажмите Start";
	m_list.InsertString(m_list.GetCount(),str);
//	CDialog::OnOK();
}

BOOL CMy1986WSDDlg::GetBootCod(void)
{
int i,nb;
CFile file;
CString strfn;
char chd;
DWORD	dwadr;
	dwadr_seg_hex = 0;
	dwadr_lineoffs_hex = 0;
	for(i=0;i<sizeof(bufram);i++)
	{
		bufram[i] = 0xff;
	}
	strfn = "\\1986_BOOT_UART.HEX";
	strfn = bufcurdir + strfn;
	file.Open(strfn,CFile::modeRead,NULL);
	nb = 1;
	while(nb == 1)
	{
		i = 0;
		do
		{
			nb = file.Read(&chd,1);
			buf_hexstr[i] = chd;
			i++;
		}
		while(chd!='\n');
		if(nb != 1)
		{
			file.Close();
			for(i=0;i<sizeof(bufram);i++)
			{
				if(bufram[i] != 0xff)
					break;
			}
			dwadrboot = i;
			for(i=(sizeof(bufram)-1);i>=0;i--)
			{
				if(bufram[i] != 0xff)
					break;
			}
			ilboot = (i+16 - dwadrboot) & 0xfffffff7;;
			return 1;
		}
		if(!GetDataHex())
		{
			file.Close();
			return 0;
		}
		if(btype_hex == 0)
		{
			dwadr = dwadr_lineoffs_hex + dwadr_seg_hex + wadr_offs_hex;
			if((dwadr<0x20000000)||((dwadr+bl_hex)>0x20008000))
			{
				file.Close();
				return 0;
			}
			dwadr -= 0x20000000;
			for(i=0;i<bl_hex;i++)
				bufram[dwadr+i] = buf_data_hex[i];
		}
	}
	return 0;
}

BOOL CMy1986WSDDlg::GetHexCod(void)
{
int i,nb;
CFile file;
CString strfn;
char chd;
DWORD	dwadr;
/*	
	for(i=0;i<sizeof(bufcod);i++)
	{
		bufcod[i] = i;
	}
	ilcod = 512*0x100;
	return 1;
*/
	dwadr_seg_hex = 0;
	dwadr_lineoffs_hex = 0;
	for(i=0;i<sizeof(bufcod);i++)
	{
		bufcod[i] = 0xff;
	}

	if(!file.Open(InitParam.filename,CFile::modeRead,NULL))
		return 0;
	nb = 1;
	while(nb == 1)
	{
		i = 0;
		do
		{
			nb = file.Read(&chd,1);
			buf_hexstr[i] = chd;
			i++;
		}
		while(chd!='\n');
		if(nb != 1)
		{
			file.Close();
			for(i=(sizeof(bufcod)-1);i>=0;i--)
			{
				if(bufcod[i] != 0xff)
					break;
			}
			if(i & 0xff)
				i = ((i + 0x100) & 0xffffff00);
			ilcod = i;
			return 1;
		}
		if(!GetDataHex())
		{
			file.Close();
			return 0;
		}
		if(btype_hex == 0)
		{
			dwadr = dwadr_lineoffs_hex + dwadr_seg_hex + wadr_offs_hex;
			if((dwadr<0x08000000)||((dwadr+bl_hex)>0x08020000))
			{
				file.Close();
				return 0;
			}
			dwadr -= 0x08000000;
			for(i=0;i<bl_hex;i++)
				bufcod[dwadr+i] = buf_data_hex[i];
		}
	}
	return 0;	
}

BYTE CMy1986WSDDlg::GetHexByte(int ibuf)
{
BYTE bh,bl;
	bh = buf_hexstr[ibuf] - 0x30;
	if (bh>9)
		bh -= 7;
	bh <<= 4;
	bl = buf_hexstr[ibuf+1] - 0x30;
	if (bl>9)
		bl -= 7;
	return bh+bl;
}

BOOL CMy1986WSDDlg::GetDataHex(void)
{
int i;
BYTE ks;
	if(buf_hexstr[0] != 0x3a)
		return	0;
	ks = 0;
	bl_hex = GetHexByte(1);
	wadr_offs_hex = ((WORD)GetHexByte(3)<<8)+GetHexByte(5);
	btype_hex = GetHexByte(7);
	ks = bl_hex + btype_hex + (wadr_offs_hex>>8) + wadr_offs_hex;
	for(i=0;i<bl_hex+1;i++)
	{
		buf_data_hex[i] = GetHexByte(2*i+9);
		ks += buf_data_hex[i];
	}
	if(ks!=0)
		return 0;
	if(btype_hex == 2)
		dwadr_seg_hex =	(((WORD)GetHexByte(9)<<8)+GetHexByte(11))<<4;
	if(btype_hex == 4)
		dwadr_lineoffs_hex = (((WORD)GetHexByte(9)<<8)+GetHexByte(11))<<16;
	return 1;
}

BOOL CMy1986WSDDlg::Erase(void)
{
DWORD	adr,data;	
	str = "Full chip erase...";
	m_list.InsertString(m_list.GetCount(),str);
	txdbuf[0] = 'E';
	com.WriteBlock(txdbuf,1);
	Sleep(1000);
	if	((!com.ReadBlock(rxdbuf,9))||(rxdbuf[0]!='E'))
	{
		str = "ошибка обмена";
		m_list.InsertString(m_list.GetCount(),str);		
		com.Close();
		return 0;
	}
	adr = (BYTE)rxdbuf[1] + (((BYTE)rxdbuf[2])<<8) + (((BYTE)rxdbuf[3])<<16)
		+ (((BYTE)rxdbuf[4])<<24);
	data = (BYTE)rxdbuf[5] + (((BYTE)rxdbuf[6])<<8) + (((BYTE)rxdbuf[7])<<16)
		+ (((BYTE)rxdbuf[8])<<24);
	if((adr == 0x08020000)&&(data == 0xffffffff))
	{
		m_list.DeleteString(m_list.GetCount()-1);
		str = "Full chip erase done!";
		m_list.InsertString(m_list.GetCount(),str);
		return 1;
	}
	m_list.DeleteString(m_list.GetCount()-1);
	str.Format("Full chip erase failed adr=0x%08x data=0x%08x",adr,data);
	m_list.InsertString(m_list.GetCount(),str);
	com.Close();
	return 0;
}

BOOL CMy1986WSDDlg::Program(void)
{
int i,j;
BYTE ks;
	str.Format("Program %i byte...",ilcod);
	m_list.InsertString(m_list.GetCount(),str);
	m_progress.SetRange(0,ilcod>>8);
	m_progress.SetPos(0);
	txdbuf[0] = 'A';
	txdbuf[1] = 0x00;
	txdbuf[2] = 0x00;
	txdbuf[3] = 0x00;
	txdbuf[4] = 0x08;
	com.WriteBlock(txdbuf,5);
	if((!com.ReadBlock(rxdbuf,1))||(rxdbuf[0]!=0x08))
	{
		str = "ошибка обмена";
		m_list.InsertString(m_list.GetCount(),str);		
		com.Close();
		return 0;
	}
	txdbuf[0] = 'P';
	for(i=0;i<(ilcod>>8);i++)
	{
		com.WriteBlock(txdbuf,1);
		com.WriteBlock((LPSTR)(bufcod+(i<<8)),256);
		ks =0;
		for(j=0;j<256;j++)
			ks += bufcod[j+(i<<8)];
		if((!com.ReadBlock(rxdbuf,1))||((BYTE)rxdbuf[0]!=ks))
		{
			str = "ошибка обмена";
			m_list.InsertString(m_list.GetCount(),str);		
			com.Close();
			return 0;
		}
		m_progress.SetPos(i+1);
	}
	m_list.DeleteString(m_list.GetCount()-1);
	str.Format("Program %i byte done!",ilcod);
	m_list.InsertString(m_list.GetCount(),str);
	m_run.EnableWindow(1);
	return 1;
}

BOOL CMy1986WSDDlg::Verify(void)
{
int i,j,k;
	str = "Verify...";
	m_list.InsertString(m_list.GetCount(),str);
	m_progress.SetRange(0,ilcod>>8);
	m_progress.SetPos(0);
	txdbuf[0] = 'A';
	txdbuf[1] = 0x00;
	txdbuf[2] = 0x00;
	txdbuf[3] = 0x00;
	txdbuf[4] = 0x08;
	com.WriteBlock(txdbuf,5);
	if((!com.ReadBlock(rxdbuf,1))||(rxdbuf[0]!=0x08))
	{
		str = "ошибка обмена";
		m_list.InsertString(m_list.GetCount(),str);		
		com.Close();
		return 0;
	}
	txdbuf[0] = 'V';
	for(i=0;i<(ilcod>>8);i++)
	{
		for(j=0;j<32;j++)
		{
			com.WriteBlock(txdbuf,1);
			if(!com.ReadBlock(rxdbuf,8))
			{
				str = "ошибка обмена";
				m_list.InsertString(m_list.GetCount(),str);		
				com.Close();
				return 0;
			}
			for(k=0;k<8;k++)
			{
				if((BYTE)rxdbuf[k] != bufcod[k+(j<<3)+(i<<8)])
				{
					
					m_list.DeleteString(m_list.GetCount()-1);
					str.Format("Verify failed adr=0x%08x dataw=0x%02x datar=0x%02x",
						0x08000000+k+(j<<3)+(i<<8),bufcod[k+(j<<3)+(i<<8)],(BYTE)rxdbuf[k]);
					m_list.InsertString(m_list.GetCount(),str);
					com.Close();
					return 0;
				}
			}
		}
		m_progress.SetPos(i+1);
	}
	m_list.DeleteString(m_list.GetCount()-1);
	str.Format("Verify done!",ilcod);
	m_list.InsertString(m_list.GetCount(),str);
	return 1;	
}


