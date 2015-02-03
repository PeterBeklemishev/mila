
/*
LOOK AT src/MDR/periph/MDR32F9Qx_port.h
while developing/
PORT_InitTypeDef and functions enums are there!
*/

#include "Arduino.h"

#ifdef __cplusplus
 extern "C" {
#endif

extern void pinMode( uint32_t ulPin, uint32_t ulMode )
{
//	if ( g_APinDescription[ulPin].ulPinType == PIO_NOT_A_PIN )
//    {
//        return ;
//    }

	switch ( ulMode )
    {
        case INPUT:
        break ;

        case INPUT_PULLUP:
        break ;

        case OUTPUT:
            	PORT_InitTypeDef PORT_InitStruct;
              PORT_StructInit(&PORT_InitStruct);
              PORT_InitStruct.PORT_Pin = g_APinDescription[ulPin].ulPin;
              PORT_InitStruct.PORT_OE = PORT_OE_OUT;
              PORT_InitStruct.PORT_FUNC = PORT_FUNC_PORT;
              PORT_InitStruct.PORT_PULL_DOWN = PORT_PULL_DOWN_OFF;
              PORT_InitStruct.PORT_PULL_UP = PORT_PULL_UP_ON;
              PORT_InitStruct.PORT_SPEED = PORT_SPEED_MAXFAST;
              PORT_InitStruct.PORT_MODE = PORT_MODE_DIGITAL;
              PORT_Init(g_APinDescription[ulPin].pPort, &PORT_InitStruct);
        break ;

        default:
        break ;
    }
}

extern void digitalWrite( uint32_t ulPin, uint32_t ulVal )
{
//
//	if ( g_APinDescription[ulPin].ulPinType == PIO_NOT_A_PIN )
//  {
//    return ;
//  }
  if( ulVal == LOW){
    PORT_ResetBits(g_APinDescription[ulPin].pPort, g_APinDescription[ulPin].ulPin);
    //вообще говоря, неправильно, поскольку перезаписывается весь порт.
  }
  else {
    PORT_SetBits(g_APinDescription[ulPin].pPort, g_APinDescription[ulPin].ulPin);
    //вообще говоря, неправильно, поскольку перезаписывается весь порт.
  }


}

extern int digitalRead( uint32_t ulPin )
{
	return LOW;
}

#ifdef __cplusplus
}
#endif
