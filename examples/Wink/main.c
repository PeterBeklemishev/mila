#include <MDR32F9x.h>

#define BUTTON_SELECT (1<<2)   
#define LAMP_VD5      (1<<0)          

          
int main (void)
{ 

  MDR_RST_CLK->PER_CLOCK = 0xFFFFFFFF;  
                                                                                 
  MDR_PORTC->OE     = 0x00000000;                    
  MDR_PORTC->FUNC   = 0x00000000;                
  MDR_PORTC->ANALOG = 0x0000FFFF;         
  MDR_PORTC->PULL   = BUTTON_SELECT << 16;    
  MDR_PORTC->PD     = BUTTON_SELECT << 16;     
  MDR_PORTC->PWR    = 0x55555555;                  
  MDR_PORTC->GFEN   = 0;                                   
  
  MDR_PORTB->OE     = LAMP_VD5;                  
  MDR_PORTB->FUNC   = 0x00000000;               
  MDR_PORTB->ANALOG = 0x0000FFFF;         
  MDR_PORTB->PULL   = LAMP_VD5 << 16;   
  MDR_PORTB->PD     = ~LAMP_VD5;               
  MDR_PORTB->PWR    = 0x55555555;               
  MDR_PORTB->GFEN   = 0;                              
  MDR_PORTB->RXTX   = 0xFFFF;                    

  while(1)   
  { 
      if (MDR_PORTC->RXTX & BUTTON_SELECT) 
      { 
         MDR_PORTB->RXTX &= ~LAMP_VD5; 
      }
      else
      { 
				 MDR_PORTB->RXTX |= LAMP_VD5; 
      }
  }
}


