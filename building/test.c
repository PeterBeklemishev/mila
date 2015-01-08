//#include <MDR32F9x.h>

#define LED_VD5 (1<<0) 
#define PORTB_CLK (1UL<<22)

uint16_t i;


void init(){
	MDR_RST_CLK->PER_CLOCK = PORTB_CLK;
	MDR_PORTB->OE = LED_VD5; 
	MDR_PORTB->FUNC = 0x00000000; 
	MDR_PORTB->ANALOG = 0x0000FFFF; 
	MDR_PORTB->PULL = (LED_VD5) << 16; 
	MDR_PORTB->PD = ~(LED_VD5); 
	MDR_PORTB->PWR = 0x55555555; 
	MDR_PORTB->GFEN = 0; 

}	


void cycle(){
	while(1){
		MDR_PORTB->RXTX &= ~LED_VD5; 
		for(i=0; i<10000; i++) __NOP;
		MDR_PORTB->RXTX |= LED_VD5; 
		for(i=0; i<10000; i++) __NOP;
	}
}
