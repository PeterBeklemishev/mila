#include "../MDR/cmsis/stdint.h"
#include "../MDR/inc/MDR32Fx.h"
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
  int bit;

  if ((0xFF00 & pin) > 0){
    port = port_from_pin(0xFF00 & pin);
    bit = 0x00FF & pin;
  }
  else {
    port = port_from_virtual_pin(pin);
    bit = bit_from_virtual_pin(pin);
  }

	if (mode == OUT){
		port->OE |= ( OE_OUT << bit );
		port->FUNC &= ( FUNC_GPIO << bit*2 );
		port->ANALOG |= ( ANALOG_OFF << bit );
		port->PULL |= (( PULL_ON << bit ) << 16 );
		port->PD &= ( PD_MODE_CDRV << bit );
		port->PWR |= ( PWR_SLOW << bit*2 );
		port->GFEN &= ( GFEN_OFF << bit );
	}
	
	else if (mode == IN){
    		port->OE &= ( OE_IN << bit );
    		port->FUNC &= ( FUNC_GPIO << bit*2 );
    		port->ANALOG |= ( ANALOG_OFF << bit );
    		port->PULL |= (( PULL_ON << bit ) << 16 );
    		port->PD |= (( PD_SCHM_ON << bit ) << 16 );
    		port->PWR |= ( PWR_SLOW << bit*2 );
    		port->GFEN &= ( GFEN_OFF << bit );		
	}

}

void pinWrite(int pin, int val){

  MDR_PORT_TypeDef *port;
  int bit;

  if ((0xFF00 & pin) > 0){
    port = port_from_pin(0xFF00 & pin);
    bit = 0x00FF & pin;
  }
  else {
    port = port_from_virtual_pin(pin);
    bit = bit_from_virtual_pin(pin);
  }

	if (val == 1){
		port->RXTX |= ( 1 << bit );
	}

	else if (val == 0){
		port->RXTX &= ~( 1 << bit );
	}

  //else ERROR;
}

int pinRead(int pin){

  MDR_PORT_TypeDef *port;
  int bit;

  if ((0xFF00 & pin) > 0){
    port = port_from_pin(0xFF00 & pin);
    bit = 0x00FF & pin;
  }
  else {
    port = port_from_virtual_pin(pin);
    bit = bit_from_virtual_pin(pin);
  }

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

//just for test

void snake(){
  pinWrite(B0,1);
  delay();
  pinWrite(B1,1);
  delay();
  pinWrite(B2,1);
  delay();
  pinWrite(B3,1);
  delay();
  pinWrite(8,0);
  delay();
  pinWrite(9,0);
  delay();
  pinWrite(10,0);
  delay();
  pinWrite(11,0);
  delay();
}
