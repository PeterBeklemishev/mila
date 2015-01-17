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
	pinInit(B5,IN);
	pinInit(B6,IN);
	pinInit(E1,IN);
	pinInit(E3,IN);
	int i;
	for (i=8; i<12; i++) pinInit(i,OUT);
	portWrite(PORTB,0xFFFF);
	delay();
	delay();
	delay();
}

void cycle(){
	pinWrite(B0,1-pinRead(B5));
	pinWrite(B1,1-pinRead(B6));
	pinWrite(B2,1-pinRead(E1));
	pinWrite(B3,1-pinRead(E3));
}
