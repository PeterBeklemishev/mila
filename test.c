#include <MDR32F9x.h>
#include <mila.h>
#include <gpio.h>
#include <milasrv.h>
#include <timers.h>

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
	int i;
	for (i=8; i<12; i++) pinInit(i,OUT);
//	pinInit(B1,OUT);
//	pinInit(B2,OUT);
//	pinInit(B3,OUT);
//	pinInit(B5,IN);
//	pinInit(B6,IN);
	pinInit(E1,IN);
	pinInit(E3,IN);
	portWrite(PORTB,0xFFFF);
	delay();
	delay();
	delay();
}

void cycle(){
	if (pinRead(B5) == 1) pinWrite(B0,0);
	else pinWrite(B0,1);
	if (pinRead(B6) == 1) pinWrite(B1,0);
	else pinWrite(B1,1);
	if (pinRead(E1) == 1) pinWrite(B2,0);
	else pinWrite(B2,1);
	if (pinRead(E3) == 1) pinWrite(B3,0);
	else pinWrite(B3,1);
}
