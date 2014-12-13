#ifndef __EXTMEM_H
#define __EXTMEM_H
#include "common.h"

// PA[0..15] = DATA[0..15];
// PB[0..15] = DATA[16..31];
// PF[0..15] = ADDR[0..15];
// PE[0..15] = ADDR[16..31];
// PC[1] = OEn;
// PC[2] = WEn;
// PC[3..6] = BEn[0..3];
// PC[7] = CLOCK;

#define EXT_BUS_BASE	(PERIPH_BASE + 0x0F0000)

typedef struct {
	u32	t_rc	: 4;	// время цикла чтения в HCLK
	u32	t_wc	: 4;	// время цикла записи в HCLK
	u32	t_rea	: 4;
	u32	t_wp	: 4;
	u32	t_whr	: 4;
	u32	t_alea	: 4;
	u32	t_rr	: 4;
	u32	__0		: 4;
} NAND_CYCLES_TypeDef;

typedef struct {
	u16	ROM		: 1;  // бит разрешения внешней ROM (запрет записи)
   	u16	RAM		: 1;  // бит разрешения RAM
	u16	NAND	: 1;  // бит разрешения внешней FLASH NAND
	u16	CPOL	: 1;  // бит выбора инверсной полярности импульса CLOCK
	u16	__0		: 3;
	u16	BUSY	: 1;  // сигнал занятости FLASH NAND
	u16	__1		: 4;
	u16	WS		: 4;  // число тактов HCLK цикла чтения/записи ( 0 : 3HCLK,.., 15 : 17HCLK)
} EXT_BUS_CTRL_TypeDef;

__IO_REG(NAND_CYCLES,	NAND_CYCLES_TypeDef,	EXT_BUS_BASE + 0x50);		
__IO_REG(EXT_BUS_CTRL,	EXT_BUS_CTRL_TypeDef,	EXT_BUS_BASE + 0x54);

#endif
