#include <MDR32F9x.h>
#include "mila.h"
#include "gpio.h"
#include "milasrv.h"

void init(){

	pinInit(B0,OUT);
	pinInit(B1,OUT);
	pinInit(B2,OUT);
	pinInit(B3,OUT);

}	


void cycle(){

/*	pinWrite(B0,1);
	delay_int(1000);
	pinWrite(B1,1);
	delay_int(1000);
	pinWrite(B2,1);
	delay_int(1000);
	pinWrite(B3,1);
	delay_int(1000); 
	pinWrite(B0,0);
	delay_int(1000);
	pinWrite(B1,0);
	delay_int(1000);
	pinWrite(B2,0);
	delay_int(1000);
	pinWrite(B3,0);
	delay_int(1000);
*/	
}
