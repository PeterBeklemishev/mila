#include "mila.h"
#include "../MDR/inc/MDR32Fx.h"
#include "timer.h"
#include "gpio.h"
#include "../MDR/cmsis/stdint.h"
#include "../MDR/cmsis/core_cm3.h"
#include "../MDR/inc/MDR32Fx.h"

//volatile uint32_t delay_int_time;

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

/*
uint32_t millis_time;
int millis_step = 1;

int millis(void){
	return millis_time;
}

ISR(Timer1){
	millis_time += millis_step;
	// clear timer status
	// clear pending interrupt
}

void delay_int(uint32_t delay_time){
	delay_start_time = millis();
	while ( (millis() - delay_start_time) > delay_time );
}

*/
