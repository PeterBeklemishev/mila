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
 *  ���� Menu.h: ������������� ��������� ����
 *
 *============================================================================================*/

#ifndef __MENU_H
#define __MENU_H

#include <types.h>

#define  MAX_MENU_LEVELS 2

#define countof(a) (sizeof(a) / sizeof(*(a)))

void Menu_Init(void);
void DisplayMenuTitle(u8 *ptr);
void DisplayMenu(void);
/* ���� ������� SEL � ������������ � ������� ���� */
void BackToMenuOnSel(void);
/* �������-��������� */
void ReadKey(void);

#endif/* __MENU_H */

/*============================================================================================
 * ����� ����� Menu.h
 *============================================================================================*/

