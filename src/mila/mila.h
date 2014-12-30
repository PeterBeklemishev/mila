#ifndef mila_h
#define mila_h

#include "gpio.h"

#define PORTA_CLK (1UL<<21)
#define PORTB_CLK (1UL<<22)
#define PORTC_CLK (1UL<<23)
#define PORTD_CLK (1UL<<24)
#define PORTE_CLK (1UL<<25)
#define PORTF_CLK (1UL<<26)

#define OE_IN 0
#define OE_OUT 1
#define FUNC_GPIO 0
#define FUNC_MAIN 1
#define FUNC_ALT 2
#define ANALOG_ON 0
#define ANALOG_OFF 1
#define PULL_ON 1
#define PULL_OFF 0
#define PD_SCHM_ON 1
#define PD_SCHM_OFF 0
#define PD_MODE_CDRV 0
#define PD_MODE_ODR 1
#define PWR_SLOW 1
#define PWR_FAST 2
#define PWR_MAX 3
#define GFEN_OFF 0
#define GFEN_ON 1

#define IN 0
#define OUT 1
#define OUT_STUB 2

void init(void);
void cycle(void);
void mila_init(void);

#endif
