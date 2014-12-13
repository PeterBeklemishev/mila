
#include "include\1986ve9x.h"

#define EEPROM_CMD	(*(volatile unsigned long *) 0x40018000)
#define EEPROM_ADR	(*(volatile unsigned long *) 0x40018004)
#define EEPROM_DI	(*(volatile unsigned long *) 0x40018008)
#define EEPROM_DO	(*(volatile unsigned long *) 0x4001800C)
#define EEPROM_KEY	(*(volatile unsigned long *) 0x40018010)

#define NVSTR	0x2000
#define PROG	0x1000
#define MAS1    0x800	
#define ERASE	0x400
#define IFREN	0x200
#define SE		0x100
#define YE		0x80
#define XE   	0x40
#define CON	 	0x1
 
void bootuart(void);
void sleep(int id);
u8 GetByteRX(void);
void OutByteTX(unsigned char chout);
void OutIntTX(unsigned int iout);
void Erase(void);
void Program(void);
void Verify(void);
unsigned int GetIntRX(void);
void Getbufdata(void);
extern void Run_Flash(void);

unsigned int bufdata[64];
const unsigned char id_str[12] = "1986BOOTUART";
unsigned int adr,ibuf;
unsigned char ks;

void bootuart(void)
{
int i1;
	PER_CLOCK[nEEPROM_CNTRL] = 1;
	while(1)
	{									         
	 i1 = GetByteRX();
	 switch(i1)
	 {
	 case	'I':
	 	for(i1=0;i1<12;i1++)
	 		OutByteTX(id_str[i1]);
	 	break;
	 case	'E':
			Erase();
	 	break;
	 case	'P':
			Program();
	 	break;
	 case	'V':
			Verify();
	 	break;
	 case	'A':
 			ks = 0;
			adr = GetIntRX();
			ibuf = 0;
			OutByteTX(ks);
	 	break;
	   case	'R':
 			OutByteTX('R');
			sleep(200);
			Run_Flash();
	 	break;
	 }
  	}
}

void sleep(int id)
{
	do
	{
	 id++;
	 id -= 2;
	} 
 	while (id!=0);
}

u8 GetByteRX(void)
{
 	while (UART2_FR.RXFE);
	return UART2_DR.DATA;
}
void OutByteTX(unsigned char chout)
{
 	while (UART2_FR.TXFF);
	UART2->DR = chout;
	return;
}

void OutIntTX(unsigned int iout)
{
int i1;
 	for(i1=0;i1<4;i1++)
	{
		OutByteTX(iout&0xff);
		iout >>= 8;
	}	
	return;
}
void Erase(void)
{
unsigned int i1,i2;
	EEPROM_KEY = 0x8AAA5551;
	EEPROM_CMD |= CON;
	for (i1=0;i1<16;i1+=4)
	{
		EEPROM_ADR = 0x08000000+i1;
		EEPROM_CMD &= ~(XE|YE|SE|MAS1|ERASE|NVSTR);
		EEPROM_CMD |= XE|MAS1|ERASE;
		sleep(6);// 6us 
		EEPROM_CMD |= NVSTR;
		sleep(50000);// 50ms 
		EEPROM_CMD &= ~ERASE;
		sleep(110);// 110us 
		EEPROM_CMD &= ~(XE|MAS1|NVSTR);
		sleep(2);// 2us
	} 
	for (i1=0x08000000;i1<0x08020000;i1+=4)
	{
 		EEPROM_ADR = i1;
		EEPROM_CMD |= XE|YE|SE;
		sleep(1);
		i2 = EEPROM_DO;
		EEPROM_CMD &= ~(XE|YE|SE);
		sleep(1);
		if(i2 != 0xffffffff)
			break;
	}
	EEPROM_CMD &= ~CON;
	OutByteTX('E');
	OutIntTX(i1);
	OutIntTX(i2);
	return;
}

void Program(void)
{
unsigned int i1,i2;
	ks =0;
	for(i1=0;i1<64;i1++)
	  bufdata[i1] = GetIntRX();
	EEPROM_KEY = 0x8AAA5551;
	EEPROM_CMD |= CON;
	EEPROM_CMD &= ~(XE|YE|SE|MAS1|ERASE|NVSTR|PROG);
	for (i1=0;i1<16;i1+=4)
	{
		EEPROM_ADR = adr+i1;
		EEPROM_CMD |= XE|PROG;
		sleep(6);// 6us 
		EEPROM_CMD |= NVSTR;
		sleep(11);// 11us 
		for(i2=0;i2<256;i2+=16)
		{
			EEPROM_ADR = adr+i2+i1;
			EEPROM_DI = bufdata[((i1+i2)>>2)];
			EEPROM_CMD |= YE;
			sleep(50);// 50us
			EEPROM_CMD &= ~YE;
			sleep(1);// 1us 
		}
		EEPROM_CMD &= ~PROG;
	   	sleep(6);// 6us 
		EEPROM_CMD &= ~(XE|NVSTR);
	   	sleep(1);// 1us 
	}
	EEPROM_CMD &= ~CON;
	adr += 0x100;
	OutByteTX(ks);
}

void Verify(void)
{
int i1;
	i1 = ibuf; 
	if(i1 == 0)
		Getbufdata();
	OutIntTX(bufdata[i1]);
	i1++;
	OutIntTX(bufdata[i1]);
	i1++;
	ibuf = i1 & 0x3f;
}
unsigned int GetIntRX(void)
{
unsigned int i1,i2,i3;
	i3 = 0;
	for(i1=0;i1<4;i1++)
	{
		i2 = GetByteRX();
		ks += i2;
		i3 >>= 8;
		i2 <<= 24;
		i3 += i2;
	}	
	return i3; 
}

void Getbufdata(void)
{
int i1;
	EEPROM_KEY = 0x8AAA5551;
	EEPROM_CMD |= CON;
	EEPROM_CMD &= ~(XE|YE|SE);
	for(i1=0;i1<64;i1++)
	{
		EEPROM_ADR = adr;
		adr += 4;
		EEPROM_CMD |= XE|YE|SE;
		sleep(1);
		bufdata[i1] = EEPROM_DO;
		EEPROM_CMD &= ~(XE|YE|SE);
		sleep(1);
	}
	EEPROM_CMD &= ~CON;
}
