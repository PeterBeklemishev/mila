#ifndef timer_h
#define timer_h

#include "../MDR/cmsis/stdint.h"

void Timer1_Init(void);

#define TIM1_CLK_EN (1UL << 24)
#define TIM2_CLK_EN (1UL << 25)
#define TIM3_CLK_EN (1UL << 26)

#define CNT_EN (1UL << 0)
#define CNT_ARR_EVENT_IE (1UL << 1)
#define CNT_ZERO_EVENT_IE (1UL << 0)

#endif