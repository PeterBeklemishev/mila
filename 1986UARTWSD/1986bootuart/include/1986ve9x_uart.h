#ifndef __UART_H
#define __UART_H
#include "common.h"

#define UART1_BASE	(PERIPH_BASE + 0x30000)
#define UART2_BASE	(PERIPH_BASE + 0x38000)

typedef	struct {
	__IO u16	DR;		// регистр данных
	__IO u8		SR		__attribute__ ((aligned(4)));	// регистр состояния
	 	 u32 	__0[4]	__attribute__ ((aligned(4)));
	__I  u16	FR;									   	// регистр флагов событий
		 u32	__1 	__attribute__ ((aligned(4)));	
	__IO u8		ILPR;									// регистр управления ИК
	__IO u16	IBRD	__attribute__ ((aligned(4)));	// целая часть делителя скорости
	__IO u8		FBRD	__attribute__ ((aligned(4)));	// дробная часть делителя скорости
	__IO u8		LCR		__attribute__ ((aligned(4)));	// регистр управления линией
	__IO u16	CR		__attribute__ ((aligned(4)));	// регистр управления приемопередатчиком
	__IO u8		IFLS	__attribute__ ((aligned(4)));	// регистр порога прерывания по заполнению буфера
	__IO u16	IMR		__attribute__ ((aligned(4)));	// регистр маски прерываний
	__I	 u16	IFR		__attribute__ ((aligned(4)));	// регистр флагов прерываний
	__I	 u16	IMFR	__attribute__ ((aligned(4)));	// регистр флагов прерываний с учетом маски
	__O	 u16	ICR		__attribute__ ((aligned(4)));	// регистр сброса прерываний
	__IO u8		DMAEN	__attribute__ ((aligned(4)));	// регистр разрешения запроса DMA
} UART_TypeDef;

#define UART1	((UART_TypeDef*) UART1_BASE)
#define UART2	((UART_TypeDef*) UART2_BASE)

typedef struct {
	u16	DATA	: 8;
	u16	FE		: 1;	// ошибка кадра
	u16	PE		: 1;	// ошибка четности
	u16	BE		: 1;	// разрыв линии
	u16	OE		: 1;	// переполнение буфера приемника
	u16	__0		: 4;
} UART_DR_TypeDef;

typedef struct {
	u8	FE	: 1;
	u8	PE	: 1;
	u8	BE	: 1;
	u8	OE	: 1;
	u8	__0	: 4;
} UART_SR_TypeDef;

typedef struct {
	u16	CTS		: 1;	// инверсия линии CTS
	u16	DSR		: 1;	// инверсия линии DSR
	u16	DCD		: 1;	// инверсия линии DCD
	u16	BUSY	: 1;	// занят
	u16	RXFE	: 1;	// буфер приемника пуст
	u16	TXFF	: 1;	// буфер передатчика заполнен
	u16	RXFF	: 1;	// буфер приемника заполнен
	u16	TXFE	: 1;	// буфер передатчика пуст
	u16	RI		: 1;	// инверсия линии RI
	u16	__0		: 7;
} UART_FR_TypeDef;


typedef struct {
	u8	BRK		: 1;	// режим разрыва линии ( TXD = LO )
	u8	PEN		: 1;	// разрешение проверки четности
	u8	EPS		: 1;	// дополнение до четного
	u8	SBS		: 1;	// передача двух стоповых бит
	u8	FEN		: 1;	// разрешение работы буфера приемника и передатчика
	u8	WLEN	: 2;	// длина слова (0 = 5; ... 3 = 8)
	u8	SBP		: 1;	// инверсия бита четности
} UART_LCR_TypeDef;

typedef enum {
	nCRF_UARTEN =	BIT(0),
	nCRF_IREN	=	BIT(1),
	nCRF_IRLP	=	BIT(2),
	nCRF_LBEN	=	BIT(7),
	nCRF_TXEN	=	BIT(8),
	nCRF_RXEN	=	BIT(9),
	nCRF_DTR	=	BIT(10),
	nCRF_RTS	=	BIT(11),
	nCRF_DCD	=	BIT(12),
	nCRF_RI		=	BIT(13),
	nCRF_RTSEN	=	BIT(14),
	nCRF_CTSEN	=	BIT(15)
} FLAG_CR_TypeDef;		

typedef struct {
	u16	UARTEN	: 1;	// разрешение работы
	u16	IREN	: 1;	// разрешение кодека ИК
	u16	IRLP	: 1;	// пониженное энергопотребление ИК
	u16	__0		: 4;
	u16	LBEN	: 1;	// разрешение "шлейфа"
	u16	TXEN	: 1;	// разрешение передачи
	u16	RXEN	: 1;	// разрешение приема
	u16	DTR		: 1;	// инверсия линии DTR
	u16	RTS		: 1;	// инверсия линии RTS
	u16	DCD		: 1;	// инверсия линии DCD (nUARTOut1)
	u16	RI		: 1;	// инверсия линии RI (nUARTOut2)
	u16	RTSEN	: 1;	// разрешение запроса по RTS
	u16	CTSEN	: 1;	// разрешение передачи по CTS
} UART_CR_TypeDef;

typedef struct {
	u8	TXIF	: 3;	// порог прерывания по заполнению буфера передатчика
	u8	RXIF	: 3;	// порог прерывания по заполнению буфера приемника
	u8	__0		: 2;
} UART_IFLS_TypeDef;

typedef enum {
	nIRF_RI		= BIT(0),
	nIRF_CTS	= BIT(1),
	nIRF_DCD	= BIT(2),
	nIRF_DSR	= BIT(3),
	nIRF_RX		= BIT(4),
	nIRF_TX		= BIT(5),
	nIRF_RT		= BIT(6),
	nIRF_FE		= BIT(7),
	nIRF_PE		= BIT(8),
	nIRF_BE		= BIT(9),
	nIRF_OE		= BIT(10),
	nIRF_ALL 	= 0x7FF
} FLAG_INT_TypeDef;

typedef struct {
	u16	RI	: 1;	// изменение уровня линии RI
	u16	CTS	: 1;	// изменение уровня линии CTS
	u16	DCD	: 1;	// изменение уровня линии DCD
	u16	DSR	: 1;	// изменение уровня линии DSR
	u16	RX	: 1;	// событие UARTRXINTR от приемника 
	u16	TX	: 1;	// событие UARTTXINTR от передатчика 
	u16	RT	: 1;	// таймаут приема данных
	u16	FE	: 1;	// ошибка к структуре кадра
	u16	PE	: 1;	// ошибка контроля четности
	u16	BE	: 1;	// разрыв линии
	u16	OE	: 1;	// переполнение буфера
	u16	__0	: 5;
} UART_INT_TypeDef;		

typedef enum {
	nDMAF_RXD	= BIT(0),
	nDMAF_TXD	= BIT(1),
	nDMAF_ERR	= BIT(2)
} DMAEN_FLAG_TypeDef;

typedef struct {
	u8	RXD	: 1;	// запрос DMA от приемника
	u8	TXD	: 1;	// запрос DMA от передатчика
	u8	ERR	: 1;	// блокирование запросов от приемника при ошибке
	u8	__0	: 5;
} UART_DMAEN_TypeDef;

/*
	UART1
*/
__IO_REG(UART1_DR,		UART_DR_TypeDef,	UART1_BASE + 0x00);
__IO_REG(UART1_SR,		UART_SR_TypeDef,	UART1_BASE + 0x04);
__RO_REG(UART1_FR,		UART_FR_TypeDef,	UART1_BASE + 0x18);
__IO_REG(UART1_ILPR,	u8,					UART1_BASE + 0x20);
__IO_REG(UART1_IBRD,	u16,				UART1_BASE + 0x24);
__IO_REG(UART1_FBRD,	u8,					UART1_BASE + 0x28);
__IO_REG(UART1_LCR,		UART_LCR_TypeDef,	UART1_BASE + 0x2C);
__IO_REG(UART1_CR,		UART_CR_TypeDef,	UART1_BASE + 0x30);
__IO_REG(UART1_IFLS,	UART_IFLS_TypeDef,	UART1_BASE + 0x34);
__IO_REG(UART1_IMR,		UART_INT_TypeDef,	UART1_BASE + 0x38);
__RO_REG(UART1_IFR,		UART_INT_TypeDef,	UART1_BASE + 0x3C);
__RO_REG(UART1_IMFR,	UART_INT_TypeDef,	UART1_BASE + 0x40);
__IO_REG(UART1_ICR,		UART_INT_TypeDef,	UART1_BASE + 0x44);
__IO_REG(UART1_DMAEN,	UART_DMAEN_TypeDef,	UART1_BASE + 0x48);

/*
	UART2
*/
__IO_REG(UART2_DR,		UART_DR_TypeDef,	UART2_BASE + 0x00);
__IO_REG(UART2_SR,		UART_SR_TypeDef,	UART2_BASE + 0x04);
__RO_REG(UART2_FR,		UART_FR_TypeDef,	UART2_BASE + 0x18);
__IO_REG(UART2_ILPR,	u8,					UART2_BASE + 0x20);
__IO_REG(UART2_IBRD,	u16,				UART2_BASE + 0x24);
__IO_REG(UART2_FBRD,	u8,					UART2_BASE + 0x28);
__IO_REG(UART2_LCR,		UART_LCR_TypeDef,	UART2_BASE + 0x2C);
__IO_REG(UART2_CR,		UART_CR_TypeDef,	UART2_BASE + 0x30);
__IO_REG(UART2_IFLS,	UART_IFLS_TypeDef,	UART2_BASE + 0x34);
__IO_REG(UART2_IMR,		UART_INT_TypeDef,	UART2_BASE + 0x38);
__RO_REG(UART2_IFR,		UART_INT_TypeDef,	UART2_BASE + 0x3C);
__RO_REG(UART2_IMFR,	UART_INT_TypeDef,	UART2_BASE + 0x40);
__IO_REG(UART2_ICR,		UART_INT_TypeDef,	UART2_BASE + 0x44);
__IO_REG(UART2_DMAEN,	UART_DMAEN_TypeDef,	UART2_BASE + 0x48);

#endif
