#ifndef mila_private_h
#define mila_private_h

#include "../MDR/inc/MDR32Fx.h"

void ports_clock_enable(void);
MDR_PORT_TypeDef *port_from_pin(uint16_t pin);
void mila_init(void);
void delay(void);
void delay_int(uint32_t);
void Timer1_IRQHandler(void);
int bit_from_virtual_pin(int);
MDR_PORT_TypeDef *port_from_virtual_pin(int);
volatile int tep;
//volatile uint32_t delay_int_time;

#endif
