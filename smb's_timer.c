#include "MDR32Fx.h"

void timer_init()
{
  MDR_RST_CLK->PER_CLOCK |= 1 << 14;
  MDR_RST_CLK->TIM_CLOCK = 1 << 24;

  MDR_TIMER1->ARR = 0xffff;

  MDR_TIMER1->CH1_CNTRL = 1 << 15;  //захват, фронт по CCR1
  MDR_TIMER1->CH1_CNTRL2 = (1 << 2)|(1 << 0); // спад по CCR11
  MDR_TIMER1->CH2_CNTRL = (1 << 15)|(1 << 4); //захват, спад по CCR2
	MDR_TIMER1->IE = (3 << 5)|(1 << 13);  //разрешить прерывания по захвату на CCR1,CCR2,CCR11
  MDR_TIMER1->STATUS = 0;
  MDR_TIMER1->CNTRL = 0x1;
  NVIC->ISER[0] = (1 << Timer1_IRQn);
}

void Timer1_IRQHandler()
{
  int i1;
  i1 = MDR_TIMER1->STATUS;
  MDR_TIMER1->STATUS = ~(i1 & MDR_TIMER1->IE);

  if(i1 & (1 << 5))
  {
    //обработка прерывания фронта MDR_TIMER1->CH1
    MDR_PORTD->RXTX ^= 1<<10;	//VD7
  }

  if(i1 & (1 << 6))
  {
    //обработка прерывания спада MDR_TIMER1->CH2
    MDR_PORTD->RXTX ^= 1<<12;	//VD9
  }

  if(i1 & (1 << 13))
  {
    //обработка прерывания спада MDR_TIMER1->CH1
   MDR_PORTD->RXTX ^= 1<<11;	//VD9
  }
}

int main()
{
	__disable_irq();
	timer_init();
	__enable_irq();	
	while(1)
	{

	}
}
