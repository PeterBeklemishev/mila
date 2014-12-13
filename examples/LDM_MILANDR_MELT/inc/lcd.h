/*============================================================================================
 *
 *  (C) 2013, LDM-SYSTEMS
 *
 *  ���������������� ������ ��� ���������� ����� LDM-K1986BE92QI
 *
 *  ������ �� ��������������� "��� ����", �.�. ������������� ��� ������, ���������� ���������
 *  ������������� ���������� �� ���������� ��� ����������� Milandr K1986BE92QI. �������� LDM-SYSTEMS
 *  �� ����� ������� ��������������� �� ��������� ����������� ������������� �������, ���
 *  �������������� ������������� �� ��� ������, ��.
 *
 *--------------------------------------------------------------------------------------------
 *
 *  ���� lcd.h: ������� ������� ������ ��� ������ � LCD-������� ���� MT-12864J
 *
 *============================================================================================*/

#ifndef __LCD_H
#define __LCD_H

#include <types.h>

/* ������ LCD-���������� */
typedef enum {
    LCD_CRYSTAL1    = 0,
    LCD_CRYSTAL2    = 1,
    NUM_LCD_CRYSTALS
} LCD_Crystal;

/* ����� ��������� LCD */
typedef enum {
    BUSY            = 7,
    ONOFF           = 5,
    RESET           = 4,
} LCD_Status;

/* ������ ������ ����� � ������ */
typedef enum {
    MET_OR          = 0,
    MET_XOR         = 1,
    MET_NOT_OR      = 2,
    MET_NOT_XOR     = 3,
    MET_AND         = 4,
} LCD_Method;

/* ��������� ������ LCD (� ��������) */
#define MAX_X       127
#define MAX_Y       63

/* ����� LCD-���������� */
typedef struct tag_LCD_Ports {
    u32 Data;
    u32 Cmd;
} LCD_Ports;

extern const LCD_Ports CrystalPorts[NUM_LCD_CRYSTALS];

#define LCD_DATA(x)                 (*((vu32*)CrystalPorts[x].Data))
#define LCD_CMD(x)                  (*((vu32*)CrystalPorts[x].Cmd))

/* �������� ���������� ��������� */
extern LCD_Crystal CurrentCrystal;          /* ������� ��������� ������� */
extern LCD_Method CurrentMethod;            /* ������� ����� ��������� */

/* ������� ������ � LCD */
void ResetLCD(void);
void InitPortLCD(void);
void InitExtBus(void);
void SetCrystal(LCD_Crystal num);
void WriteLCD_Cmd(unsigned char val);
void WriteLCD_Data(unsigned char val);
unsigned char ReadLCD_Cmd(void);
unsigned char ReadLCD_Data(void);
void LCD_INIT(void);
void LCD_CLS(void);

/* ������������� ������� ���������� LCD */
#define LCD_ON                      WriteLCD_Cmd(0x3F)
#define LCD_OFF                     WriteLCD_Cmd(0x3E)
#define LCD_START_LINE(x)           WriteLCD_Cmd(0xC0 | x)
#define LCD_SET_PAGE(x)             WriteLCD_Cmd(0xB8 | x)
#define LCD_SET_ADDRESS(x)          WriteLCD_Cmd(0x40 | x)

#endif /* __LCD_H */

/*============================================================================================
 * ����� ����� lcd.h
 *============================================================================================*/

