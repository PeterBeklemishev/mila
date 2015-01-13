#include "../MDR/inc/MDR32Fx.h"
#include "../MDR/cmsis/stdint.h"
#include "timers.h"
#include "milasrv.h"
#include "mila.h"

void Timer1_Init(void){
//	MDR_RST_CLK->PER_CLOCK |= TIMER1_CLK;
	MDR_RST_CLK->PER_CLOCK = 0xFFFFFFFF;
	MDR_RST_CLK->TIM_CLOCK = 0x3 | TIM1_CLK_EN;
	MDR_TIMER1->PSG = 0x0;
	MDR_TIMER1->ARR = 0xf423f;
	MDR_TIMER1->IE |= CNT_ARR_EVENT_IE;
	MDR_TIMER1->CNTRL |= CNT_EN;
	NVIC_EnableIRQ(Timer1_IRQn);
}

void Timer2_Init(void){
//	MDR_RST_CLK->PER_CLOCK |= TIMER1_CLK;
	MDR_RST_CLK->PER_CLOCK = 0xFFFFFFFF;
	MDR_RST_CLK->TIM_CLOCK = 0x1 | TIM2_CLK_EN;
	MDR_TIMER1->PSG = 0x5;
	MDR_TIMER1->ARR = 0xf3f;
	MDR_TIMER1->IE |= CNT_ARR_EVENT_IE;
	MDR_TIMER1->CNTRL |= CNT_EN;
	NVIC_EnableIRQ(Timer2_IRQn);
}