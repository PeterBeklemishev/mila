#include <MDR32F9x.h>
#include "src/mila/mila.h"
#include "src/mila/gpio.h"
#include "src/mila/milasrv.h"
#include "src/mila/timers.h"

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

void init(){
	pinInit(B0,OUT);
	pinInit(B1,OUT);
	pinInit(B2,OUT);
	pinInit(B3,OUT);
	pinInit(B5,IN);
	pinInit(B6,IN);
	pinInit(E1,IN);
	pinInit(E3,IN);
}

void cycle(){
//	pinWrite(B0,pinRead(B5));
//	pinWrite(B1,pinRead(B6));
//	pinWrite(B2,pinRead(E1));
//	pinWrite(B3,pinRead(E3));
//	portWrite(PORTB,0xFFFF);
	pinWrite(B0,1);
	delay();
	pinWrite(B1,1);
	delay();
	pinWrite(B2,1);
	delay();

}
