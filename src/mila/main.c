#include "stdint.h"
#include "timers.h"
#include "mila.h"
#include "milasrv.h"
#include "MDR32F9x.h"
#include "gpio.h"

int main(){


//	CPU_init();
	
	mila_init(); // from file milasrv.c 
	
	init(); // from your awesome sketch
	
	while(1){
		cycle(); // from your awesome sketch
	}

return 0;
}

/*
080000f0 <cycle>:
 80000f0:	4a03      	ldr	r2, [pc, #12]	; (8000100 <cycle+0x10>)
 80000f2:	6813      	ldr	r3, [r2, #0]
 80000f4:	3301      	adds	r3, #1
 80000f6:	6013      	str	r3, [r2, #0]
 80000f8:	4a02      	ldr	r2, [pc, #8]	; (8000104 <cycle+0x14>)
 80000fa:	6013      	str	r3, [r2, #0]
 80000fc:	4770      	bx	lr
 80000fe:	bf00      	nop
 8000100:	20000008 	.word	0x20000008
 8000104:	40038000 	.word	0x40038000
 */