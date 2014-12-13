#ifndef __SSP_H
#define __SSP_H
#include "common.h"

#define SSP1_BASE	(PERIPH_BASE + 0x40000)
#define SSP2_BASE	(PERIPH_BASE + 0xA0000)

typedef struct {
	__IO u16	CR0;
	__IO u8		CR1;
	__IO u16	DR		__attribute__ ((aligned(4)));
	__I	 u8		SR		__attribute__ ((aligned(4)));
	__IO u16	PSCR	__attribute__ ((aligned(4)));
	__IO u8		IMR		__attribute__ ((aligned(4)));
	__I	 u8		IFR		__attribute__ ((aligned(4)));
	__I	 u8		IMFR	__attribute__ ((aligned(4)));
	__O	 u8		ICR		__attribute__ ((aligned(4)));
	__IO u8		DMAEN	__attribute__ ((aligned(4)));
} SSP_TypeDef;

#define SSP1	((SSP_TypeDef*) SSP1_BASE)
#define SSP2	((SSP_TypeDef*) SSP2_BASE)

typedef struct {
	u16	DSS		: 4;	// размер слова данных
	u16	FRF		: 2;	// формат информационного кадра
	u16	CPLH	: 2;	// формат сигнала CLK в режиме SPI
	u16	SCR		: 8;	// делитель скорости ( F_SSP = SSP_CLK/(PSCR * (SCR + 1))	)
} SSP_CR0_TypeDef;

typedef struct {
	u8	LBM	: 1;
	u8	SSE	: 1;
	u8	SLV	: 1;
	u8	SOD	: 1;
	u8	__0	: 4; // при записи устанавливать в 0
} SSP_CR1_TypeDef;

typedef struct {
	u8	TFE	: 1;
	u8	TNF	: 1;
	u8	RNE	: 1;
	u8	RRF	: 1;
	u8	BSY	: 1;
	u8	__0	: 3;
} SSP_SR_TypeDef;

typedef struct {
	u8	ROVF	: 1;	// переполнение FIFO приемника
	u8	RTOF	: 1;	// таймаут приема данных
	u8	RXF		: 1;	// запрос на обслуживание FIFO приемника
	u8	TXF		: 1;	// запрос на обслуживание FIFO передатчика
	u8	__0		: 4;
} SSP_INTF_TypeDef;

typedef struct {
	u8	ROVF	: 1;
	u8	RTOF	: 1;
	u8	__0		: 6;
} SSP_INTC_TypeDef;

typedef struct {
	u8	RXD	: 1;
	u8	TXD	: 1;
	u8	__0	: 6;
} SSP_DMAE_TypeDef;

/*
	SSP1
*/
__IO_REG(SSP1_CR0,	SSP_CR0_TypeDef,	SSP1_BASE + 0x00);
__IO_REG(SSP1_CR1,	SSP_CR1_TypeDef,	SSP1_BASE + 0x04);
__IO_REG(SSP1_DR,	u16,				SSP1_BASE + 0x08);
__RO_REG(SSP1_SR,	SSP_SR_TypeDef,		SSP1_BASE +	0x0C);
__IO_REG(SSP1_PSCR,	u16,				SSP1_BASE + 0x10);
__IO_REG(SSP1_IMR,	SSP_INTF_TypeDef,	SSP1_BASE + 0x14);
__RO_REG(SSP1_IFR,	SSP_INTF_TypeDef,	SSP1_BASE + 0x18);
__RO_REG(SSP1_IMFR,	SSP_INTF_TypeDef,	SSP1_BASE + 0x1C);
__IO_REG(SSP1_ICR,	SSP_INTC_TypeDef,	SSP1_BASE + 0x20);
__IO_REG(SSP1_DMAE,	SSP_DMAE_TypeDef,	SSP1_BASE + 0x24);

/*
	SSP2
*/
__IO_REG(SSP2_CR0,	SSP_CR0_TypeDef,	SSP2_BASE + 0x00);
__IO_REG(SSP2_CR1,	SSP_CR1_TypeDef,	SSP2_BASE + 0x04);
__IO_REG(SSP2_DR,	u16,				SSP2_BASE + 0x08);
__RO_REG(SSP2_SR,	SSP_SR_TypeDef,		SSP2_BASE +	0x0C);
__IO_REG(SSP2_PSCR,	u16,				SSP2_BASE + 0x10);
__IO_REG(SSP2_IMR,	SSP_INTF_TypeDef,	SSP2_BASE + 0x14);
__RO_REG(SSP2_IFR,	SSP_INTF_TypeDef,	SSP2_BASE + 0x18);
__RO_REG(SSP2_IMFR,	SSP_INTF_TypeDef,	SSP2_BASE + 0x1C);
__IO_REG(SSP2_ICR,	SSP_INTC_TypeDef,	SSP2_BASE + 0x20);
__IO_REG(SSP2_DMAE,	SSP_DMAE_TypeDef,	SSP2_BASE + 0x24);

#endif
