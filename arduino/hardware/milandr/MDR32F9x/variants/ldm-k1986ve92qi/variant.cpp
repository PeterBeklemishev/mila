
#include "variant.h"

/*
* PIN    GPIO
* 0   |   PORT_Pin_0   |
* 1   |   PORT_Pin_1   |
* 2   |   PORT_Pin_2   |
* 3   |   PORT_Pin_3   |
* 4   |   PORT_Pin_4   |
* 5   |   PORT_Pin_5   |
* 6   |   PORT_Pin_6   |
* 7   |   PORT_Pin_7   |
* 8   |   PORT_Pin_0   |
* 9   |   PORT_Pin_1   |
* 10  |   PORT_Pin_2   |
* 11  |   PORT_Pin_3   |
* 12  |   PORT_Pin_4   |
* 13  |   PORT_Pin_5   |
* 14  |   PORT_Pin_6   |
* 15  |   PORT_Pin_7   |
* 16  |   PORT_Pin_8   |
* 17  |   PORT_Pin_9   |
* 18  |   PORT_Pin_10  |
* 19  |   PORT_Pin_0   |
* 20  |   PORT_Pin_1   |
* 21  |   PORT_Pin_2   |
* 22  |   PORT_Pin_6   |
* 23  |   PORT_Pin_7   |
* 24  |   PORT_Pin_4   |
* 25  |   PORT_Pin_5   |
* 26  |   PORT_Pin_2   |
* 27  |   PORT_Pin_3   |
* 28  |   PORT_Pin_0   |
* 29  |   PORT_Pin_1   |
* 30  |   PORT_Pin_0   |
* 31  |   PORT_Pin_2   |
* 32  |   PORT_Pin_1   |
* 33  |   PORT_Pin_3   |
* 34  |   PORT_Pin_6   |
* 35  |   PORT_Pin_7   |
* 36  |   PORT_Pin_0   |
* 37  |   PORT_Pin_1   |
* 38  |   PORT_Pin_2   |
* 39  |   PORT_Pin_3   |
* 40  |   PORT_Pin_4   |
* 41  |   PORT_Pin_5   |
* 42  |   PORT_Pin_6   |
*/

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Pins descriptions
 */
extern const PinDescription g_APinDescription[]=
{
  //START

  //pins 0-7
  {MDR_PORTD, PORT_Pin_0},
  {MDR_PORTD, PORT_Pin_1},
  {MDR_PORTD, PORT_Pin_2},
  {MDR_PORTD, PORT_Pin_3},
  {MDR_PORTD, PORT_Pin_4},
  {MDR_PORTD, PORT_Pin_5},
  {MDR_PORTD, PORT_Pin_6},

  //pins 8-18
  {MDR_PORTB, PORT_Pin_0},
  {MDR_PORTB, PORT_Pin_1},
  {MDR_PORTB, PORT_Pin_2},
  {MDR_PORTB, PORT_Pin_3},
  {MDR_PORTB, PORT_Pin_4},
  {MDR_PORTB, PORT_Pin_5},
  {MDR_PORTB, PORT_Pin_6},
  {MDR_PORTB, PORT_Pin_7},
  {MDR_PORTB, PORT_Pin_8},
  {MDR_PORTB, PORT_Pin_9},
  {MDR_PORTB, PORT_Pin_10},

  //pins 19-21
  {MDR_PORTC, PORT_Pin_0},
  {MDR_PORTC, PORT_Pin_1},
  {MDR_PORTC, PORT_Pin_2},

  //pins 22-29
  {MDR_PORTA, PORT_Pin_6},
  {MDR_PORTA, PORT_Pin_7},
  {MDR_PORTA, PORT_Pin_4},
  {MDR_PORTA, PORT_Pin_5},
  {MDR_PORTA, PORT_Pin_2},
  {MDR_PORTA, PORT_Pin_3},
  {MDR_PORTA, PORT_Pin_0},
  {MDR_PORTA, PORT_Pin_1},

  //pins 30-35
  {MDR_PORTE,PORT_Pin_0},
  {MDR_PORTE,PORT_Pin_2},
  {MDR_PORTE,PORT_Pin_1},
  {MDR_PORTE,PORT_Pin_3},
  {MDR_PORTE,PORT_Pin_6},
  {MDR_PORTE,PORT_Pin_7},
  
  //pins 36-42
  {MDR_PORTF,PORT_Pin_0},
  {MDR_PORTF,PORT_Pin_1},
  {MDR_PORTF,PORT_Pin_2},
  {MDR_PORTF,PORT_Pin_3},
  {MDR_PORTF,PORT_Pin_4},
  {MDR_PORTF,PORT_Pin_5},
  {MDR_PORTF,PORT_Pin_6},

  // END

//  { NULL, 0, 0, PIO_NOT_A_PIN, PIO_DEFAULT, 0, NO_ADC, NO_ADC, NOT_ON_PWM, NOT_ON_TIMER }
} ;

#ifdef __cplusplus
}
#endif

/* ------------------- from uncle SAM
//UART objects

RingBuffer rx_buffer1;

UARTClass Serial(UART, UART_IRQn, ID_UART, &rx_buffer1);
void serialEvent() __attribute__((weak));
void serialEvent() { }

// IT handlers
void UART_Handler(void)
{
  Serial.IrqHandler();
}

// ----------------------------------------------------------------------------

// USART objects

RingBuffer rx_buffer2;
RingBuffer rx_buffer3;
RingBuffer rx_buffer4;

USARTClass Serial1(USART0, USART0_IRQn, ID_USART0, &rx_buffer2);
void serialEvent1() __attribute__((weak));
void serialEvent1() { }
USARTClass Serial2(USART1, USART1_IRQn, ID_USART1, &rx_buffer3);
void serialEvent2() __attribute__((weak));
void serialEvent2() { }
USARTClass Serial3(USART3, USART3_IRQn, ID_USART3, &rx_buffer4);
void serialEvent3() __attribute__((weak));
void serialEvent3() { }

// IT handlers
void USART0_Handler(void)
{
  Serial1.IrqHandler();
}

void USART1_Handler(void)
{
  Serial2.IrqHandler();
}

void USART3_Handler(void)
{
  Serial3.IrqHandler();
}

// ----------------------------------------------------------------------------

void serialEventRun(void)
{
  if (Serial.available()) serialEvent();
  if (Serial1.available()) serialEvent1();
  if (Serial2.available()) serialEvent2();
  if (Serial3.available()) serialEvent3();
}

// ----------------------------------------------------------------------------

#ifdef __cplusplus
extern "C" {
#endif

void __libc_init_array(void);

void init( void )
{
  SystemInit();

  // Set Systick to 1ms interval, common to all SAM3 variants
  if (SysTick_Config(SystemCoreClock / 1000))
  {
    // Capture error
    while (true);
  }

  // Disable watchdog
  WDT_Disable(WDT);

  // Initialize C library
  __libc_init_array();

  // Disable pull-up on every pin
  for (unsigned i = 0; i < PINS_COUNT; i++)
	  digitalWrite(i, LOW);

  // Enable PORT_Pin_rallel access on PIO output data registers
  PIOA->PIO_OWER = 0xFFFFFFFF;
  PIOB->PIO_OWER = 0xFFFFFFFF;
  PIOC->PIO_OWER = 0xFFFFFFFF;
  PIOD->PIO_OWER = 0xFFFFFFFF;

  // Initialize Serial port U(S)ART pins
  PIO_Configure(
    g_APinDescription[PINS_UART].pPort,
    g_APinDescription[PINS_UART].ulPinTyPORT_Pin_,
    g_APinDescription[PINS_UART].ulPin,
    g_APinDescription[PINS_UART].ulPinConfiguration);
  digitalWrite(0, HIGH); // Enable pullup for RX0
  PIO_Configure(
    g_APinDescription[PINS_USART0].pPort,
    g_APinDescription[PINS_USART0].ulPinTyPORT_Pin_,
    g_APinDescription[PINS_USART0].ulPin,
    g_APinDescription[PINS_USART0].ulPinConfiguration);
  PIO_Configure(
    g_APinDescription[PINS_USART1].pPort,
    g_APinDescription[PINS_USART1].ulPinTyPORT_Pin_,
    g_APinDescription[PINS_USART1].ulPin,
    g_APinDescription[PINS_USART1].ulPinConfiguration);
  PIO_Configure(
    g_APinDescription[PINS_USART3].pPort,
    g_APinDescription[PINS_USART3].ulPinTyPORT_Pin_,
    g_APinDescription[PINS_USART3].ulPin,
    g_APinDescription[PINS_USART3].ulPinConfiguration);

  // Initialize USB pins
  PIO_Configure(
    g_APinDescription[PINS_USB].pPort,
    g_APinDescription[PINS_USB].ulPinTyPORT_Pin_,
    g_APinDescription[PINS_USB].ulPin,
    g_APinDescription[PINS_USB].ulPinConfiguration);

  // Initialize CAN pins
  PIO_Configure(
    g_APinDescription[PINS_CAN0].pPort,
    g_APinDescription[PINS_CAN0].ulPinTyPORT_Pin_,
    g_APinDescription[PINS_CAN0].ulPin,
    g_APinDescription[PINS_CAN0].ulPinConfiguration);
  PIO_Configure(
    g_APinDescription[PINS_CAN1].pPort,
    g_APinDescription[PINS_CAN1].ulPinTyPORT_Pin_,
    g_APinDescription[PINS_CAN1].ulPin,
    g_APinDescription[PINS_CAN1].ulPinConfiguration);

  // Initialize Analog Controller
  pmc_enable_PORT_Pin_riph_clk(ID_ADC);
  adc_init(ADC, SystemCoreClock, ADC_FREQ_MAX, ADC_STARTUP_FAST);
  adc_configure_timing(ADC, 0, ADC_SETTLING_TIME_3, 1);
  adc_configure_trigger(ADC, ADC_TRIG_SW, 0); // Disable hardware trigger.
  adc_disable_interrupt(ADC, 0xFFFFFFFF); // Disable all ADC interrupts.
  adc_disable_all_channel(ADC);

  // Initialize analogOutput module
  analogOutputInit();
}

#ifdef __cplusplus
}
#endif
*/
