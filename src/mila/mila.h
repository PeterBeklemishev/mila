#ifndef mila_h
#define mila_h

//#include "gpio.h"

#define CAN1_CLK (1UL<<0)
#define CAN2_CLK (1UL<<1)
#define USB_CLK (1UL<<2)
#define EEPROM_CLK (1UL<<3)
#define RST_CLK (1UL<<4)
#define DMA_CLK (1UL<<5)
#define UART1_CLK (1UL<<6)
#define UART2_CLK (1UL<<7)
#define SPI1_CLK (1UL<<8)
#define I2C1_CLK (1UL<<10)
#define POWER_CLK (1UL<<11)
#define WWDT_CLK (1UL<<12)
#define IWDT_CLK (1UL<<13)
#define TIMER1_CLK (1UL<<14)
#define TIMER2_CLK (1UL<<15)
#define TIMER3_CLK (1UL<<16)
#define ADC_CLK (1UL<<17)
#define DAC_CLK (1UL<<18)
#define COMP_CLK (1UL<<19)
#define SPI2_CLK (1UL<<20)
#define BKP_CLK (1UL<<27)
#define EXTBUS_CLK (1UL<<30)

#define IN 0
#define OUT 1

void init(void);
void cycle(void);
void mila_init(void);

#endif
