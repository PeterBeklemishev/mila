#include <stdint.h>
#include "MDR32F9Qx_config.h"
#include "MDR32F9Qx_rst_clk.h"
#include "MDR32F9Qx_port.h"
#include "MDR32F9Qx_board.h"
#include "MDR32F9Qx_timer.h"
#include "MDR32Fx.h"

uint8_t flag;

void clock_init()
{

   RST_CLK_HSEconfig(RST_CLK_HSE_ON);
   RST_CLK_CPUclkPrescaler(RST_CLK_CPUclkDIV1);
   RST_CLK_CPUclkSelection(RST_CLK_CPUclkCPU_C3);
   RST_CLK_CPU_PLLconfig(RST_CLK_CPU_PLLsrcHSEdiv1, RST_CLK_CPU_PLLmul5);/** 80 MHz */
   RST_CLK_CPU_PLLcmd(ENABLE);
   RST_CLK_CPU_PLLuse(ENABLE);
}

void gpio_init()
{
   PORT_InitTypeDef port_init;
   PORT_StructInit(&port_init);

   RST_CLK_PCLKcmd(RST_CLK_PCLK_PORTF, ENABLE);

   port_init.PORT_FUNC = PORT_FUNC_PORT;
   port_init.PORT_MODE = PORT_MODE_DIGITAL;
   port_init.PORT_SPEED = PORT_SPEED_MAXFAST;
   port_init.PORT_OE = PORT_OE_OUT;
   port_init.PORT_Pin = PORT_Pin_6;
   PORT_Init(MDR_PORTF, &port_init);
}

void timer_init(void)
{
  MDR_RST_CLK->PER_CLOCK |= 1 << 14;
  MDR_RST_CLK->TIM_CLOCK = (5 | (1 << 24));

  MDR_TIMER1->PSG = 0x03E7;
  MDR_TIMER1->ARR = 0x09C3; /* 5s */

  MDR_TIMER1->IE = (1 << 1);
  MDR_TIMER1->CNTRL = 1;
  NVIC_EnableIRQ(Timer1_IRQn);
  flag = 0;
}

void Timer1_IRQHandler(void)
{
  if (flag == 0)
  {
    MDR_PORTF->RXTX &= ~(1 << 6);
    flag = 1;
  }
  else
  {
    MDR_PORTF->RXTX |= (1 << 6);
    flag = 0;
  }

  MDR_TIMER1->CNT = 0x0000;
  MDR_TIMER1->STATUS &= ~(1 << 1);
  NVIC_ClearPendingIRQ(Timer1_IRQn);
}


int main(void)
{
   clock_init();
   gpio_init();
   timer_init();

   while(1) {   }

   return 0;
}
