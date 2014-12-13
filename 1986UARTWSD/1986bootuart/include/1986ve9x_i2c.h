#ifndef __I2C_H
#define __I2C_H
#include "common.h"

#define I2C_BASE	(PERIPH_BASE + 0x50000)

typedef struct {
	__IO u8	PRL;
	__IO u8	PRH		__attribute__ ((aligned(4)));
	__IO u8	CTRL	__attribute__ ((aligned(4)));
	__IO u8	RXD		__attribute__ ((aligned(4)));
	__IO u8	STAF	__attribute__ ((aligned(4)));
	__IO u8	TXD		__attribute__ ((aligned(4)));
	__IO u8	CMD		__attribute__ ((aligned(4)));
} I2C_TypeDef;

#define I2C	((I2C_TypeDef*) I2C_BASE)

typedef struct {
	u8	__0		: 5;
	u8	BST		: 1;
	u8	INTE 	: 1;
	u8	EN		: 1;
} I2C_CTRL_TypeDef;

typedef struct {
	u8	INTF		: 1;
	u8	TXF			: 1;
	u8	__0			: 3;
	u8	ARB_LOST	: 1;
	u8	BUSY		: 1;
	u8	RXACK		: 1;
} I2C_STAF_TypeDef;

typedef struct {
	u8	CLR_INT	: 1;
	u8	__0		: 2;
	u8	ACK		: 1;
	u8	WRITE	: 1;
	u8	READ	: 1;
	u8	STOP	: 1;
	u8	START	: 1;
} I2C_CMD_TypeDef;

__IO_REG(I2C_PRL,	u8,					I2C_BASE + 0x00);
__IO_REG(I2C_PRH,	u8,					I2C_BASE + 0x04);
__IO_REG(I2C_CTRL,	I2C_CTRL_TypeDef,	I2C_BASE + 0x08);
__IO_REG(I2C_RXD,	u8,					I2C_BASE + 0x0C);
__IO_REG(I2C_STAF,	I2C_STAF_TypeDef,	I2C_BASE + 0x10);
__IO_REG(I2C_TXD,	u8,					I2C_BASE + 0x14);
__IO_REG(I2C_CMD,	I2C_CMD_TypeDef,	I2C_BASE + 0x18);
	
#endif
