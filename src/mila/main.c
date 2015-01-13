#include "../MDR/cmsis/stdint.h"
#include "timers.h"
#include "mila.h"
#include "milasrv.h"
#include "MDR32F9x.h"
#include "gpio.h"

int main(){

	mila_init();

	init();
	
	for(;;){
		cycle();
	}

return 0;
}