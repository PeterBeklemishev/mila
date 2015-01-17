#include "../MDR/inc/MDR32Fx.h"
#include "../MDR/cmsis/stdint.h"
#include "../MDR/cmsis/core_cm3.h"
#include "../MDR/inc/MDR32Fx.h"
#include "mila.h"
#include "timers.h"
#include "gpio.h"


//volatile uint32_t delay_int_time;

#define MILLIS_STEP 1

volatile int tep = 0xF;

void mila_init(void){
	//setup clocking for all PORTS
	ports_clock_enable();
	//enable global interrupts
	__enable_irq();
	//setup Timer1
	Timer1_Init();
}

void ports_clock_enable(void){
    MDR_RST_CLK->PER_CLOCK = 
    	PORTA_CLK | PORTB_CLK | PORTC_CLK | 
    	PORTD_CLK | PORTE_CLK | PORTF_CLK;
}

void delay(void){
	uint16_t idelaycounter,jdelaycounter;
	for(jdelaycounter=0;jdelaycounter<10;jdelaycounter++){
		for(idelaycounter=0; idelaycounter<60000; idelaycounter++) 
			__NOP;	
	}
}

uint32_t millis_time;

int millis(void){
	return millis_time;
}

//void delay_int(uint32_t delay_time){
//	delay_start_time = millis();
//	while ( (millis() - delay_start_time) > delay_time );
//}

MDR_PORT_TypeDef *port_from_pin(int pin){
	switch (pin){
		case 0x100: return PORTA;
		case 0x200: return PORTB;
		case 0x300: return PORTC;
		case 0x400: return PORTD;
		case 0x500: return PORTE;
		case 0x600: return PORTF;
	}
}
/*
MDR_PORT_TypeDef *port_from_virtual_pin(int pin){
	switch (pin){
		// PORTA 8 bits
		case 0: 
		case 1: 
		case 2: 
		case 3: 
		case 4: 
		case 5: 
		case 6: 
		case 7: 
		return PORTA;

		// PORTB 11 bits
		case 8: 
		case 9: 
		case 10: 
		case 11: 
		case 12: 
		case 13: 
		case 14: 
		case 15: 
		case 16: 
		case 17: 
		case 18: 
		return PORTB;

		//PORTC 3 bits
		case 19: 
		case 20: 
		case 21: 
		return PORTC;

		//PORTD 8 bits
		case 22: 
		case 23: 
		case 24: 
		case 25: 
		case 26: 
		case 27: 
		case 28: 
		case 29: 
		return PORTD;

		// PORTE 6 bits
		case 30: 
		case 31: 
		case 32: 
		case 33: 
		case 34: 
		case 35: 
		return PORTE;

		// PORTF 8 bits
		case 36: 
		case 37: 
		case 38: 
		case 39: 
		case 40: 
		case 41: 
		case 42: 
		case 43: 
		return PORTF;
	}
}
*/

MDR_PORT_TypeDef *port_from_virtual_pin(int pin){
	if (pin <=7) return PORTA;
	else if (pin<=18) return PORTB;
	else if (pin<=21) return PORTC;
	else if (pin<=29) return PORTD;
	else if (pin<=35) return PORTE;
	else if (pin<=43) return PORTF;
//	else ERROR;
}
/*
int bit_from_virtual_pin(int pin){
	switch (pin){
		// PORTA 8 bits
		case 0: return 0;
		case 1: return 1;
		case 2: return 2;
		case 3: return 3;
		case 4: return 4;
		case 5: return 5;
		case 6: return 6;
		case 7: return 7;

		// PORTB 10 bits
		case 8: return 0;
		case 9: return 1;
		case 10: return 2;
		case 11: return 3;
		case 12: return 4;
		case 13: return 5;
		case 14: return 6;
		case 15: return 7;
		case 16: return 8;
		case 17: return 9;

		//PORTC 3 bits
		case 19: return 0;
		case 20: return 1;
		case 21: return 2;

		//PORTD 8 bits
		case 22: return 0;
		case 23: return 1;
		case 24: return 2;
		case 25: return 3;
		case 26: return 4;
		case 27: return 5;
		case 28: return 6;
		case 29: return 7;

		// PORTE 6 bits
		case 30: return 0;
		case 31: return 1;
		case 32: return 2;
		case 33: return 3;
		case 34: return 6;
		case 35: return 7;

		// PORTF 8 bits
		case 36: return 0;
		case 37: return 1;
		case 38: return 2;
		case 39: return 3;
		case 40: return 4;
		case 41: return 5;
		case 42: return 6;
		case 43: return 7;
	}
}
*/
int bit_from_virtual_pin(int pin){
	if (pin <=7) return pin;
	else if (pin<=18) return pin-8;
	else if (pin<=21) return pin-18;
	else if (pin<=29) return pin-22;
	else if (pin<=35) return pin-30;
	else if (pin<=43) return pin-36; 
//	else ERROR;
}