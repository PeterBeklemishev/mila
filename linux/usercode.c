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
	portInit(PORTB,OUT);
	pinInit(B5,IN);
	pinInit(B6,IN);

	portWrite(PORTB,0xF);
	delay();
	int i=8;
	for(i=8;i<12;i++){
		pinWrite(i,0);
		delay();
	}
	for(i=8;i<12;i++){
		pinWrite(i,1);
		delay();
	}
	portWrite(PORTB,0);
	delay();
}

void cycle(){
	pinWrite(B0,1-pinRead(B5));
	pinWrite(B3,1-pinRead(B6));
}
