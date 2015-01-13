#include "../MDR/cmsis/stdint.h"
#include "../MDR/inc/MDR32Fx.h"
#include "gpio.h"
#include "milasrv.h"
#include "mila.h"

void ports_clock_enable(void){
    MDR_RST_CLK->PER_CLOCK = 
    	PORTA_CLK | PORTB_CLK | PORTC_CLK | 
    	PORTD_CLK | PORTE_CLK | PORTF_CLK;
}

void pinInit(int pin, int mode){

	MDR_PORT_TypeDef *port = port_from_pin(0xFF00 & pin);
	int bit = 0x00FF & pin;

	if (mode == OUT){
		port->OE |= ( OE_OUT << bit );
		port->FUNC &= ( FUNC_GPIO << bit*2 );
		port->ANALOG |= ( ANALOG_OFF << bit );
		port->PULL |= (( PULL_ON << bit ) << 16 );
		port->PD &= ( PD_MODE_CDRV << bit );
		port->PWR |= ( PWR_SLOW << bit*2 );
		port->GFEN &= ( GFEN_OFF << bit );
	}
	
	if (mode == IN){
		//TO BE DONE
	}

}

void pinWrite(int pin, int val){

	MDR_PORT_TypeDef *port = port_from_pin(0xFF00 & pin);
	int bit = 0xFF & pin;

	if (val == 1){
		port->RXTX |= ( 1 << bit );
	}

	else if (val == 0){
		port->RXTX &= ~( 1 << bit );
	}

}

void pinRead(int pin){
	//TO BE DONE
}

//SECTION to check, recode and approve

//FEATURE: write to port in 'write(PB,PB3,PB4,PC..,(long)0X012312341FDH)'- like format
/*
ports ~ 40-50 bits;
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
