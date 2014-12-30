#ifndef __ADC_H
#define __ADC_H

#include "common.h"

/* описание регистровой структуры АЦП */

#define ADC_BASE	(PERIPH_BASE + 0x00088000) // базовый адрес регистров АЦП
typedef struct 
{
	vu32	CONFIG[2];	// Регистр управления ADC
	vu32	HI_LEVEL[2];	// Регистр верхней границы ADC
	vu32	LO_LEVEL[2];	// Регистр нижней границы ADC
	vu32	RESULT[2];	// Регистр результата ADC
	vu32	STATUS[2];	// Регистр статуса ADC
	vu32	CHSEL[2];	// Регистр выбора каналов перебора ADC
} ADC_TypeDef;


#define ADC	((ADC_TypeDef*) ADC_BASE)	// Указатель на регистровую структуру АЦП

//
// ADC->CONFIG[0] - регистр управления ADC1
// ADC->CONFIG[1] - регистр управления ADC2
//

#endif
