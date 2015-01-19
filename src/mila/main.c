#include "../MDR/cmsis/stdint.h"
#include "timers.h"
#include "mila.h"
#include "milasrv.h"
#include "MDR32F9x.h"
#include "gpio.h"

void Uart_init(void){
  MDR_RST_CLK->PER_CLOCK |= (1UL << 22); //тактирование порта B

  MDR_PORTB->FUNC |= ((3 << 0*2) | (3 << 1*2)); //режим работы порта
  MDR_PORTB->ANALOG |= ((1 << 0) | (1 << 1)); //цифровой
  MDR_PORTB->PWR |= ((3 << 0*2) | (3 << 1*2)); //максимально быcтрый

  MDR_RST_CLK->PER_CLOCK |= (1UL << 7); //тактирование UART2
  MDR_RST_CLK->UART_CLOCK = (1 /*установка делителя для UART1 = undefined*/
  |(0 << 8) /*установка делителя для UART2 = */
  |(0 << 24) /*разрешение тактовой частоты UART1*/
  |(1 << 25)); /*разрешение тактовой частоты UART2*/ 

  //Параметры делителя при частоте = 8000000Гц и скорости = 19200
  MDR_UART2->IBRD = 0x1a; //целая часть делителя скорости
  MDR_UART2->FBRD = 0x3; //дробная часть делителя скорости
  MDR_UART2->LCR_H = ((0 << 1) /*разрешение проверки четности*/
  |(0 << 2) /*четность/нечетность ()*/
  |(0 << 3) /*стоп-бит = */
  |(3 << 5) /*длина слова = бит*/
  |(0 << 7)); /*передача бита четности*/

  MDR_UART2->CR = ((1 << 8)|(1 << 9)|1); //передачик и приемник разрешен, разрешение приемопередатчика UART2
}




int main(){


	Uart_init();

	CPU_init();
	
	mila_init(); // from file milasrv.c 
	
	init(); // from your awesome sketch
	
	for(;;){
		cycle(); // from your awesome sketch
	}

return 0;
}