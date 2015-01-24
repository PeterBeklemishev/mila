#ifndef gpio_h
#define gpio_h

#define	A0	0
#define	A1	1
#define	A2	2
#define	A3	3
#define	A4	4
#define	A5	5
#define	A6	6
#define	A7	7

#define	B0	8
#define	B1	9
#define	B2	10
#define	B3	11
#define	B4	12
#define	B5	13
#define	B6	14
#define	B7	15

#define	D0	16
#define	D1	17
#define	D2	18
#define	D3	19
#define	D4	20
#define	D5	21
#define	D6	22
#define	D7	23

#define	F0	24
#define	F1	25
#define	F2	26
#define	F3	27
#define	F4	28
#define	F5	29
#define	F6	30
#define	F7	31

#define PORTA 	MDR_PORTA
#define PORTB 	MDR_PORTB
#define PORTC 	MDR_PORTC
#define PORTD 	MDR_PORTD
#define PORTE 	MDR_PORTE
#define PORTF 	MDR_PORTF

#define HIGH 1
#define LOW 0

#define PORTA_CLK (1UL<<21)
#define PORTB_CLK (1UL<<22)
#define PORTC_CLK (1UL<<23)
#define PORTD_CLK (1UL<<24)
#define PORTE_CLK (1UL<<25)
#define PORTF_CLK (1UL<<29)

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

#define PORTA_PINS_NUMBER 8
#define PORTB_PINS_NUMBER 11
#define PORTC_PINS_NUMBER 3
#define PORTD_PINS_NUMBER 8
#define PORTE_PINS_NUMBER 6
#define PORTF_PINS_NUMBER 8

void pinInit(int, int);
void pinWrite(int, int);
int pinRead(int);
void portInit(MDR_PORT_TypeDef *, uint32_t);
void portWrite(MDR_PORT_TypeDef *, uint32_t);
uint32_t portRead(MDR_PORT_TypeDef *);

#endif
