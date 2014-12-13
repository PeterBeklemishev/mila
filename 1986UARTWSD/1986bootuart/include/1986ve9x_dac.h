#ifndef __DAC_H
#define __DAC_H
#include "common.h"

#define DAC_BASE	(PERIPH_BASE + 0x90000)

typedef struct {
	__IO	u8	CONFIG;
	__IO	u32 DAC0 __attribute__ ((aligned(4)));
	__IO 	u32 DAC1;
} DAC_TypeDef;

#define DAC	((DAC_TypeDef*)DAC_BASE)

typedef struct {
	u8	REF		: 2;
	u8	ON		: 2;
	u8	SYNC	: 1;
	u8	__0		: 3;
} DAC_CONFIG_TypeDef;

__IO_REG(DAC_CONFIG, DAC_CONFIG_TypeDef, DAC_BASE + 0x00);
__IO_REG(DAC0, u32, DAC_BASE + 0x04);
__IO_REG(DAC1, u32, DAC_BASE + 0x08);

#endif
