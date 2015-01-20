#include <MDR32F9x.h>
#include <mila.h>
#include <gpio.h>
#include <milasrv.h>
#include <timers.h>

	// BTN SEL PC2          // LED 5 PB0
	// BTN UP PB5           // LED 4 PB1
	// BTN DOWN PE1         // LED 7 PB2
	// BTN LEFT PE3         // LED 6 PB3
	// BTN RIGHT PB6

void init(){
	int i=0;
	for (i=8; i<12; i++) pinInit(i,OUT);
	//portWrite(PORTB,0xF);
	//delay();
//	delay();
//	delay();
}



void cycle(){
	pinWrite(B0,1);
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
}
