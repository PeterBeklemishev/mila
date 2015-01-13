#include <MDR32F9x.h>
#include "src/mila/mila.h"
#include "src/mila/gpio.h"
#include "src/mila/milasrv.h"
#include "src/MDR/cmsis/core_cm3.h"
#include "src/mila/timer.h"


//void zauza(void){
//	MDR_PORTB->RXTX = 0xF;
//};

//void Timer1_IRQHandler(void){
        //      uint32_t m = delay_int_time;
        //      m--;
        //      uint32_t counter=0;
        //MDR_PORTB->RXTX = 0xA;
        //      counter+=1; 
//      delay_int_time++;
//      if(delay_int_time>2)delay_int_time=0;
//      MDR_PORTB->RXTX=0xFF;
//        zauza();
//        MDR_TIMER1->CNT = 0x0000;
 //       MDR_TIMER1->STATUS &= ~(1 << 1);
//        NVIC_ClearPendingIRQ(Timer1_IRQn);
        //      delay_int_time = m;
//}

void init(){

	pinInit(B0,OUT);
	pinInit(B1,OUT);
	pinInit(B2,OUT);
	pinInit(B3,OUT);

}

void cycle(){
//	NVIC_SetPendingIRQ(Timer1_IRQn);
//	__enable_irq();
//	pinWrite(B0,1);
//	delay_int(1000);
	delay();
//	pinWrite(B1,1);
//	delay_int(1000);
	delay();
//	pinWrite(B2,1);
//	delay_int(1000);
	delay();
//	pinWrite(B3,1);
//	delay_int(1000);
	delay(); 
//	pinWrite(B0,0);
//	delay_int(1000);
//	delay();
//	pinWrite(B1,0);
//	delay_int(1000);
//	delay();
//	pinWrite(B2,0);
//	delay_int(1000);
//	delay();
//	pinWrite(B3,0);
//	delay_int(1000);
//	delay();
//	MDR_PORTB->RXTX = delay_int_time;
}
