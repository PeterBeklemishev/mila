#include "timer.h"
#include "../inc/MDR32Fx.h"
#include "../cmsis/stdint.h"
#include "milasrv.h"


void Timer1_Init(void){
	MDR_RST_CLK->PER_CLOCK |= 1 << 14; 
	MDR_RST_CLK->TIM_CLOCK = ( 0 | (1 << 24) );
	MDR_TIMER1->PSG = 0x3e7;
	MDR_TIMER1->ARR = 0x1f3f7;
	MDR_TIMER1->IE = (1 << 1); 
	MDR_TIMER1->CNTRL = 1; 
	NVIC_EnableIRQ(Timer1_IRQn);
}

