#ifndef __ADC_H
#define __ADC_H

#include "common.h"

/* �������� ����������� ��������� ��� */

#define ADC_BASE	(PERIPH_BASE + 0x00088000) // ������� ����� ��������� ���
typedef struct 
{
	vu32	CONFIG[2];	// ������� ���������� ADC
	vu32	HI_LEVEL[2];	// ������� ������� ������� ADC
	vu32	LO_LEVEL[2];	// ������� ������ ������� ADC
	vu32	RESULT[2];	// ������� ���������� ADC
	vu32	STATUS[2];	// ������� ������� ADC
	vu32	CHSEL[2];	// ������� ������ ������� �������� ADC
} ADC_TypeDef;


#define ADC	((ADC_TypeDef*) ADC_BASE)	// ��������� �� ����������� ��������� ���

//
// ADC->CONFIG[0] - ������� ���������� ADC1
// ADC->CONFIG[1] - ������� ���������� ADC2
//

#endif
