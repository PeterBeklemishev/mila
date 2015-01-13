#include "../MDR/cmsis/stdint.h"
#include "timer.h"
#include "mila.h"
#include "milasrv.h"
#include "MDR32F9x.h"
#include "gpio.h"




int main(){

	mila_init();

	init();
	
	for(;;){
		cycle();
	}

return 0;
}


void Timer2_IRQHandler(void){
	return;
}

void Timer1_IRQHandler(void) {
        //      uint32_t m = delay_int_time;
        //      m--;
        //      uint32_t counter=0;
        //MDR_PORTB->RXTX = 0xA;
        //      counter+=1; 
//      delay_int_time++;
//      if(delay_int_time>2)delay_int_time=0;
//      MDR_PORTB->RXTX=0xFF;
//        zauza();
        MDR_TIMER1->CNT = 0x0000;
        MDR_TIMER1->STATUS &= ~(1 << 1);
        NVIC_ClearPendingIRQ(Timer1_IRQn);
        //      delay_int_time = m;
}

