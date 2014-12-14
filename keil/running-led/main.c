
#include <MDR32F9x.h>

	// PINOUTS for LDM board:
	//
	// BTN SEL PC2
	// BTN UP PB5
	// BTN DOWN PE1
	// BTN LEFT PE3
	// BTN RIGHT PB6
	//
	// LED 5 PB0
	// LED 4 PB1
	// LED 7 PB2
	// LED 6 PB3

#define BUTTON_SELECT (1<<2) 
#define BUTTON_UP (1<<5)
#define BUTTON_DOWN (1<<1)
#define BUTTON_LEFT (1<<3)
#define BUTTON_RIGHT (1<<6)

#define LED_VD5 (1<<0) 
#define LED_VD4 (1<<1)
#define LED_VD7 (1<<2)
#define LED_VD6 (1<<3)

#define PORTB_CLK (1UL<<22)
#define PORTC_CLK (1UL<<23)
#define PORTE_CLK (1UL<<25)

volatile uint32_t count=0;

void GPIO_Init(){
	//enabling ports B,C,E clocking 
	MDR_RST_CLK->PER_CLOCK = PORTB_CLK | PORTC_CLK | PORTE_CLK;
	
	//OE acts the same way as DDR in AVR
	//FUNC selects pin operation mode: 00 -  GPIO, 01 - main, 02 - alternative
	//ANALOG turns of and off analog function mode: 0 - analog, 1 - digital
	//PULL turns on pullup (bits 16...31) or pulldown (bits 0...15): 1 - pullup\down on, 0 - off
	//PD turns Schmitt trigger for input on\off (bits 16...31): 0 off, 1 on; or changes mode for output (bits 0...15): 0 - controlled driver, 1 - open drain
	//PWR selects edge speed: 01 - slow (100 ns), 10 - fast (20 ns), 11 - max (10 ns)
	//GFEN turns input filter on\off: 0 - off, 1 - on
	
	
	MDR_PORTB->OE = LED_VD5 | LED_VD4 | LED_VD7 | LED_VD6; 
	MDR_PORTB->FUNC = 0x00000000; 
	MDR_PORTB->ANALOG = 0x0000FFFF; 
	MDR_PORTB->PULL = (LED_VD5 | LED_VD4 | LED_VD7 | LED_VD6 | BUTTON_UP | BUTTON_RIGHT) << 16; 
	MDR_PORTB->PD = ~(LED_VD5 | LED_VD4 | LED_VD7 | LED_VD6) | ((BUTTON_UP | BUTTON_RIGHT)<<16); 
	MDR_PORTB->PWR = 0x55555555; 
	MDR_PORTB->GFEN = 0; 
	
	MDR_PORTC->OE = 0x00000000; 
	MDR_PORTC->FUNC = 0x00000000; 
	MDR_PORTC->ANALOG = 0x0000FFFF; 
	MDR_PORTC->PULL = BUTTON_SELECT << 16; 
	MDR_PORTC->PD = BUTTON_SELECT << 16; 
	MDR_PORTC->PWR = 0x55555555; 
	MDR_PORTC->GFEN = 0; 

	MDR_PORTE->OE = 0x00000000; 
	MDR_PORTE->FUNC = 0x00000000; 
	MDR_PORTE->ANALOG = 0x0000FFFF; 
	MDR_PORTC->PULL = (BUTTON_DOWN | BUTTON_LEFT) << 16; 
	MDR_PORTC->PD = (BUTTON_DOWN | BUTTON_LEFT) << 16; 
	MDR_PORTE->PWR = 0x55555555; 
	MDR_PORTE->GFEN = 0; 
}

void Timer_Init(void){  
  MDR_RST_CLK->PER_CLOCK |= 1 << 14; 
  MDR_RST_CLK->TIM_CLOCK = (5 |(1 << 24));

  MDR_TIMER1->PSG = 0x3f;
  MDR_TIMER1->ARR = 0x3cf;

  MDR_TIMER1->IE = (1 << 1); 
  MDR_TIMER1->CNTRL = 1; 
  NVIC_EnableIRQ(Timer1_IRQn);
}

int leds[4] = {LED_VD6, LED_VD7, LED_VD4, LED_VD5};

void Timer1_IRQHandler(void){ //DOESN'T WORK!!!! :(:(:(:(:(:(:(:(:(:( 
//	count++;
//	if (count==4)count=0;
	count+=1;
	if (count==2)count=0;
	MDR_PORTB->RXTX = 0xFFFF*count;
	MDR_PORTB->RXTX = 0x0000;
  MDR_TIMER1->CNT = 0x0000;
  MDR_TIMER1->STATUS &= ~(1 << 1);
  NVIC_ClearPendingIRQ(Timer1_IRQn);
}

void delay(uint32_t data)
{
  uint32_t dt;

  for(dt=0;dt<data;dt++)
  {
    __NOP();
    __NOP();
    __NOP();
    __NOP();
  }
}

int main (void)
{

	GPIO_Init();
	Timer_Init();
	
	while(1) 
	{
		int i=0;
		for(i=0;i<4;i++){
			MDR_PORTB->RXTX |= leds[i]; 
			delay(100000);
		}
		for(i=0;i<4;i++){
			MDR_PORTB->RXTX &= ~leds[i]; 
			delay(100000);
		}
//	MDR_PORTB->RXTX = 0xFFFF;

//__delay(1000);
	}
	
}





