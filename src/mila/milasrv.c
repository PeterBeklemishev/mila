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
	//enable global interrupts
	__enable_irq();
	//setup clocking for all PORTS
	ports_clock_enable();
	//setup Timer1
	Timer1_Init();
}

MDR_PORT_TypeDef *port_from_pin(int pin){
	switch (pin){
		case 0x100: return MDR_PORTA;
		case 0x200: return MDR_PORTB;
		case 0x300: return MDR_PORTC;
		case 0x400: return MDR_PORTD;
		case 0x500: return MDR_PORTE;
		case 0x600: return MDR_PORTF;
	}
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

void Timer1_IRQHandler(void) {
//	millis_time += MILLIS_STEP;
	MDR_PORTB->RXTX = 0xF;
	tep = 0xF-tep;
	MDR_TIMER1->CNT = 0x0000;
    MDR_TIMER1->STATUS &= ~(1 << 1);
    NVIC_ClearPendingIRQ(Timer1_IRQn);
}

void Timer2_IRQHandler(void) {
//	millis_time += MILLIS_STEP;
	MDR_PORTB->RXTX = 0xF;
	tep = 0xF-tep;
	MDR_TIMER2->CNT = 0x0000;
    MDR_TIMER2->STATUS &= ~(1 << 1);
    NVIC_ClearPendingIRQ(Timer2_IRQn);
}

//void delay_int(uint32_t delay_time){
//	delay_start_time = millis();
//	while ( (millis() - delay_start_time) > delay_time );
//}


