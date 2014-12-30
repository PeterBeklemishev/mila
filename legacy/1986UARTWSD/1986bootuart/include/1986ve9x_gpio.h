#ifndef __GPIO_H
#define __GPIO_H

#include "common.h"

/* базовые адреса портов */

#define GPIOA_BASE	(PERIPH_BASE + 0x000A8000)
#define GPIOB_BASE	(PERIPH_BASE + 0x000B0000)
#define GPIOC_BASE	(PERIPH_BASE + 0x000B8000)
#define GPIOD_BASE	(PERIPH_BASE + 0x000C0000)
#define GPIOE_BASE	(PERIPH_BASE + 0x000C8000)
#define GPIOF_BASE	(PERIPH_BASE + 0x000E8000)

typedef struct
{
	__IO u16	RXTX;	// регистр данных порта
	__IO u16	DDR		__attribute__ ((aligned(4)));	// регистр направления передачи данных
	__IO u32	FUNC	__attribute__ ((aligned(4)));	// регистр выбора функции вывода 
	__IO u16	DIGEN;	// регистр выбора режима работы вывода 
	__IO u16	RGND	__attribute__ ((aligned(4))); 	// регистр разрешения поддяжки вывода к GND (100K)
	__IO u16	RVCC;	// регистр разрешения поддяжки вывода к VCC (100K) 
	__IO u16	ODEN;	// регистр разрешения режима вывода "открытый сток" 
	__IO u16	TREN;	// регистр разрешения входного гистерезиса (400mV) 
	__IO u32	PWR;	// регистр выбора формы фронта выходного импульса  
	__IO u16	GFEN;	// регистр разрешения входного фильтра "иголок"
} GPIO_TypeDef;

#define GPIOA	((GPIO_TypeDef*) GPIOA_BASE)
#define GPIOB	((GPIO_TypeDef*) GPIOB_BASE)
#define GPIOC	((GPIO_TypeDef*) GPIOC_BASE)
#define GPIOD	((GPIO_TypeDef*) GPIOD_BASE)
#define GPIOE	((GPIO_TypeDef*) GPIOE_BASE)
#define GPIOF	((GPIO_TypeDef*) GPIOF_BASE)

//
//	GPIOA_FUNC.PIN0 = GPIO_MODE_PORT;
//
typedef enum {
	GPIO_MODE_PORT	= 0,	// порт
	GPIO_MODE_BASIC	= 1,	// основная функция
	GPIO_MODE_ALT	= 2,	// альтернативная функция
	GPIO_MODE_REDEF	= 3		// переопределенная функция
} GPIO_FUNC_TypeDef;

//
//	GPIOA_PWR.PIN0 = GPIO_SPEED_SLOW;
//
typedef enum {
	GPIO_SPEED_SLOW	= 1,	// медленный фронт
	GPIO_SPEED_FAST	= 2,	// быстрый фронт
	GPIO_SPEED_MAXI	= 3		// максимально быстрый фронт
} GPIO_PWR_TypeDef;
//
//	GPIOA->FUNC |= GPIO_MODE(0, GPIO_MODE_PORT);
//	GPIOA->PWR |= GPIO_MODE(0, GPIO_SPEED_SLOW);
//
#define GPIO_MODE(PIN, MODE) ((MODE) << ((PIN) << 1))
//
//	GPIOA->RXTX |= GPIO_PIN(0);
//
#define GPIO_PIN(PIN)  (1 << (PIN))

typedef struct {
	u32	PIN0	: 2;
	u32	PIN1	: 2;
	u32	PIN2	: 2;
	u32	PIN3	: 2;
	u32	PIN4	: 2;
	u32	PIN5	: 2;
	u32	PIN6	: 2;
	u32	PIN7	: 2;
	u32	PIN8	: 2;
	u32	PIN9	: 2;
	u32	PIN10	: 2;
	u32	PIN11	: 2;
	u32	PIN12	: 2;
	u32	PIN13	: 2;
	u32	PIN14	: 2;
	u32	PIN15	: 2;
} GPIO_MODE_TypeDef;


/*
  	GPIOА
*/
__IO_REG_BIT(GPIOA_RXTX,	16,				GPIOA_BASE + 0x00);
__IO_REG_BIT(GPIOA_DDR,		16,				GPIOA_BASE + 0x04);
__IO_REG(GPIOA_FUNC,	GPIO_MODE_TypeDef,	GPIOA_BASE + 0x08);
__IO_REG_BIT(GPIOA_DIGEN,	16,				GPIOA_BASE + 0x0C);
__IO_REG_BIT(GPIOA_RGND,	16,				GPIOA_BASE + 0x10);
__IO_REG_BIT(GPIOA_RVCC,	16,				GPIOA_BASE + 0x12);
__IO_REG_BIT(GPIOA_OCEN,	16,				GPIOA_BASE + 0x14);
__IO_REG_BIT(GPIOA_TREN,	16,				GPIOA_BASE + 0x16);
__IO_REG(GPIOA_PWR,		GPIO_MODE_TypeDef,	GPIOA_BASE + 0x18);
__IO_REG_BIT(GPIOA_GFEN,	16,				GPIOA_BASE + 0x1C); 

/*
  	GPIOB
*/
__IO_REG_BIT(GPIOB_RXTX,	16,				GPIOB_BASE + 0x00);
__IO_REG_BIT(GPIOB_DDR,		16,				GPIOB_BASE + 0x04);
__IO_REG(GPIOB_FUNC,	GPIO_MODE_TypeDef,	GPIOB_BASE + 0x08);
__IO_REG_BIT(GPIOB_DIGEN,	16,				GPIOB_BASE + 0x0C);
__IO_REG_BIT(GPIOB_RDGN,	16,				GPIOB_BASE + 0x10);
__IO_REG_BIT(GPIOB_RVCC,	16,				GPIOB_BASE + 0x12);
__IO_REG_BIT(GPIOB_OCEN,	16,				GPIOB_BASE + 0x14);
__IO_REG_BIT(GPIOB_TREN,	16,				GPIOB_BASE + 0x16);
__IO_REG(GPIOB_PWR,		GPIO_MODE_TypeDef,	GPIOB_BASE + 0x18);
__IO_REG_BIT(GPIOB_GFEN,	16,				GPIOB_BASE + 0x1C);

/*
  	GPIOC
*/
__IO_REG_BIT(GPIOC_RXTX,	16,				GPIOC_BASE + 0x00);
__IO_REG_BIT(GPIOC_DDR,		16,				GPIOC_BASE + 0x04);
__IO_REG(GPIOC_FUNC,	GPIO_MODE_TypeDef,	GPIOC_BASE + 0x08);
__IO_REG_BIT(GPIOC_DIGEN,	16,				GPIOC_BASE + 0x0C);
__IO_REG_BIT(GPIOC_RDGN,	16,				GPIOC_BASE + 0x10);
__IO_REG_BIT(GPIOC_RVCC,	16,				GPIOC_BASE + 0x12);
__IO_REG_BIT(GPIOC_OCEN,	16,				GPIOC_BASE + 0x14);
__IO_REG_BIT(GPIOC_TREN,	16,				GPIOC_BASE + 0x16);
__IO_REG(GPIOC_PWR,		GPIO_MODE_TypeDef,	GPIOC_BASE + 0x18);
__IO_REG_BIT(GPIOC_GFEN,	16,				GPIOC_BASE + 0x1C);
 
/*
  	GPIOD
*/
__IO_REG_BIT(GPIOD_RXTX,	16,				GPIOD_BASE + 0x00);
__IO_REG_BIT(GPIOD_DDR,		16,				GPIOD_BASE + 0x04);
__IO_REG(GPIOD_FUNC,	GPIO_MODE_TypeDef,	GPIOD_BASE + 0x08);
__IO_REG_BIT(GPIOD_DIGEN,	16,				GPIOD_BASE + 0x0C);
__IO_REG_BIT(GPIOD_RDGN,	16,				GPIOD_BASE + 0x10);
__IO_REG_BIT(GPIOD_RVCC,	16,				GPIOD_BASE + 0x12);
__IO_REG_BIT(GPIOD_OCEN,	16,				GPIOD_BASE + 0x14);
__IO_REG_BIT(GPIOD_TREN,	16,				GPIOD_BASE + 0x16);
__IO_REG(GPIOD_PWR,		GPIO_MODE_TypeDef,	GPIOD_BASE + 0x18);
__IO_REG_BIT(GPIOD_GFEN,	16,				GPIOD_BASE + 0x1C);

/*
  	GPIOE
*/
__IO_REG_BIT(GPIOE_RXTX,	16,				GPIOE_BASE + 0x00);
__IO_REG_BIT(GPIOE_DDR,		16,				GPIOE_BASE + 0x04);
__IO_REG(GPIOE_FUNC,	GPIO_MODE_TypeDef,	GPIOE_BASE + 0x08);
__IO_REG_BIT(GPIOE_DIGEN,	16,				GPIOE_BASE + 0x0C);
__IO_REG_BIT(GPIOE_RDGN,	16,				GPIOE_BASE + 0x10);
__IO_REG_BIT(GPIOE_RVCC,	16,				GPIOE_BASE + 0x12);
__IO_REG_BIT(GPIOE_OCEN,	16,				GPIOE_BASE + 0x14);
__IO_REG_BIT(GPIOE_TREN,	16,				GPIOE_BASE + 0x16);
__IO_REG(GPIOE_PWR,		GPIO_MODE_TypeDef,	GPIOE_BASE + 0x18);
__IO_REG_BIT(GPIOE_GFEN,	16,				GPIOE_BASE + 0x1C);

/*
  	GPIOF
*/
__IO_REG_BIT(GPIOF_RXTX,	16,				GPIOF_BASE + 0x00);
__IO_REG_BIT(GPIOF_DDR,		16,				GPIOF_BASE + 0x04);
__IO_REG(GPIOF_FUNC,	GPIO_MODE_TypeDef,	GPIOF_BASE + 0x08);
__IO_REG_BIT(GPIOF_DIGEN,	16,				GPIOF_BASE + 0x0C);
__IO_REG_BIT(GPIOF_RDGN,	16,				GPIOF_BASE + 0x10);
__IO_REG_BIT(GPIOF_RVCC,	16,				GPIOF_BASE + 0x12);
__IO_REG_BIT(GPIOF_OCEN,	16,				GPIOF_BASE + 0x14);
__IO_REG_BIT(GPIOF_TREN,	16,				GPIOF_BASE + 0x16);
__IO_REG(GPIOF_PWR,		GPIO_MODE_TypeDef,	GPIOF_BASE + 0x18);
__IO_REG_BIT(GPIOF_GFEN,	16,				GPIOF_BASE + 0x1C);
 		
#endif
