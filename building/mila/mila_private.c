#include "mila.h"
#include "../src/inc/MDR32Fx.h"


void mila_init(void){
	//setup clocking for all PORTS
	MDR_RST_CLK->PER_CLOCK = PORTA_CLK | PORTB_CLK | PORTC_CLK | PORTD_CLK | PORTE_CLK | PORTF_CLK;
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