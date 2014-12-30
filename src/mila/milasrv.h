#ifndef mila_private_h
#define mila_private_h

#include "../inc/MDR32Fx.h"

MDR_PORT_TypeDef *port_from_pin(uint8_t pin);
void mila_init(void);
void delay(void);
void delay_int(int);

//volatile uint16_t delay_int_time;

#endif
