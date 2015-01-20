#include "stdint.h"
#include "MDR32Fx.h"
#include "gpio.h"
#include "milasrv.h"
#include "mila.h"

/**
  ***************************************
    *	pins section
  ***************************************
*/

void pinInit(int pin, int mode){

  MDR_PORT_TypeDef *port;
  port = port_from_virtual_pin(pin);
  int bit = 0b00111 & pin;
  
 // port = (0b11000 & pin) >= 16 ? ((0b11000 & pin) == 24 ? PORTF : PORTD) : ((0b11000 & pin) == 8 ? PORTB : PORTA);

	if (mode == OUT){
		port->OE |= ( OE_OUT << bit );
		port->ANALOG |= ( ANALOG_OFF << bit );
		port->PULL |= (( PULL_ON << bit ) << 16 );
		port->PD &= ( PD_MODE_CDRV << bit );
		port->PWR |= ( PWR_SLOW << bit*2 );
	}
	
	else if (mode == IN){
    port->OE &= ( OE_IN << bit );
    port->ANALOG |= ( ANALOG_OFF << bit );
    port->PULL |= (( PULL_ON << bit ) << 16 );
    port->PD |= (( PD_SCHM_ON << bit ) << 16 );
    port->PWR |= ( PWR_SLOW << bit*2 );
	}

}

void pinWrite(int pin, int val){

  MDR_PORT_TypeDef *port = port_from_virtual_pin(pin);
  int bit = 0b00111 & pin;
  

	if (val == 1){
		port->RXTX |= ( 1 << bit );
	}

	else if (val == 0){
		port->RXTX &= ~( 1 << bit );
	}

  //else ERROR;
}

int pinRead(int pin){

  MDR_PORT_TypeDef *port = port_from_virtual_pin(pin);
  int bit = 0b00111 & pin;

  bit = bit_from_virtual_pin(pin);
 
  if (port->RXTX & (1 << bit)){
    return 1;
  } 

  else if (~(port->RXTX & (1 << bit))){
    return 0;
  }
}


/**
  ***************************************
    *	ports section
  ***************************************
*/

// portInit(port, OUT/IN); ----- any PORT

void portInit(MDR_PORT_TypeDef *port, uint32_t mode){
  if (mode == OUT){
    port->OE |= 0xFFFFFFFF;
    port->FUNC &= 0x0;
    port->ANALOG |= 0xFFFFFFFF;
    port->PULL |= 0xFFFF0000;
    port->PD &= 0x0000FFFF;
    port->PWR |= 0x55555555;
    port->GFEN &= 0x0;
  }
  else if (mode == IN){
    port->OE |= 0x0;
    port->FUNC &= 0x0;
    port->ANALOG |= 0xFFFFFFFF;
    port->PULL |= 0xFFFF0000;
    port->PD &= 0xFFFF0000;
    port->PWR |= 0x55555555;
    port->GFEN &= 0x0;
  }
}

void portDeinit(MDR_PORT_TypeDef *port){
    port->OE |= 0x0;
    port->FUNC &= 0x0;
    port->ANALOG |= 0x0;
    port->PULL |= 0x0;
    port->PD &= 0x0;
    port->PWR |= 0x0;
    port->GFEN &= 0x0;	
}

void portWrite(MDR_PORT_TypeDef *port, uint32_t val){
  port->RXTX = val;
}

uint32_t portRead(MDR_PORT_TypeDef *port){
  return port->RXTX;
}
