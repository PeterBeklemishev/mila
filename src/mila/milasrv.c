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

MDR_PORT_TypeDef *port_from_pin(uint8_t pin){
	switch (pin){
		case 1: return MDR_PORTA;
		case 2: return MDR_PORTB;
		case 3: return MDR_PORTC;
		case 4: return MDR_PORTD;
		case 5: return MDR_PORTE;
		case 6: return MDR_PORTF;
	}
}

void delay(void){
	uint16_t idelaycounter,jdelaycounter;
	for(jdelaycounter=0;jdelaycounter<10;jdelaycounter++){
		for(idelaycounter=0; idelaycounter<60000; idelaycounter++) 
			__NOP;	
	}
}

void delay_int(uint32_t time){
//	delay_int_time = time;
//	while (delay_int_time>0);
}

