#include "stdint.h"
#include "timers.h"
#include "mila.h"
#include "milasrv.h"
#include "MDR32F9x.h"
#include "gpio.h"

int main(){
	
	mila_init(); // from file milasrv.c 

	init(); // from your awesome sketch

	while(1){
		cycle(); // from your awesome sketch
	}

	return 0;
}
