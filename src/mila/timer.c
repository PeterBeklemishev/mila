#include "timer.h"
#include "../MDR/inc/MDR32Fx.h"
#include "../MDR/cmsis/stdint.h"
#include "milasrv.h"
#include "mila.h"


void Timer1_Init(void){
	MDR_RST_CLK->PER_CLOCK |= TIMER1_CLK; 
	MDR_RST_CLK->TIM_CLOCK = 0x3 | TIM1_CLK_EN;
	MDR_TIMER1->PSG = 0x3e7;
	MDR_TIMER1->ARR = 0x3e7;
	MDR_TIMER1->IE |= CNT_ARR_EVENT_IE; 
//	MDR_TIMER1->IE |= CNT_ZERO_EVENT_IE; 
	MDR_TIMER1->CNTRL |= CNT_EN; 
	NVIC_EnableIRQ(Timer1_IRQn);
}

