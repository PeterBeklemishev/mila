#ifndef mila_private_h
#define mila_private_h

#include "../MDR/inc/MDR32Fx.h"

MDR_PORT_TypeDef *port_from_pin(uint16_t pin);
void mila_init(void);
void delay(void);
void delay_int(uint32_t);
void Timer1_IRQHandler(void);

//volatile uint32_t delay_int_time;

#endif
