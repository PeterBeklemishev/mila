#include "../MDR/inc/MDR32Fx.h"
#include "../MDR/cmsis/stdint.h"
#include "timers.h"
#include "milasrv.h"
#include "mila.h"

///-------------------------------\\\
/// --- Timers initialization --- \\\
///-------------------------------\\\

/*void Timer1_Init(void){
//	MDR_RST_CLK->PER_CLOCK |= TIMER1_CLK;
	MDR_RST_CLK->PER_CLOCK |= (1 << 14);
	MDR_RST_CLK->TIM_CLOCK = 0x3 | TIM1_CLK_EN;
	MDR_TIMER1->PSG = 0x0;
	MDR_TIMER1->ARR = 0x13;
	MDR_TIMER1->IE |= CNT_ARR_EVENT_IE;
	MDR_TIMER1->CNT = 0x4;
	MDR_TIMER1->CNTRL |= CNT_EN;
	NVIC_EnableIRQ(Timer1_IRQn);
}
*/

void CPU_init (void){
  MDR_RST_CLK->HS_CONTROL = 0x01; /* вкл. HSE осцилятора */
  while (MDR_RST_CLK->CLOCK_STATUS & (1 << 2) == 0x00); /* ждем пока HSE выйдет в рабочий режим */

  MDR_RST_CLK->PLL_CONTROL = ((1 << 2) | (9 << 8)); //вкл. PLL | коэф. умножения = 10
  while((MDR_RST_CLK->CLOCK_STATUS & 0x02) != 0x02); //ждем когда PLL выйдет в раб. режим

  MDR_RST_CLK->CPU_CLOCK = (2 /*источник для CPU_C1*/
  | (1 << 2) /*источник для CPU_C2*/
  | (0 << 4) /*предделитель для CPU_C3*/
  | (1 << 8));/*источник для HCLK*/
}


void Timer1_Init(void){
MDR_RST_CLK->PER_CLOCK = 0xFFFFFFFF;
MDR_RST_CLK->TIM_CLOCK = 0x07000000;
//MDR_TIMER1->CNTRL = 0x00000000;
//Настраиваем работу основного счетчика
MDR_TIMER1->CNT = 0x00000001;
//Начальное значение счетчика
MDR_TIMER1->PSG = 0x03E7;
//Предделитель частоты
MDR_TIMER1->ARR = 0x09C3;
//Основание счета
//Разрешение генерировать
MDR_TIMER1->IE = 0x00000002;
//прерывание при CNT=ARR
MDR_TIMER1->CNTRL = 1; //Сч
NVIC_EnableIRQ(Timer1_IRQn);
}

void Timer2_Init(void){
MDR_RST_CLK->PER_CLOCK = 0xFFFFFFFF;
MDR_RST_CLK->TIM_CLOCK = 0x07000000;
MDR_TIMER2->CNTRL = 0x00000000;
//Настраиваем работу основного счетчика
MDR_TIMER2->CNT = 0x00000000;
//Начальное значение счетчика
MDR_TIMER2->PSG = 0x00000000;
//Предделитель частоты
MDR_TIMER2->ARR = 0x00000FFF;
//Основание счета
//Разрешение генерировать
MDR_TIMER2->IE = 0x00000002;
//прерывание при CNT=ARR
MDR_TIMER2->CNTRL = 0x00000001; //Сч
}

void Timer3_Init(void){
MDR_RST_CLK->PER_CLOCK = 0xFFFFFFFF;
MDR_RST_CLK->TIM_CLOCK = 0x07000000;
MDR_TIMER3->CNTRL = 0x00000000;
//Настраиваем работу основного счетчика
MDR_TIMER3->CNT = 0x00000000;
//Начальное значение счетчика
MDR_TIMER3->PSG = 0x00000000;
//Предделитель частоты
MDR_TIMER3->ARR = 0x000000FF;
//Основание счета
//Разрешение генерировать
MDR_TIMER3->IE = 0x00000002;
//прерывание при CNT=ARR
MDR_TIMER3->CNTRL = 0x00000001; //Сч
}


/*
void Timer2_Init(void){
//	MDR_RST_CLK->PER_CLOCK |= TIMER1_CLK;
	MDR_RST_CLK->PER_CLOCK = 0xFFFFFFFF;
	MDR_RST_CLK->TIM_CLOCK = 0x1 | TIM2_CLK_EN;
	MDR_TIMER1->PSG = 0x5;
	MDR_TIMER1->ARR = 0xf3f;
	MDR_TIMER1->IE |= CNT_ARR_EVENT_IE;
	MDR_TIMER1->CNTRL |= CNT_EN;
	NVIC_EnableIRQ(Timer2_IRQn);
}
*/



///------------------------------------\\\
/// --- Timers interrupts handlers --- \\\
///------------------------------------\\\

void Timer1_IRQHandler(void) {
//	millis_time += MILLIS_STEP;
	MDR_PORTB->RXTX = 0xF-MDR_PORTB->RXTX;
//	tep = 0xF-tep;
	MDR_TIMER1->CNT = 0x0000;
    MDR_TIMER1->STATUS &= ~(1 << 1);
    NVIC_ClearPendingIRQ(Timer1_IRQn);
}

void Timer2_IRQHandler(void) {
//	millis_time += MILLIS_STEP;
	MDR_PORTB->RXTX = 0xF;
	tep = 0xF-tep;
	MDR_TIMER2->CNT = 0x0000;
    MDR_TIMER2->STATUS &= ~(1 << 1);
    NVIC_ClearPendingIRQ(Timer2_IRQn);
}