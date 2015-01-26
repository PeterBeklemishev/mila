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
	portInit(PORTB,OUT); 	//проверка инициализации порта
	pinInit(B5,IN);		//проверка инициализации пинов поверх инициализированного порта
	pinInit(B6,IN);		

	portWrite(PORTB,0xF);	//проверка записи в порт
	delay();
	int i=8;
	for(i=8;i<12;i++){
		pinWrite(i,0);	//проверка записи в пины по виртуальным номерам
		delay();
	}
	pinWrite(B0,1); 	//проверка записи в пины по названию "порт-пин"
	delay();
	pinWrite(B1,HIGH); 	
	delay();
	pinWrite(B2,1); 	
	delay();
	pinWrite(B3,1); 	
	delay();
	
	portWrite(PORTB,0);
	delay();
}

void cycle(){
	pinWrite(8,1-pinRead(13));	//проверка чтения пина по виртуальному номеру
	pinWrite(B3,1-pinRead(B6));	//проверка чтения пина по названию "порт-пин"
}
