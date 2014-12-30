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
 *  ���� Main.c
 *
 *============================================================================================*/

#include <stdio.h>

#include <types.h>
#include <lcd.h>
#include <gl.h>
#include <text.h>
#include <joystick.h>
#include <leds.h>
#include <menu.h>
#include <image.h>

void delay(u32 data)
{
  u32 i;

  for(i=0;i<data;i++)
  {
    __NOP();
    __NOP();
    __NOP();
    __NOP();
  }
}

unsigned int dddd;
void Frequency_CLK_PLL(unsigned pll_on, unsigned int pll_mul)
{
  // pll_mul - ����������� ��������� ��� CPU PLL
  // pll_pld - ��� ����������� PLL
  // pll_on - ��� ��������� PLL
  RST_CLK->HS_CONTROL = 0b01;                     // �������� ������� ��������� HSE
  while (RST_CLK->CLOCK_STATUS == 0b000) __NOP();  // ������� ������� HSE � PLL
  RST_CLK->CPU_CLOCK = 0b0100000010;              // �������� CPU_CLK


  if(pll_on == 1)
  {
    RST_CLK->PLL_CONTROL = (pll_on<<2)|(pll_mul<<8);    // ��� PLL
    dddd   = (pll_on<<2)|(pll_mul<<8);
    while (RST_CLK->CLOCK_STATUS < 0b110) __NOP();  // ������� ������� HSE � PLL

    RST_CLK->CPU_CLOCK = 0b0100000110;              // �������� CPU_CLK
  }
}

#define SET_PORT(port,data,masc)  port->RXTX |= data & masc; port->RXTX &= ~(~data & masc)


u32 PauzaSET(u32 time)
{
  u32 tm;

  tm = time;

  while(tm != 0)
  {
    tm--;

    if(GetKey() == 1)
    {
      return 0;
    }
    delay(0xFF);
  }

  return 1;
}

void main(void) {
  u32 dat, j;

  Frequency_CLK_PLL(0, 0);           // ���. ��������� CLK
  RST_CLK->PER_CLOCK = 0xFFFFFFFF;   // �������� CLK �� �����

  LCD_INIT();
  InitPortLED();
  InitPortJoystick();

  #ifndef __CMCARM_DEMO__
  while(GetKey() != 1)
  {
    PrintImage(0);
    if(PauzaSET(0x2FFF) == 0)
      goto end;


    PrintImage(1);
    if(PauzaSET(0x2FFF) == 0)
      goto end;

    PrintImage(2);
    if(PauzaSET(0x1FFF) == 0)
      goto end;

    PrintImage(3);
    if(PauzaSET(0x1FFF) == 0)
      goto end;
  }

  end:

  while(GetKey() != 0);

  #endif /* __CMCARM_DEMO__ */

  Menu_Init();
  DisplayMenu();
  ReadKey();
}

/*============================================================================================
 * ����� ����� Main.c
 *============================================================================================*/

