#ifndef timer_h
#define timer_h

#include "../MDR/cmsis/stdint.h"

#define TIM1_CLK_EN 		(1 << 24)
#define TIM2_CLK_EN 		(1 << 25)
#define TIM3_CLK_EN 		(1 << 26)

#define CNT_EN 				(1 << 0)
#define CNT_ARR_EVENT_IE 	(1 << 1)
#define CNT_ZERO_EVENT_IE 	(1 << 0)

void Timer1_Init(void);
void Timer2_Init(void);
void Timer1_IRQHandler(void);
void Timer2_IRQHandler(void);

#endif