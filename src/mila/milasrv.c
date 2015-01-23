#include "../MDR/inc/MDR32Fx.h"
#include "../MDR/cmsis/stdint.h"
#include "../MDR/cmsis/core_cm3.h"
#include "milasrv.h"
#include "mila.h"
#include "timers.h"
#include "gpio.h"


//volatile uint32_t delay_int_time;

#define MILLIS_STEP 1

volatile int tep = 0xF;
volatile int a;

void mila_init(void){
	//setup clocking for all PORTS
	ports_clock_enable();
	//enable global interrupts
	__enable_irq();
	//setup Timer1
	Timer1_Init();
	Timer2_Init();
	Timer3_Init();
}

void ports_clock_enable(void){
    MDR_RST_CLK->PER_CLOCK = 
    	PORTA_CLK | PORTB_CLK | PORTC_CLK | 
    	PORTD_CLK | PORTE_CLK | PORTF_CLK;
}

void delay(void){
	uint16_t idelaycounter,jdelaycounter;
	for(jdelaycounter=0;jdelaycounter<100;jdelaycounter++){
		for(idelaycounter=0; idelaycounter<6000; idelaycounter++)
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

MDR_PORT_TypeDef *port_from_virtual_pin(int pin){
		 if (pin <=7) return PORTA;
	else if (pin<=15) return PORTB;
	else if (pin<=23) return PORTD;
	else if (pin<=31) return PORTF;
//	else ERROR;
}