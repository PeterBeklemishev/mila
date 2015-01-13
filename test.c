#include <MDR32F9x.h>
#include "src/mila/mila.h"
#include "src/mila/gpio.h"
#include "src/mila/milasrv.h"
#include "src/mila/timers.h"

void init(){
	pinInit(B0,OUT);
	pinInit(B1,OUT);
	pinInit(B2,OUT);
	pinInit(B3,OUT);
}

void cycle(){
		__enable_irq();
//	NVIC_SetPendingIRQ(Timer1_IRQn);
	delay();
	delay();
	delay();
	delay();
/*	pinWrite(B0,1);
	delay();
	pinWrite(B1,1);
	delay();
	pinWrite(B2,1);
	delay();
	pinWrite(B3,1);
	delay(); 
	pinWrite(B0,0);
	delay();
	pinWrite(B1,0);
	delay();
	pinWrite(B2,0);
	delay();
	pinWrite(B3,0);
	delay();
*/	
}
