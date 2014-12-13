#ifndef __TIMER_H
#define __TIMER_H
#include "common.h"

#define TIMER1_BASE	(PERIPH_BASE + 0x70000)
#define TIMER2_BASE	(PERIPH_BASE + 0x78000)
#define TIMER3_BASE (PERIPH_BASE + 0x80000)

typedef struct {
	__IO u16	CNT;			// ������� ��������
	__IO u16	PSC		__attribute__ ((aligned(4)));			// ������� ������������ �������
	__IO u16	ARR		__attribute__ ((aligned(4)));			// ������� ������� �����
	__IO u16	CTRL	__attribute__ ((aligned(4)));			// ������� ����������
	__IO u32	ICHR[4]	__attribute__ ((aligned(4)));		// �������� ��������� � ������� �������
	__IO u32	CH_CTRL[4];		// �������� �0 ���������� �������
	__IO u32	CH_CTRL1[4];	// �������� �1 ���������� �������
	__IO u32	CH_DTG[4];		// �������� �������� ������� �������
	__IO u8		BRKETR_CNTRL;	// ������� ���������� ������� BRK � ETR
	__IO u32	INTF	__attribute__ ((aligned(4)));			// ������� ������ �������
	__IO u32	INTE;			// ������� ������ ���������� ���������� ����������
	__IO u32	DMAE;			// ������� ���������� ���������� �������� DMA
	__IO u32	CH_CTRL2[4];	// �������� �2 ���������� �������
	__IO u32	ICHRn1[4];		// �������� ��������� � ������� c ������ ������� 
} TIMER_TypeDef;

#define TIMER1	((TIMER_TypeDef*) TIMER1_BASE)
#define TIMER2	((TIMER_TypeDef*) TIMER2_BASE)
#define TIMER3	((TIMER_TypeDef*) TIMER3_BASE)

typedef struct {
	u16	CNT_EN		: 1;	// ���������� ������ �������
	u16	ARRB_EN		: 1;	// ���������� ���������� ARR
	u16	WR_CMPL		: 1;	// ���� ��������� ������ � �������� CNT, ARR � PSC
	u16	DIR_DOWN	: 1;	// ���� ��������� �����
	u16	FDTS		: 2;	// ������� ������������� ������ FDTS
	u16	CNT_MODE	: 2;	// ����� ����� ��������� ��������
	u16	EVENT_SEL	: 4;	// ����� ��������� �������
	u16	__0			: 4;
} TIM_CTRL_TypeDef;

typedef struct {
	u32	CHFLTR	: 4;
	u32	CHSEL	: 2;
	u32	CHPSC	: 2;
	u32	OCCE	: 1;
	u32	OCCM	: 3;
	u32	BRKEN	: 1;
	u32	ETREN	: 1;
	u32	WRCMPL	: 1;
	u32	CAPnPWM	: 1;
	u32	__0		: 16;
} TIM_CH_CTRL_TypeDef;

typedef struct {
	u32	SELOE	: 2;
	u32	SELOUT	: 2;
	u32	INV		: 1;
	u32	__0		: 3;
	u32	NSELOE	: 2;
	u32	NSELOUT	: 2;
	u32	NINV	: 1;
	u32	__1		: 19;
} TIM_CH_CTRL1_TypeDef;

typedef struct {
	u32	CHSEL1	: 2;
	u32	CCR1_EN	: 1;
	u32	CRRRLD	: 1;
	u32	__0		: 28;
} TIM_CH_CTRL2_TypeDef;

typedef struct {
	u32	DTG		: 4;
	u32	EDTS	: 1;
	u32	__0		: 3;
	u32	DTGx	: 8;
	u32	__1		: 16;
} TIM_CH_DTG_TypeDef;

typedef struct {
	u8	BRK_INV		: 1;
	u8	ETR_INV		: 1;
	u8	ETR_PSC		: 2;
	u8	ETR_FILTER	: 4;
} TIM_BRKETR_CTRL_TypeDef;

typedef struct {
	u32	CNT_ZERO	: 1;
	u32	CNT_ARR		: 1;
	u32	ETR_RE		: 1;
	u32	ETR_FE		: 1;
	u32	BRK_HLD		: 1;
	u32	CCR_CAP		: 4;
	u32	CCR_REF		: 4;
	u32	CCR_CAP1	: 4;
	u32	__0			: 15;
} TIM_EVENT_TypeDef;

/*
	TIMER1
*/
__IO_REG(TIM1_CNT,		u16,			TIMER1_BASE + 0x00);
__IO_REG(TIM1_PSC,		u16,			TIMER1_BASE + 0x04);
__IO_REG(TIM1_ARR,		u16, 			TIMER1_BASE + 0x08);
__IO_REG(TIM1_CTRL,	TIM_CTRL_TypeDef,	TIMER1_BASE + 0x0C);

__IO_REG_ARRAY(TIM1_ICHR, 		4,	u32,					TIMER1_BASE + 0x10);
__IO_REG_ARRAY(TIM1_CH_CTRL,	4,	TIM_CH_CTRL_TypeDef,	TIMER1_BASE + 0x20);
__IO_REG_ARRAY(TIM1_CH_CTRL1,	4,	TIM_CH_CTRL1_TypeDef,	TIMER1_BASE + 0x30);
__IO_REG_ARRAY(TIM1_CH_DTG,		4,	TIM_CH_DTG_TypeDef,		TIMER1_BASE + 0x40);

__IO_REG(TIM1_BRKETR_CTRL,	TIM_BRKETR_CTRL_TypeDef,	TIMER1_BASE + 0x50);
__IO_REG(TIM1_INTF,			TIM_EVENT_TypeDef,			TIMER1_BASE + 0x54);
__IO_REG(TIM1_INTE,			TIM_EVENT_TypeDef,			TIMER1_BASE + 0x58);
__IO_REG(TIM1_DMAE,			TIM_EVENT_TypeDef,			TIMER1_BASE + 0x5C);

__IO_REG_ARRAY(TIM1_CH_CTRL2,	4,	TIM_CH_CTRL2_TypeDef,	TIMER1_BASE + 0x60);
__IO_REG_ARRAY(TIM1_ICHR1,		4,	u32,					TIMER1_BASE + 0x70);

/*
	TIMER2
*/
__IO_REG(TIM2_CNT,		u16,				TIMER2_BASE + 0x00);
__IO_REG(TIM2_PSC,		u16,				TIMER2_BASE + 0x04);
__IO_REG(TIM2_ARR,		u16, 				TIMER2_BASE + 0x08);
__IO_REG(TIM2_CTRL,		TIM_CTRL_TypeDef,	TIMER2_BASE + 0x0C);

__IO_REG_ARRAY(TIM2_ICHR, 		4,	u32,					TIMER2_BASE + 0x10);
__IO_REG_ARRAY(TIM2_CH_CTRL,	4,	TIM_CH_CTRL_TypeDef,	TIMER2_BASE + 0x20);
__IO_REG_ARRAY(TIM2_CH_CTRL1,	4,	TIM_CH_CTRL1_TypeDef,	TIMER2_BASE + 0x30);
__IO_REG_ARRAY(TIM2_CH_DTG,		4,	TIM_CH_DTG_TypeDef,		TIMER2_BASE + 0x40);

__IO_REG(TIM2_BRKETR_CTRL,	TIM_BRKETR_CTRL_TypeDef,	TIMER2_BASE + 0x50);
__IO_REG(TIM2_INTF,			TIM_EVENT_TypeDef,			TIMER2_BASE + 0x54);
__IO_REG(TIM2_INTE,			TIM_EVENT_TypeDef,			TIMER2_BASE + 0x58);
__IO_REG(TIM2_DMAE,			TIM_EVENT_TypeDef,			TIMER2_BASE + 0x5C);

__IO_REG_ARRAY(TIM2_CH_CTRL2,	4,	TIM_CH_CTRL2_TypeDef,	TIMER2_BASE + 0x60);
__IO_REG_ARRAY(TIM2_ICHR1,		4,	u32,					TIMER2_BASE + 0x70);

/*
	TIMER3
*/
__IO_REG(TIM3_CNT,		u16,				TIMER3_BASE + 0x00);
__IO_REG(TIM3_PSC,		u16,				TIMER3_BASE + 0x04);
__IO_REG(TIM3_ARR,		u16, 				TIMER3_BASE + 0x08);
__IO_REG(TIM3_CTRL,		TIM_CTRL_TypeDef,	TIMER3_BASE + 0x0C);

__IO_REG_ARRAY(TIM3_ICHR, 		4,	u32,					TIMER3_BASE + 0x10);
__IO_REG_ARRAY(TIM3_CH_CTRL,	4,	TIM_CH_CTRL_TypeDef,	TIMER3_BASE + 0x20);
__IO_REG_ARRAY(TIM3_CH_CTRL1,	4,	TIM_CH_CTRL1_TypeDef,	TIMER3_BASE + 0x30);
__IO_REG_ARRAY(TIM3_CH_DTG,		4,	TIM_CH_DTG_TypeDef,		TIMER3_BASE + 0x40);

__IO_REG(TIM3_BRKETR_CTRL,	TIM_BRKETR_CTRL_TypeDef,	TIMER3_BASE + 0x50);
__IO_REG(TIM3_INTF,			TIM_EVENT_TypeDef,			TIMER3_BASE + 0x54);
__IO_REG(TIM3_INTE,			TIM_EVENT_TypeDef,			TIMER3_BASE + 0x58);
__IO_REG(TIM3_DMAE,			TIM_EVENT_TypeDef,			TIMER3_BASE + 0x5C);

__IO_REG_ARRAY(TIM3_CH_CTRL2,	4,	TIM_CH_CTRL2_TypeDef,	TIMER3_BASE + 0x60);
__IO_REG_ARRAY(TIM3_ICHR1,		4,	u32,					TIMER3_BASE + 0x70);

#endif
