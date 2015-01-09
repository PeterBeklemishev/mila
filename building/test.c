#include <MDR32F9x.h>
#include "mila.h"
#include "gpio.h"
#include "mila_private.h"

uint16_t i,j;


void init(){
	pinInit(B0,OUT);
	pinInit(B1,OUT);
	pinInit(B2,OUT);
	pinInit(B3,OUT);
	pinWrite(B0,1);
	for(j=0;j<100;j++){
		for(i=0; i<60000; i++) __NOP;	
	}
	pinWrite(B0,0);
	for(j=0;j<100;j++){
		for(i=0; i<60000; i++) __NOP;	
	}
}	


void cycle(){
	while(1){
		pinWrite(B0,1);
		pinWrite(B1,1);
		pinWrite(B2,1);
		pinWrite(B3,1); 
		for(j=0;j<100;j++){
			for(i=0; i<60000; i++) __NOP;	
		}
		pinWrite(B0,0);
		pinWrite(B1,0);
		pinWrite(B2,0);
		pinWrite(B3,0);
		for(j=0;j<100;j++){
			for(i=0; i<60000; i++) __NOP;	
		}
	}
}
