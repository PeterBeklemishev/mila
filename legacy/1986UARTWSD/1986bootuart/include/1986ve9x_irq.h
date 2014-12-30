#ifndef __IRQ_H
#define __IRQ_H

typedef enum
{
/*	Системные прерывания	*/
	NMI_IRQn = -14, 
	MemMamage_IRQn = -12,
	BusFault_IRQn = -11,
	UsageFault_IRQn = -10,
	SVCall_IRQn = -5,
	DebugMonitor_IRQn = -4,
	PendSV_IRQn = -2,
	SysTick_IRQn = -1,
/*	Прерывания периферии	*/
	CAN1_IRQn	= 0, /* CAN1 */ 
	CAN2_IRQn	= 1,
	USB_IRQn	= 2,
	DMA_IRQn	= 5,
	UART1_IRQn	= 6,
	UART2_IRQn	= 7,
	SSP1_IRQn	= 8,
	I2C_IRQn	= 10,
	PWR_IRQn	= 11,
	WWDG_IRQn	= 12,
	TIM1_IRQn	= 14, /* TIMER1 */
	TIM2_IRQn	= 15,
	TIM3_IRQn	= 16,
	ADC_IRQn	= 17,
	COMP_IRQn	= 19,
	SSP2_IRQn	= 20,
	RTC_IRQn	= 27,
	EXT1_IRQn	= 28,
	EXT2_IRQn	= 29,
	EXT3_IRQn	= 30,
	EXT4_IRQn	= 31
} IRQn_Type;

#define NVIC_BASE   (SCS_BASE +  0x0100) 

typedef struct
{
  __IO	u32 ISER[8];                      /* регистр флагов разрешения прерываний */
  		u32	__0[24];
  __IO	u32 ICER[8];                      /* регистр флагов запрета прерываний          */
  		u32	__1[24];
  __IO	u32 ISPR[8];                      /* */
  		u32	__2[24];
  __IO	u32	ICPR[8];                      /* */
  		u32	__3[24];
  __IO	u32	IABR[8];                      /* */
  		u32	__4[56];
  __IO	u8  IP[240];                      /* */
  		u32	__5[644];
  __O	u32	STIR;                         /* */
}  NVIC_TypeDef;

#define NVIC  ((NVIC_TypeDef*) NVIC_BASE)       //  NVIC configuration struct  

__forceinline static void NVIC_EnableIRQ(IRQn_Type IRQn)
{
  NVIC->ISER[((u32)(IRQn) >> 5)] = (1 << ((u32)(IRQn) & 0x1F)); /* разрешить прерывание */
}

__forceinline static void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  NVIC->ICER[((u32)(IRQn) >> 5)] = (1 << ((u32)(IRQn) & 0x1F)); /* запретить прерывание */
}

#endif
