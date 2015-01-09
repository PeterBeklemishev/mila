#include "../src/cmsis/stdint.h"
#include <mila.h>
#include <mila_private.h>
#include <MDR32F9x.h>
#include <gpio.h>


void mila_init();

int main(){

	init();
	
	for(;;){
		cycle();
	}

return 0;
}
