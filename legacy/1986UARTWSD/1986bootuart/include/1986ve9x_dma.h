#ifndef __DMA_H
#define __DMA_H
#include "common.h"

#define DMA_CTRL_BASE	(PERIPH_BASE + 0x28000)
#define PRI_CTRL_BASE	(SRAM_BASE + 0x5000)
#define ALT_CTRL_BASE	(PRI_CTRL_BASE + 0x0200)

typedef enum {
	nDMA_UART1_TX	= 0,
	nDMA_UART1_RX,
	nDMA_UART2_TX,
	nDMA_UART2_RX,
	nDMA_SSP1_TX,
	nDMA_SSP1_RX,
	nDMA_SSP2_TX,
	nDMA_SSP2_RX,
	nDMA_TIMER1	= 10,
	nDMA_TIMER2,
	nDMA_TIMER3
} DMA_CHANNEL_TypeDef;

typedef struct {
	__I		u32		DMA_STATUS;				//	DMA_STATUS_TypeDef
	__O		u32		DMA_CONFIG;				//	DMA_CONFIG_TypeDef	
	__IO	u32		PRI_CTRL_BASE_PTR;		//	адрес основной структуры данных каналов
	__I		u32		ALT_CTRL_BASE_PTR;		//	адрес альтернативной структуры данных каналов 		
   	__I		u32		WAITONREQ_STATUS;		
	__O		u32		CHNL_SW_REQUEST;		
	__IO	u32		CHNL_SREQ_DISABLE;		// запрет единичных (Single REQuest) запросов		
	__O		u32		CHNL_SREQ_ENABLE;		// разрешение единичных (Single REQuest) запросов
	__IO	u32		CHNL_REQ_DISABLE;		// запрет единичных и пакетных запросов		
	__O		u32		CHNL_REQ_ENABLE;		// разрешение единичных и пакетных (Burst REQuest) запросов
	__IO	u32		CHNL_ENABLE;
	__O		u32		CHNL_DISABLE;
	__IO	u32		CHNL_ALT_ENABLE;
	__O		u32		CHNL_ALT_DISABLE;
	__IO	u32		CHNL_PRIORITY_SET;
	__O		u32		CHNL_PRIORITY_CLR;
			u32		__0[3];
	__IO	u32		DMA_ERROR_CLR;
} DMA_CTRL_TypeDef;

#define DMA	((DMA_CTRL_TypeDef*)DMA_CTRL_BASE)

typedef enum {
	nIDLE,
	nREAD_CHNL_CTRL_DATA,
	nREAD_SRC_DATA_EPTR,
	nREAD_DEST_DATA_EPTR,
	nREAD_SRC_DATA,
	nWRITE_DEST_DATA,
	nWAIT_REQUEST,
	nWRITE_CHNL_CTRL_DATA,
	nSTALLED,
	nDONE,
	nPERIPH_SCATTER_MODE
} DMA_STATE_TypeDef;

typedef struct {
	u32		MSTR_EN		: 1;
	u32		__0			: 3;
	u32		STATE		: 4; // DMA_STATE_TypeDef
	u32		__1			: 8;
	u32		CHNL_CNT	: 5;
	u32		__2			: 7;
	u32		TEST_STATUS	: 4;
} DMA_STATUS_TypeDef;

typedef struct {
	u8		MSTR_EN		: 1;
	u8		__0			: 4;
	u8		PROT_MODE	: 3; // комбинация флагов HPROT_MODE_TypeDef
} DMA_CONFIG_TypeDef;

__RO_REG(DMA_STATUS,	DMA_STATUS_TypeDef,	DMA_CTRL_BASE + 0x00);
__IO_REG(DMA_CONFIG,	DMA_CONFIG_TypeDef,	DMA_CTRL_BASE + 0x04);

__IO_REG(PRI_CTRL_BASE_PTR,	u32,	DMA_CTRL_BASE + 0x08);
__RO_REG(ALT_CTRL_BASE_PTR,	u32,	DMA_CTRL_BASE + 0x0C);

__RO_REG_BIT(WAITONREQ_STATUS,	32,	DMA_CTRL_BASE + 0x10);
__IO_REG_BIT(CHNL_SW_REQUEST,	32,	DMA_CTRL_BASE + 0x14);
__IO_REG_BIT(CHNL_SREQ_DISABLE,	32,	DMA_CTRL_BASE + 0x18);
__IO_REG_BIT(CHNL_SREQ_ENABLE,	32,	DMA_CTRL_BASE + 0x1C);
__IO_REG_BIT(CHNL_REQ_DISABLE,	32,	DMA_CTRL_BASE + 0x20);
__IO_REG_BIT(CHNL_REQ_ENABLE,	32,	DMA_CTRL_BASE + 0x24);
__IO_REG_BIT(CHNL_ENABLE,		32,	DMA_CTRL_BASE + 0x28);
__IO_REG_BIT(CHNL_DISABLE,		32, DMA_CTRL_BASE + 0x2C);
__IO_REG_BIT(CHNL_ALT_ENABLE,	32,	DMA_CTRL_BASE + 0x30);
__IO_REG_BIT(CHNL_ALT_DISABLE,	32,	DMA_CTRL_BASE + 0x34);
__IO_REG_BIT(CHNL_PRIORITY_SET,	32,	DMA_CTRL_BASE + 0x38);
__IO_REG_BIT(CHNL_PRIORITY_CLR,	32,	DMA_CTRL_BASE + 0x3C);

__IO_REG(DMA_ERROR_CLR,	u32,	BITBAND(DMA_CTRL_BASE + 0x4C));

typedef struct {
	u32		SRC_EPTR;	// последний адрес источника  
	u32		DEST_EPTR;	// последний адрес приемника
	u32		CONTROL;	// CHNL_CONTROL_TypeDef
	u32		__0;
} CHNL_DATA_CTRL_TypeDef;

typedef enum {
	nHALT,
	nBASIC,
	nAUTO_REQUEST,
	nPING_PONG,
	nMEM_PRI_SCATTER,
	nMEM_ALT_SCATTER,
	nPERIPH_PRI_SCATTER,
	nPERIPH_ALT_SCATTER
} CYCLE_MODE_TypeDef;

typedef enum {
	PROT_PRIVILEGED	= BIT(0),	// привелигерованный доступ
	PROT_BUFFERABLE	= BIT(1),	// буферизированный доступ
	PROT_CACHEABLE	= BIT(2)	// кэшированный доступ
} HPROT_MODE_TypeDef;

typedef enum {
	nBYTE,
	nWORD,
	nDWORD,
	nNULL
} HSIZE_TypeDef;	

typedef struct {
	u32		CYCLE_MODE			: 3; 	// режим цикла DMA (CYCLE_MODE_TypeDef)
	u32		NEXT_SREQ_DISABLE	: 1;
	u32		TRANSFER_NUMBER		: 10;	// число передач в цикле - 1
	u32		ARBIT_R2P			: 4;	// степень 2 в числе передач до арбитража
	u32		SRC_PROT_MODE		: 3;	// режим чтения данных (комбинация флагов HPROT_MODE_TypeDef)
	u32		DEST_PROT_MODE		: 3;	// режим записи данных (комбинация флагов HPROT_MODE_TypeDef)
	u32		SRC_SIZE			: 2;	// размерность данных источника (HSIZE_TypeDef)
	u32		SRC_INC				: 2;	// шаг приращения адреса источника (HSIZE_TypeDef)
	u32		DEST_SIZE			: 2;	// размерность данных получателя (HSIZE_TypeDef)
	u32		DEST_INC			: 2;	// шаг приращения адреса получателя (HSIZE_TypeDef)
} CHNL_CONTROL_TypeDef;


#define PRI_CHANNEL(n) \
((CHNL_DATA_CTRL_TypeDef*)PRI_CTRL_BASE)[n]

#define ALT_CHANNEL(n) \
((CHNL_DATA_CTRL_TypeDef*)ALT_CTRL_BASE)[n]

#define DEFINE_PRI_CHANNEL(n)\
volatile CHNL_DATA_CTRL_TypeDef DMA_CH ## n ##_PRI __attribute__ ((at(PRI_CTRL_BASE + ((n) << 4))))

#define DEFINE_ALT_CHANNEL(n)\
volatile CHNL_DATA_CTRL_TypeDef DMA_CH ## n ##_ALT __attribute__ ((at(ALT_CTRL_BASE + ((n) << 4))))
#endif
