#ifndef __CLOCK_H
#define __CLOCK_H

#include "common.h"

#define RST_CLOCK_BASE	(PERIPH_BASE + 0x020000)

typedef struct {
	__I  u8		CLOCK_STATUS;	// регистр состояния блока управления частотой
	__IO u16	PLL_CONTROL		__attribute__ ((aligned(4)));	// регистр управления PLL
	__IO u8		HS_CONTROL		__attribute__ ((aligned(4)));
	__IO u16	CPU_CLOCK		__attribute__ ((aligned(4)));
	__IO u16	USB_CLOCK		__attribute__ ((aligned(4)));
	__IO u16	ADC_CLOCK		__attribute__ ((aligned(4)));
	__IO u16	RTC_CLOCK		__attribute__ ((aligned(4)));
	__IO u32	PER_CLOCK		__attribute__ ((aligned(4)));
	__IO u32	CAN_CLOCK;
	__IO u32	TIM_CLOCK;
	__IO u32	UART_CLOCK;
	__IO u32	SSP_CLOCK;
} RST_CLK_TypeDef;

#define RST_CLOCK ((RST_CLK_TypeDef*) RST_CLOCK_BASE)

typedef struct {
	u8	USB_RDY : 1;	// флаг готовности PLL USB
	u8	CPU_RDY	: 1;	// флаг готовности PLL CPU
	u8	HSE_RDY	: 1;	// флаг готовности генератора HSE
	u8	__0		: 5;
} CLOCK_STATUS_TypeDef;

typedef struct {
	u16	USB_ON	: 1;	// бит включения PLL USB
	u16	USB_RLD	: 1;	// бит перезапуска PLL USB (установить после изменения USB_MUL)
	u16	CPU_ON	: 1;	// бит включения PLL CPU
	u16	CPU_RLD	: 1;	// бит перезапуска PLL CPU (установить после изменения CPU_MUL)
	u16	USB_MUL	: 4;	// коэффициент умножения для PLL USB
	u16	CPU_MUL	: 4;	// коэффициент умножения для PLL CPU
	u16	__0		: 4;
} PLL_CONTROL_TypeDef;

typedef struct {
	u8	HSE_ON	: 1;	// бит влючения HSE
	u8	HSE_OSC	: 1;	// режим HSE : 0 - XTAL, 1 - XGEN
	u8	__0		: 6;
} HS_CONTROL_TypeDef;

#define	CPU_C1(n)			((u16)(n) & 0x03)
#define CPU_C2(n)			(((u16)(n) & 0x03) << 2)
#define	CPU_C3(n)			(((u16)(n) & 0x0F) << 4)
#define HCLK_SEL(n)			(((u16)(n) & 0x03) << 8)

typedef struct {
	u16	C1_SEL		: 2;
	u16	C2_SEL		: 1;
	u16	__0			: 1;
	u16	C3_SEL		: 4;
	u16	HCLK_SEL	: 2;
	u16	__1			: 6;
} CPU_CLOCK_TypeDef;

typedef struct {
	u16	C1_SEL	: 2;
	u16	C2_SEL	: 1;
	u16	__0		: 1;
	u16	C3_SEL	: 1;
	u16	__1		: 3;
	u16	CLK_EN	: 1;
	u16	__2		: 7;
} USB_CLOCK_TypeDef;

typedef struct {
	u16	C1_SEL	: 2;
	u16	__0		: 2;
	u16	C2_SEL	: 2;
	u16	__1		: 2;
	u16	C3_SEL	: 4;
	u16	__2		: 1;
	u16	CLK_EN	: 1;
	u16	__3		: 2;
} ADC_CLOCK_TypeDef;

typedef struct {
	u16	HSE_SEL		: 4;
	u16	HSI_SEL		: 4;
	u16	HSE_RTC_EN	: 1;
	u16	HSI_RTC_EN	: 1;
	u16	__0	: 6;
} RTC_CLOCK_TypeDef;

typedef struct {
	u32	CAN1_BRG	: 8;
	u32	CAN2_BRG	: 8;
	u32	__0	: 8;
	u32	CAN1_CLK_EN	: 1;
	u32	CAN2_CLK_EN	: 1;
	u32	__1	: 6;
} CAN_CLOCK_TypeDef;

typedef struct {
	u32	TIM1_BRG	: 8;
	u32	TIM2_BRG	: 8;
	u32	TIM3_BRG	: 8;
	u32	TIM1_CLK_EN	: 1;
	u32	TIM2_CLK_EN	: 1;
	u32	TIM3_CLK_EN	: 1;
	u32	__0	: 5;
} TIM_CLOCK_TypeDef;

typedef struct {
	u32	UART1_BRG		: 8;
	u32	UART2_BRG		: 8;
	u32	__0		: 8;
	u32	UART1_CLK_EN	: 1;
	u32	UART2_CLK_EN	: 1;
	u32	__1		: 5;
} UART_CLOCK_TypeDef;

typedef struct {
	u32	SSP1_BRG		: 8;
	u32	SSP2_BRG		: 8;
	u32	__0		: 8;
	u32	SSP1_CLK_EN		: 1;
	u32	SSP2_CLK_EN		: 1;
	u32	__1		: 5;
} SSP_CLOCK_TypeDef;

typedef enum {
	nCAN1	= 0,
	nCAN2	= 1,
	nUSB	= 2,
	nEEPROM_CNTRL = 3,
	nRST_CLK	= 4,
	nDMA	= 5,
	nUART1	= 6,
	nUART2	= 7,
	nSPI1	= 8,
	nI2C1	= 10,
	nPOWER	= 11,
	nWWDT	= 12,
	nIWDT	= 13,
	nTIMER1	= 14,
	nTIMER2	= 15,
	nTIMER3	= 16,
	nADC	= 17,
	nDAC	= 18,
	nCOMP	= 19,
	nSPI2	= 20,
	nPORTA	= 21,
	nPORTB	= 22,
	nPORTC	= 23,
	nPORTD	= 24,
	nPORTE	= 25,
	nBKP	= 27,
	nPORTF	= 29,
	nEXT_BUS_CTRL	= 30
} PERNUM_TypeDef;

__RO_REG(CLOCK_STATUS,	CLOCK_STATUS_TypeDef,	RST_CLOCK_BASE + 0x00);
__IO_REG(PLL_CONTROL,	PLL_CONTROL_TypeDef,	RST_CLOCK_BASE + 0x04);
__IO_REG(HS_CONTROL,	HS_CONTROL_TypeDef,		RST_CLOCK_BASE + 0x08);
__IO_REG(CPU_CLOCK,		CPU_CLOCK_TypeDef,		RST_CLOCK_BASE + 0x0C);
__IO_REG(USB_CLOCK,		USB_CLOCK_TypeDef,		RST_CLOCK_BASE + 0x10);
__IO_REG(ADC_CLOCK,		ADC_CLOCK_TypeDef,		RST_CLOCK_BASE + 0x14);
__IO_REG(RTC_CLOCK,		RTC_CLOCK_TypeDef,		RST_CLOCK_BASE + 0x18);
__IO_REG_BIT(PER_CLOCK,	32,						RST_CLOCK_BASE + 0x1C);
__IO_REG(CAN_CLOCK,		CAN_CLOCK_TypeDef,		RST_CLOCK_BASE + 0x20);
__IO_REG(TIM_CLOCK,		TIM_CLOCK_TypeDef,		RST_CLOCK_BASE + 0x24);
__IO_REG(UART_CLOCK,	UART_CLOCK_TypeDef,		RST_CLOCK_BASE + 0x28);
__IO_REG(SSP_CLOCK,		SSP_CLOCK_TypeDef,		RST_CLOCK_BASE + 0x2C);
	
	 
#endif
