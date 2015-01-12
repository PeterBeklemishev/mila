#ifndef mila_h
#define mila_h

#include "gpio.h"

#define PORTA_CLK (1UL<<21)
#define PORTB_CLK (1UL<<22)
#define PORTC_CLK (1UL<<23)
#define PORTD_CLK (1UL<<24)
#define PORTE_CLK (1UL<<25)
#define PORTF_CLK (1UL<<29)

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
