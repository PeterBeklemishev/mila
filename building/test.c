#include <MDR32F9x.h>
#include "mila.h"
#include "gpio.h"
#include "mila_private.h"

uint16_t i;


void init(){
	pinInit(B0,OUT);
}	


void cycle(){
	while(1){
		pinWrite(B0,1); 
		for(i=0; i<60000; i++) __NOP;
		pinWrite(B0,0);
		for(i=0; i<60000; i++) __NOP;
	}
}
