#include <mila.h>
#include "../src/inc/MDR32Fx.h"
#include <timer.h>
#include "../src/cmsis/stdint.h"

volatile uint16_t delay_int_time;

void mila_init(void){
	
	//setup clocking for all PORTS
	MDR_RST_CLK->PER_CLOCK = 
		PORTA_CLK | 
		PORTB_CLK | 
		PORTC_CLK | 
		PORTD_CLK | 
		PORTE_CLK | 
		PORTF_CLK;

	//setup Timer1
//	Timer1_Init();
	MDR_RST_CLK->PER_CLOCK |= 1 << 14; 
	MDR_RST_CLK->TIM_CLOCK = ( 0 | (1 << 24) );
	MDR_TIMER1->PSG = 0x3e7;
	MDR_TIMER1->ARR = 0x1;
	MDR_TIMER1->IE = (1 << 1); 
	MDR_TIMER1->CNTRL = 1; 
	NVIC_EnableIRQ(Timer1_IRQn);
	__enable_irq();
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

void delay_int(int time){
	delay_int_time = time;
	while (delay_int_time>0);
}

void Timer1_IRQHandler(void){
//	uint32_t m = delay_int_time;
 // 	m--;
//	uint32_t counter=0;
	MDR_PORTB->RXTX = 0xF;
//	counter+=1; 
	MDR_TIMER1->CNT = 0x0000;
	MDR_TIMER1->STATUS &= ~(1 << 1);
	NVIC_ClearPendingIRQ(Timer1_IRQn);

//	delay_int_time = m;
}