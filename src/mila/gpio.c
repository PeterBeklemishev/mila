#include "../MDR/cmsis/stdint.h"
#include "../MDR/inc/MDR32Fx.h"
#include "gpio.h"
#include "milasrv.h"
#include "mila.h"


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


// possible usage:
// portInit(port, OUT/IN); ----- any PORT
// portInit(port, OUT/IN, OUT/IN, OUT/IN) ----- PORTC only
// portInit(port, OUT/IN, OUT/IN, OUT/IN, OUT/IN, OUT/IN, OUT/IN) ----- PORTE only
// portInit(port, OUT/IN, OUT/IN, OUT/IN, OUT/IN, OUT/IN, OUT/IN, OUT/IN, OUT/IN) ----- PORTADF
// portInit(port, OUT/IN, OUT/IN, OUT/IN, OUT/IN, OUT/IN, OUT/IN, OUT/IN, OUT/IN, OUT/IN, OUT/IN) ----- PORTB

// must check if args quantity match corresponding port pins quantity

//FEATURE: mask modificator usage concept:
// "0х04 OE[15:0] MDR_PORTx->OE" means 16bit of "uint32_t mode" used?
//...
//#define IN 0x0000?
//#define OUT 0xFFFF?
//#define OUT_P(pin) ~((1) << (pin))
//#define IN_P(pin) ((1) << (pin)) 
//
//if(mode&&0x0000FFFF == OUT)..
//	port->OE |= 0xFFFFFFFFF && (mode)
//   elif(mode&&0x0000FFFF == IN)
//	port->OE |= 0x000000000 | (mode)
//
//exmpl usage: portInit(PB,IN | OUT_P(2) | OUT_P(3) ) //kinda windows-like style of parameter compilation
//	       portInit(PB,OUT | IN_P(2) | IN_P(6) | IN_P(7) ) //kinda windows-like style of parameter compilation

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


//SECTION to check, recode and approve

//FEATURE: write to port in 'write(PB,PB3,PB4,PC..,(long)0X012312341FDH)'- like format
/*
ports = 43 bits;
4 highest should be 0x0000 .... .... .... .....
size of long = 64 bit

type(porttypesize p)
{
  //например префикс и постфикс 01 - порт, ff - пин
  if(0xFFFF & p == 0x0000)
    return чиселко
  else: if(0xF000 & p == 0x0000)
          return пин
        else
          return порт
}

вот сюда выше идея:
0xWP0p

W - whole port
P - port
p - pin

целые порты типа PA, PB дефайнить как 0x1000 0x2000
пин на порту типа B2 B3 дефайнить как 0x0202 0x0203
сквозная нумерация пинов делается с пустым значением WP например 0х000А 0х00В2
тогда всё это сможет кушать pinWrite.

void write(porttypesize port, ...) {
    MDR_PORT_TypeDef *port;
    porttypesize ports[100];
    index = 0;

    porttypesize *p = &first;

    while (type(p) != чиселко) {
      ports[index++]=p;
      p++;
    }

    long value = p;
    bitOffset=0;
    //запись значения 
    for(i=0;i<count;i++)
      if(type(ports[i])==порт):
      {
          port = port_from_pin( (ports[i] >> 2) & 0x0F);
          port->RXTX = (value << bitOffset) 0xFFFFFFFF;
          bitOffset+=_sizeofbytesinint_;

          break;
      }
      else:
      {
          //для скорости не делаем пинврайт
          if (value == 1){
            port->RXTX |= ( 1 << bit );
          }

          else if (val == 0){
            port->RXTX &= ~( 1 << bit );
          }
          bitOffset+=_sizeofbytesforbit_;

          break;
      }
}
 
*/
