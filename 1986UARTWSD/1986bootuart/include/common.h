#ifndef __COMMON_H
#define __COMMON_H

typedef unsigned long  u32;
typedef unsigned short u16;
typedef unsigned char  u8;

typedef volatile unsigned long	vu32;
typedef volatile unsigned short vu16;
typedef volatile unsigned char	vu8;

#ifndef _BOOL
typedef enum { false, true } bool;
#endif

#ifdef __cplusplus
#define     __I     volatile 
#else
#define     __I     volatile const
#endif
#define     __O     volatile
#define     __IO    volatile

#define PERIPH_BASE		((u32)0x40000000) // Базовый адрес регистров периферии
#define SCS_BASE		((u32)0xE000E000) //  System Control Space Base Address 
#define SRAM_BASE		((u32)0x20000000) 

#define BIT(n) (1 << (n))
#define BITBAND(n) \
   (((u32)(n) & 0xF0000000) | 0x02000000 | (((u32)(n) & 0x000FFFFF) << 5))
#define REGBIT(n, b) ((vu32*)BITBAND(n))[b]

#define __IO_REG(NAME, TYPE, ADDRESS)\
                       __IO TYPE NAME __attribute__ ((at(ADDRESS)))

#define __RO_REG(NAME, TYPE, ADDRESS)\
                       __I TYPE NAME __attribute__ ((at(ADDRESS)))

#define __IO_REG_BIT(NAME, BIT, ADDRESS)  \
	__IO  u32 NAME[BIT] __attribute__ ((at(BITBAND(ADDRESS))))

#define __RO_REG_BIT(NAME, BIT, ADDRESS)  \
	__I  u32 NAME[BIT] __attribute__ ((at(BITBAND(ADDRESS))))

#define __IO_REG_ARRAY(NAME, SIZE, TYPE, ADDRESS)\
	__IO TYPE NAME[SIZE] __attribute__ ((at(ADDRESS)))

#endif
