#include "../src/cmsis/stdint.h"
#include "../src/inc/MDR32Fx.h"
#include "gpio.h"
#include "milasrv.h"
#include "mila.h"

void pinInit(int pin, int mode){

	MDR_PORT_TypeDef *port = port_from_pin(uint8_t(pin>>8));
//	MDR_PORT_TypeDef *port = MDR_PORTB;
	int8_t bit = uint8_t(pin);

	if (mode == OUT){
		port->OE |= ( OE_OUT << bit );
		port->FUNC &= ( FUNC_GPIO << bit*2 );
		port->ANALOG |= ( ANALOG_OFF << bit );
		port->PULL |= (( PULL_ON << bit ) << 16 );
		port->PD &= ( PD_MODE_CDRV << bit );
		port->PWR |= ( PWR_SLOW << bit*2 );
		port->GFEN &= ( GFEN_OFF << bit );
	}

/*	if (mode = OUT_STUB){
		port->OE = 0xFFFFFFFF;
		port->FUNC = 0;
		port->ANALOG = 0xFFFFFFFF;
		port->PULL = 0xFFFF0000;
		port->PD = 0;
		port->PWR = 0x55555555;
		port->GFEN = 0;
	}
*/
}

void pinWrite(int pin, int val){

	MDR_PORT_TypeDef *port = port_from_pin(uint8_t(pin>>8));
//	MDR_PORT_TypeDef *port = MDR_PORTB;
	int8_t bit = uint8_t(pin);

	if (val == 1){
		port->RXTX |= ( 1 << bit );
	}

	else if (val == 0){
		port->RXTX &= ~( 1 << bit );
	}

}
