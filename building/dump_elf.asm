
blink.elf:     file format elf32-littlearm


Disassembly of section .text:

08000000 <__isr_vector>:
 8000000:	8000      	strh	r0, [r0, #0]
 8000002:	2000      	movs	r0, #0
 8000004:	016d      	lsls	r5, r5, #5
 8000006:	0800      	lsrs	r0, r0, #32
 8000008:	01af      	lsls	r7, r5, #6
 800000a:	0800      	lsrs	r0, r0, #32
 800000c:	01b1      	lsls	r1, r6, #6
 800000e:	0800      	lsrs	r0, r0, #32
 8000010:	01b3      	lsls	r3, r6, #6
 8000012:	0800      	lsrs	r0, r0, #32
 8000014:	01b5      	lsls	r5, r6, #6
 8000016:	0800      	lsrs	r0, r0, #32
 8000018:	01b7      	lsls	r7, r6, #6
 800001a:	0800      	lsrs	r0, r0, #32
	...
 800002c:	01b9      	lsls	r1, r7, #6
 800002e:	0800      	lsrs	r0, r0, #32
 8000030:	01bb      	lsls	r3, r7, #6
 8000032:	0800      	lsrs	r0, r0, #32
 8000034:	0000      	movs	r0, r0
 8000036:	0000      	movs	r0, r0
 8000038:	01bd      	lsls	r5, r7, #6
 800003a:	0800      	lsrs	r0, r0, #32
 800003c:	01bf      	lsls	r7, r7, #6
 800003e:	0800      	lsrs	r0, r0, #32
 8000040:	01c1      	lsls	r1, r0, #7
 8000042:	0800      	lsrs	r0, r0, #32
 8000044:	01c3      	lsls	r3, r0, #7
 8000046:	0800      	lsrs	r0, r0, #32
 8000048:	01c5      	lsls	r5, r0, #7
 800004a:	0800      	lsrs	r0, r0, #32
	...
 8000054:	01c7      	lsls	r7, r0, #7
 8000056:	0800      	lsrs	r0, r0, #32
 8000058:	01c9      	lsls	r1, r1, #7
 800005a:	0800      	lsrs	r0, r0, #32
 800005c:	01cb      	lsls	r3, r1, #7
 800005e:	0800      	lsrs	r0, r0, #32
 8000060:	01cd      	lsls	r5, r1, #7
 8000062:	0800      	lsrs	r0, r0, #32
 8000064:	0000      	movs	r0, r0
 8000066:	0000      	movs	r0, r0
 8000068:	01cf      	lsls	r7, r1, #7
 800006a:	0800      	lsrs	r0, r0, #32
 800006c:	01d1      	lsls	r1, r2, #7
 800006e:	0800      	lsrs	r0, r0, #32
 8000070:	01d3      	lsls	r3, r2, #7
 8000072:	0800      	lsrs	r0, r0, #32
 8000074:	0000      	movs	r0, r0
 8000076:	0000      	movs	r0, r0
 8000078:	01d5      	lsls	r5, r2, #7
 800007a:	0800      	lsrs	r0, r0, #32
 800007c:	01d7      	lsls	r7, r2, #7
 800007e:	0800      	lsrs	r0, r0, #32
 8000080:	01d9      	lsls	r1, r3, #7
 8000082:	0800      	lsrs	r0, r0, #32
 8000084:	01db      	lsls	r3, r3, #7
 8000086:	0800      	lsrs	r0, r0, #32
 8000088:	0000      	movs	r0, r0
 800008a:	0000      	movs	r0, r0
 800008c:	01dd      	lsls	r5, r3, #7
 800008e:	0800      	lsrs	r0, r0, #32
 8000090:	01df      	lsls	r7, r3, #7
 8000092:	0800      	lsrs	r0, r0, #32
	...
 80000ac:	01e1      	lsls	r1, r4, #7
 80000ae:	0800      	lsrs	r0, r0, #32
 80000b0:	01e3      	lsls	r3, r4, #7
 80000b2:	0800      	lsrs	r0, r0, #32
 80000b4:	01e5      	lsls	r5, r4, #7
 80000b6:	0800      	lsrs	r0, r0, #32
 80000b8:	01e7      	lsls	r7, r4, #7
 80000ba:	0800      	lsrs	r0, r0, #32
 80000bc:	01e9      	lsls	r1, r5, #7
 80000be:	0800      	lsrs	r0, r0, #32

080000c0 <SystemCoreClockUpdate>:
  uint32_t pll_mul;

  /* Compute CPU_CLK frequency */

  /* Determine CPU_C1 frequency */
  if ((MDR_RST_CLK->CPU_CLOCK & (uint32_t)0x00000002) == (uint32_t)0x00000002)
 80000c0:	4b1b      	ldr	r3, [pc, #108]	; (8000130 <SystemCoreClockUpdate+0x70>)
 80000c2:	68da      	ldr	r2, [r3, #12]
  else
  {
    cpu_c1_freq = HSI_Value;
  }

  if ((MDR_RST_CLK->CPU_CLOCK & (uint32_t)0x00000001) == (uint32_t)0x00000001)
 80000c4:	68db      	ldr	r3, [r3, #12]
 80000c6:	f003 0301 	and.w	r3, r3, #1
  {
    cpu_c1_freq /= 2;
 80000ca:	491a      	ldr	r1, [pc, #104]	; (8000134 <SystemCoreClockUpdate+0x74>)
 80000cc:	4a1a      	ldr	r2, [pc, #104]	; (8000138 <SystemCoreClockUpdate+0x78>)
 80000ce:	2b00      	cmp	r3, #0
 80000d0:	bf0c      	ite	eq
 80000d2:	4613      	moveq	r3, r2
 80000d4:	460b      	movne	r3, r1
  }

  /* Determine CPU_C2 frequency */
  cpu_c2_freq = cpu_c1_freq;

  if ((MDR_RST_CLK->CPU_CLOCK & (uint32_t)0x00000004) == (uint32_t)0x00000004)
 80000d6:	4a16      	ldr	r2, [pc, #88]	; (8000130 <SystemCoreClockUpdate+0x70>)
 80000d8:	68d2      	ldr	r2, [r2, #12]
 80000da:	f012 0f04 	tst.w	r2, #4
 80000de:	d005      	beq.n	80000ec <SystemCoreClockUpdate+0x2c>
  {
    /* Determine CPU PLL output frequency */
    pll_mul = ((MDR_RST_CLK->PLL_CONTROL >> 8) & (uint32_t)0x0F) + 1;
 80000e0:	4a13      	ldr	r2, [pc, #76]	; (8000130 <SystemCoreClockUpdate+0x70>)
 80000e2:	6852      	ldr	r2, [r2, #4]
 80000e4:	f3c2 2203 	ubfx	r2, r2, #8, #4
    cpu_c2_freq *= pll_mul;
 80000e8:	fb02 3303 	mla	r3, r2, r3, r3
  }

  /*Select CPU_CLK from HSI, CPU_C3, LSE, LSI cases */
  switch ((MDR_RST_CLK->CPU_CLOCK >> 8) & (uint32_t)0x03)
 80000ec:	4a10      	ldr	r2, [pc, #64]	; (8000130 <SystemCoreClockUpdate+0x70>)
 80000ee:	68d2      	ldr	r2, [r2, #12]
 80000f0:	f3c2 2201 	ubfx	r2, r2, #8, #2
 80000f4:	2a01      	cmp	r2, #1
 80000f6:	d007      	beq.n	8000108 <SystemCoreClockUpdate+0x48>
 80000f8:	b112      	cbz	r2, 8000100 <SystemCoreClockUpdate+0x40>
 80000fa:	2a02      	cmp	r2, #2
 80000fc:	d00e      	beq.n	800011c <SystemCoreClockUpdate+0x5c>
 80000fe:	e012      	b.n	8000126 <SystemCoreClockUpdate+0x66>
  {
    case 0 :
      /* HSI */
      SystemCoreClock = HSI_Value;
 8000100:	4a0d      	ldr	r2, [pc, #52]	; (8000138 <SystemCoreClockUpdate+0x78>)
 8000102:	4b0e      	ldr	r3, [pc, #56]	; (800013c <SystemCoreClockUpdate+0x7c>)
 8000104:	601a      	str	r2, [r3, #0]
      break;
 8000106:	4770      	bx	lr
    case 1 :
      /* CPU_C3 */
      /* Determine CPU_C3 frequency */
      cpu_c3_freq = cpu_c2_freq / ((MDR_RST_CLK->CPU_CLOCK >> 4 & (uint32_t)0x0F) + 1);
 8000108:	4a09      	ldr	r2, [pc, #36]	; (8000130 <SystemCoreClockUpdate+0x70>)
 800010a:	68d2      	ldr	r2, [r2, #12]
 800010c:	f3c2 1203 	ubfx	r2, r2, #4, #4
 8000110:	3201      	adds	r2, #1
 8000112:	fbb3 f3f2 	udiv	r3, r3, r2
      SystemCoreClock = cpu_c3_freq;
 8000116:	4a09      	ldr	r2, [pc, #36]	; (800013c <SystemCoreClockUpdate+0x7c>)
 8000118:	6013      	str	r3, [r2, #0]
      break;
 800011a:	4770      	bx	lr
    case 2 :
      /* LSE */
      SystemCoreClock = LSE_Value;
 800011c:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8000120:	4b06      	ldr	r3, [pc, #24]	; (800013c <SystemCoreClockUpdate+0x7c>)
 8000122:	601a      	str	r2, [r3, #0]
      break;
 8000124:	4770      	bx	lr
    default : /* case 3 */
      /* LSI */
      SystemCoreClock = LSI_Value;
 8000126:	f649 4240 	movw	r2, #40000	; 0x9c40
 800012a:	4b04      	ldr	r3, [pc, #16]	; (800013c <SystemCoreClockUpdate+0x7c>)
 800012c:	601a      	str	r2, [r3, #0]
 800012e:	4770      	bx	lr
 8000130:	0000      	movs	r0, r0
 8000132:	4002      	ands	r2, r0
 8000134:	0900      	lsrs	r0, r0, #4
 8000136:	003d      	movs	r5, r7
 8000138:	1200      	asrs	r0, r0, #8
 800013a:	007a      	lsls	r2, r7, #1
 800013c:	0000      	movs	r0, r0
 800013e:	2000      	movs	r0, #0

08000140 <SystemInit>:
  * @note   This function should be used only after reset.
  * @param  None
  * @retval None
  */
void SystemInit (void)
{
 8000140:	b508      	push	{r3, lr}
	/* Reset the RST clock configuration to the default reset state */

  /* Reset all clock but RST_CLK & BKP_CLC bits */
  MDR_RST_CLK->PER_CLOCK   = (uint32_t)0x8000010;
 8000142:	4b08      	ldr	r3, [pc, #32]	; (8000164 <SystemInit+0x24>)
 8000144:	4a08      	ldr	r2, [pc, #32]	; (8000168 <SystemInit+0x28>)
 8000146:	61da      	str	r2, [r3, #28]

  /* Reset CPU_CLOCK bits */
  MDR_RST_CLK->CPU_CLOCK   &= (uint32_t)0x00000000;
 8000148:	68da      	ldr	r2, [r3, #12]
 800014a:	2200      	movs	r2, #0
 800014c:	60da      	str	r2, [r3, #12]

  /* Reset PLL_CONTROL bits */
  MDR_RST_CLK->PLL_CONTROL &= (uint32_t)0x00000000;
 800014e:	6859      	ldr	r1, [r3, #4]
 8000150:	605a      	str	r2, [r3, #4]

  /* Reset HSEON and HSEBYP bits */
  MDR_RST_CLK->HS_CONTROL  &= (uint32_t)0x00000000;
 8000152:	6899      	ldr	r1, [r3, #8]
 8000154:	609a      	str	r2, [r3, #8]

  /* Reset USB_CLOCK bits */
  MDR_RST_CLK->USB_CLOCK   &= (uint32_t)0x00000000;
 8000156:	6919      	ldr	r1, [r3, #16]
 8000158:	611a      	str	r2, [r3, #16]

  /* Reset ADC_MCO_CLOCK bits */
  MDR_RST_CLK->ADC_MCO_CLOCK   &= (uint32_t)0x00000000;
 800015a:	6959      	ldr	r1, [r3, #20]
 800015c:	615a      	str	r2, [r3, #20]

  SystemCoreClockUpdate();
 800015e:	f7ff ffaf 	bl	80000c0 <SystemCoreClockUpdate>
 8000162:	bd08      	pop	{r3, pc}
 8000164:	0000      	movs	r0, r0
 8000166:	4002      	ands	r2, r0
 8000168:	0010      	movs	r0, r2
 800016a:	0800      	lsrs	r0, r0, #32

0800016c <Reset_Handler>:
 *      linker script.
 *      __etext: End of code section, i.e., begin of data sections to copy from.
 *      __data_start__/__data_end__: RAM address range that data should be
 *      copied to. Both must be aligned to 4 bytes boundary.  */

    ldr    r1, =__etext
 800016c:	4906      	ldr	r1, [pc, #24]	; (8000188 <Reset_Handler+0x1c>)
    ldr    r2, =__data_start__
 800016e:	4a07      	ldr	r2, [pc, #28]	; (800018c <Reset_Handler+0x20>)
    ldr    r3, =__data_end__
 8000170:	4b07      	ldr	r3, [pc, #28]	; (8000190 <Reset_Handler+0x24>)

    bl     copy_to_ram
 8000172:	f000 f815 	bl	80001a0 <copy_to_ram>

/* Copy RAM functions from FLASH to RAM */
    ldr    r1, =__exec_mem__
 8000176:	4907      	ldr	r1, [pc, #28]	; (8000194 <Reset_Handler+0x28>)
    ldr    r2, =__exec_mem_start__
 8000178:	4a07      	ldr	r2, [pc, #28]	; (8000198 <Reset_Handler+0x2c>)
    ldr    r3, =__exec_mem_end__
 800017a:	4b08      	ldr	r3, [pc, #32]	; (800019c <Reset_Handler+0x30>)

    bl     copy_to_ram
 800017c:	f000 f810 	bl	80001a0 <copy_to_ram>
    strlt   r0, [r1], #4
    blt    .LC0
#endif /* __STARTUP_CLEAR_BSS */

#ifndef __NO_SYSTEM_INIT
    bl    SystemInit
 8000180:	f7ff ffde 	bl	8000140 <SystemInit>
/*#ifndef __START
#define __START _start
#endif
    bl    __START
*/
    bl    main
 8000184:	f000 f84c 	bl	8000220 <main>
 *      linker script.
 *      __etext: End of code section, i.e., begin of data sections to copy from.
 *      __data_start__/__data_end__: RAM address range that data should be
 *      copied to. Both must be aligned to 4 bytes boundary.  */

    ldr    r1, =__etext
 8000188:	0268      	lsls	r0, r5, #9
 800018a:	0800      	lsrs	r0, r0, #32
    ldr    r2, =__data_start__
 800018c:	0000      	movs	r0, r0
 800018e:	2000      	movs	r0, #0
    ldr    r3, =__data_end__
 8000190:	0004      	movs	r4, r0
 8000192:	2000      	movs	r0, #0

    bl     copy_to_ram

/* Copy RAM functions from FLASH to RAM */
    ldr    r1, =__exec_mem__
 8000194:	026c      	lsls	r4, r5, #9
 8000196:	0800      	lsrs	r0, r0, #32
    ldr    r2, =__exec_mem_start__
 8000198:	0004      	movs	r4, r0
 800019a:	2000      	movs	r0, #0
    ldr    r3, =__exec_mem_end__
 800019c:	0004      	movs	r4, r0
 800019e:	2000      	movs	r0, #0

080001a0 <copy_to_ram>:
*/
    .thumb
    .thumb_func
    .align 2
copy_to_ram:
    subs    r3, r2
 80001a0:	1a9b      	subs	r3, r3, r2
    ble    1f
 80001a2:	dd03      	ble.n	80001ac <copy_to_ram+0xc>
0:
    subs    r3, #4
 80001a4:	3b04      	subs	r3, #4
    ldr    r0, [r1, r3]
 80001a6:	58c8      	ldr	r0, [r1, r3]
    str    r0, [r2, r3]
 80001a8:	50d0      	str	r0, [r2, r3]
    bgt    0b
 80001aa:	dcfb      	bgt.n	80001a4 <copy_to_ram+0x4>
1:
    bx lr
 80001ac:	4770      	bx	lr

080001ae <NMI_Handler>:
\handler_name :
    b    .
    .size    \handler_name, . - \handler_name
    .endm
    
    def_default_handler    NMI_Handler
 80001ae:	e7fe      	b.n	80001ae <NMI_Handler>

080001b0 <HardFault_Handler>:
    def_default_handler    HardFault_Handler
 80001b0:	e7fe      	b.n	80001b0 <HardFault_Handler>

080001b2 <MemManage_Handler>:
    def_default_handler    MemManage_Handler
 80001b2:	e7fe      	b.n	80001b2 <MemManage_Handler>

080001b4 <BusFault_Handler>:
    def_default_handler    BusFault_Handler
 80001b4:	e7fe      	b.n	80001b4 <BusFault_Handler>

080001b6 <UsageFault_Handler>:
    def_default_handler    UsageFault_Handler
 80001b6:	e7fe      	b.n	80001b6 <UsageFault_Handler>

080001b8 <SVC_Handler>:
    def_default_handler    SVC_Handler
 80001b8:	e7fe      	b.n	80001b8 <SVC_Handler>

080001ba <DebugMon_Handler>:
    def_default_handler    DebugMon_Handler
 80001ba:	e7fe      	b.n	80001ba <DebugMon_Handler>

080001bc <PendSV_Handler>:
    def_default_handler    PendSV_Handler
 80001bc:	e7fe      	b.n	80001bc <PendSV_Handler>

080001be <SysTick_Handler>:
    def_default_handler    SysTick_Handler
 80001be:	e7fe      	b.n	80001be <SysTick_Handler>

080001c0 <CAN1_IRQHandler>:
    
    def_default_handler    CAN1_IRQHandler
 80001c0:	e7fe      	b.n	80001c0 <CAN1_IRQHandler>

080001c2 <CAN2_IRQHandler>:
    def_default_handler    CAN2_IRQHandler
 80001c2:	e7fe      	b.n	80001c2 <CAN2_IRQHandler>

080001c4 <USB_IRQHandler>:
    def_default_handler    USB_IRQHandler
 80001c4:	e7fe      	b.n	80001c4 <USB_IRQHandler>

080001c6 <DMA_IRQHandler>:
    def_default_handler    DMA_IRQHandler
 80001c6:	e7fe      	b.n	80001c6 <DMA_IRQHandler>

080001c8 <UART1_IRQHandler>:
    def_default_handler    UART1_IRQHandler
 80001c8:	e7fe      	b.n	80001c8 <UART1_IRQHandler>

080001ca <UART2_IRQHandler>:
    def_default_handler    UART2_IRQHandler
 80001ca:	e7fe      	b.n	80001ca <UART2_IRQHandler>

080001cc <SSP1_IRQHandler>:
    def_default_handler    SSP1_IRQHandler
 80001cc:	e7fe      	b.n	80001cc <SSP1_IRQHandler>

080001ce <I2C_IRQHandler>:
    def_default_handler    I2C_IRQHandler
 80001ce:	e7fe      	b.n	80001ce <I2C_IRQHandler>

080001d0 <POWER_IRQHandler>:
    def_default_handler    POWER_IRQHandler
 80001d0:	e7fe      	b.n	80001d0 <POWER_IRQHandler>

080001d2 <WWDG_IRQHandler>:
    def_default_handler    WWDG_IRQHandler
 80001d2:	e7fe      	b.n	80001d2 <WWDG_IRQHandler>

080001d4 <Timer1_IRQHandler>:
    def_default_handler    Timer1_IRQHandler
 80001d4:	e7fe      	b.n	80001d4 <Timer1_IRQHandler>

080001d6 <Timer2_IRQHandler>:
    def_default_handler    Timer2_IRQHandler
 80001d6:	e7fe      	b.n	80001d6 <Timer2_IRQHandler>

080001d8 <Timer3_IRQHandler>:
    def_default_handler    Timer3_IRQHandler
 80001d8:	e7fe      	b.n	80001d8 <Timer3_IRQHandler>

080001da <ADC_IRQHandler>:
    def_default_handler    ADC_IRQHandler
 80001da:	e7fe      	b.n	80001da <ADC_IRQHandler>

080001dc <COMPARATOR_IRQHandler>:
    def_default_handler    COMPARATOR_IRQHandler
 80001dc:	e7fe      	b.n	80001dc <COMPARATOR_IRQHandler>

080001de <SSP2_IRQHandler>:
    def_default_handler    SSP2_IRQHandler
 80001de:	e7fe      	b.n	80001de <SSP2_IRQHandler>

080001e0 <BACKUP_IRQHandler>:
    def_default_handler    BACKUP_IRQHandler
 80001e0:	e7fe      	b.n	80001e0 <BACKUP_IRQHandler>

080001e2 <EXT_INT1_IRQHandler>:
    def_default_handler    EXT_INT1_IRQHandler
 80001e2:	e7fe      	b.n	80001e2 <EXT_INT1_IRQHandler>

080001e4 <EXT_INT2_IRQHandler>:
    def_default_handler    EXT_INT2_IRQHandler
 80001e4:	e7fe      	b.n	80001e4 <EXT_INT2_IRQHandler>

080001e6 <EXT_INT3_IRQHandler>:
    def_default_handler    EXT_INT3_IRQHandler
 80001e6:	e7fe      	b.n	80001e6 <EXT_INT3_IRQHandler>

080001e8 <EXT_INT4_IRQHandler>:
    def_default_handler    EXT_INT4_IRQHandler
 80001e8:	e7fe      	b.n	80001e8 <EXT_INT4_IRQHandler>
 80001ea:	bf00      	nop

080001ec <_Z9GPIO_Initv>:
#define PORTB_CLK (1UL<<22)

uint16_t i;

void GPIO_Init(){
	MDR_RST_CLK->PER_CLOCK = PORTB_CLK;
 80001ec:	f44f 0280 	mov.w	r2, #4194304	; 0x400000
 80001f0:	4b0a      	ldr	r3, [pc, #40]	; (800021c <_Z9GPIO_Initv+0x30>)
 80001f2:	61da      	str	r2, [r3, #28]
	
	MDR_PORTB->OE = LED_VD5; 
 80001f4:	f503 2310 	add.w	r3, r3, #589824	; 0x90000
 80001f8:	2201      	movs	r2, #1
 80001fa:	605a      	str	r2, [r3, #4]
	MDR_PORTB->FUNC = 0x00000000; 
 80001fc:	2200      	movs	r2, #0
 80001fe:	609a      	str	r2, [r3, #8]
	MDR_PORTB->ANALOG = 0x0000FFFF; 
 8000200:	f64f 71ff 	movw	r1, #65535	; 0xffff
 8000204:	60d9      	str	r1, [r3, #12]
	MDR_PORTB->PULL = (LED_VD5) << 16; 
 8000206:	f44f 3180 	mov.w	r1, #65536	; 0x10000
 800020a:	6119      	str	r1, [r3, #16]
	MDR_PORTB->PD = ~(LED_VD5); 
 800020c:	f06f 0101 	mvn.w	r1, #1
 8000210:	6159      	str	r1, [r3, #20]
	MDR_PORTB->PWR = 0x55555555; 
 8000212:	f04f 3155 	mov.w	r1, #1431655765	; 0x55555555
 8000216:	6199      	str	r1, [r3, #24]
	MDR_PORTB->GFEN = 0; 
 8000218:	61da      	str	r2, [r3, #28]
 800021a:	4770      	bx	lr
 800021c:	0000      	movs	r0, r0
 800021e:	4002      	ands	r2, r0

08000220 <main>:
}	

int main (void)
{
 8000220:	b508      	push	{r3, lr}

	GPIO_Init();
 8000222:	f7ff ffe3 	bl	80001ec <_Z9GPIO_Initv>
	
	while(1) 
	{
		MDR_PORTB->RXTX &= ~LED_VD5; 
 8000226:	4a0e      	ldr	r2, [pc, #56]	; (8000260 <main+0x40>)
 8000228:	f242 7410 	movw	r4, #10000	; 0x2710
 800022c:	480d      	ldr	r0, [pc, #52]	; (8000264 <main+0x44>)
 800022e:	4621      	mov	r1, r4
		for(i=0; i<10000; i++) __NOP;
		MDR_PORTB->RXTX |= LED_VD5; 
 8000230:	4625      	mov	r5, r4

	GPIO_Init();
	
	while(1) 
	{
		MDR_PORTB->RXTX &= ~LED_VD5; 
 8000232:	6813      	ldr	r3, [r2, #0]
 8000234:	f023 0301 	bic.w	r3, r3, #1
 8000238:	6013      	str	r3, [r2, #0]
 800023a:	4623      	mov	r3, r4
 800023c:	3b01      	subs	r3, #1
 800023e:	b29b      	uxth	r3, r3
		for(i=0; i<10000; i++) __NOP;
 8000240:	2b00      	cmp	r3, #0
 8000242:	d1fb      	bne.n	800023c <main+0x1c>
 8000244:	e005      	b.n	8000252 <main+0x32>
 8000246:	3b01      	subs	r3, #1
 8000248:	b29b      	uxth	r3, r3
		MDR_PORTB->RXTX |= LED_VD5; 
		for(i=0; i<10000; i++) __NOP;
 800024a:	2b00      	cmp	r3, #0
 800024c:	d1fb      	bne.n	8000246 <main+0x26>
 800024e:	8001      	strh	r1, [r0, #0]
 8000250:	e7ef      	b.n	8000232 <main+0x12>
 8000252:	8001      	strh	r1, [r0, #0]
	
	while(1) 
	{
		MDR_PORTB->RXTX &= ~LED_VD5; 
		for(i=0; i<10000; i++) __NOP;
		MDR_PORTB->RXTX |= LED_VD5; 
 8000254:	6813      	ldr	r3, [r2, #0]
 8000256:	f043 0301 	orr.w	r3, r3, #1
 800025a:	6013      	str	r3, [r2, #0]
 800025c:	462b      	mov	r3, r5
 800025e:	e7f2      	b.n	8000246 <main+0x26>
 8000260:	0000      	movs	r0, r0
 8000262:	400b      	ands	r3, r1
 8000264:	0004      	movs	r4, r0
 8000266:	2000      	movs	r0, #0

Disassembly of section .data:

20000000 <SystemCoreClock>:
20000000:	1200      	asrs	r0, r0, #8
20000002:	007a      	lsls	r2, r7, #1

Disassembly of section .bss:

20000004 <__bss_start__>:
20000004:	0000      	movs	r0, r0
	...

Disassembly of section .stack_dummy:

20000008 <__HeapBase>:
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	4347      	muls	r7, r0
   2:	3a43      	subs	r2, #67	; 0x43
   4:	2820      	cmp	r0, #32
   6:	4e47      	ldr	r6, [pc, #284]	; (124 <Heap_Size+0x124>)
   8:	2055      	movs	r0, #85	; 0x55
   a:	6f54      	ldr	r4, [r2, #116]	; 0x74
   c:	6c6f      	ldr	r7, [r5, #68]	; 0x44
   e:	2073      	movs	r0, #115	; 0x73
  10:	6f66      	ldr	r6, [r4, #116]	; 0x74
  12:	2072      	movs	r0, #114	; 0x72
  14:	5241      	strh	r1, [r0, r1]
  16:	204d      	movs	r0, #77	; 0x4d
  18:	6d45      	ldr	r5, [r0, #84]	; 0x54
  1a:	6562      	str	r2, [r4, #84]	; 0x54
  1c:	6464      	str	r4, [r4, #68]	; 0x44
  1e:	6465      	str	r5, [r4, #68]	; 0x44
  20:	5020      	str	r0, [r4, r0]
  22:	6f72      	ldr	r2, [r6, #116]	; 0x74
  24:	6563      	str	r3, [r4, #84]	; 0x54
  26:	7373      	strb	r3, [r6, #13]
  28:	726f      	strb	r7, [r5, #9]
  2a:	2973      	cmp	r1, #115	; 0x73
  2c:	3420      	adds	r4, #32
  2e:	392e      	subs	r1, #46	; 0x2e
  30:	332e      	adds	r3, #46	; 0x2e
  32:	3220      	adds	r2, #32
  34:	3130      	adds	r1, #48	; 0x30
  36:	3134      	adds	r1, #52	; 0x34
  38:	3131      	adds	r1, #49	; 0x31
  3a:	2039      	movs	r0, #57	; 0x39
  3c:	7228      	strb	r0, [r5, #8]
  3e:	6c65      	ldr	r5, [r4, #68]	; 0x44
  40:	6165      	str	r5, [r4, #20]
  42:	6573      	str	r3, [r6, #84]	; 0x54
  44:	2029      	movs	r0, #41	; 0x29
  46:	415b      	adcs	r3, r3
  48:	4d52      	ldr	r5, [pc, #328]	; (194 <Heap_Size+0x194>)
  4a:	652f      	str	r7, [r5, #80]	; 0x50
  4c:	626d      	str	r5, [r5, #36]	; 0x24
  4e:	6465      	str	r5, [r4, #68]	; 0x44
  50:	6564      	str	r4, [r4, #84]	; 0x54
  52:	2d64      	cmp	r5, #100	; 0x64
  54:	5f34      	ldrsh	r4, [r6, r4]
  56:	2d39      	cmp	r5, #57	; 0x39
  58:	7262      	strb	r2, [r4, #9]
  5a:	6e61      	ldr	r1, [r4, #100]	; 0x64
  5c:	6863      	ldr	r3, [r4, #4]
  5e:	7220      	strb	r0, [r4, #8]
  60:	7665      	strb	r5, [r4, #25]
  62:	7369      	strb	r1, [r5, #13]
  64:	6f69      	ldr	r1, [r5, #116]	; 0x74
  66:	206e      	movs	r0, #110	; 0x6e
  68:	3132      	adds	r1, #50	; 0x32
  6a:	3238      	adds	r2, #56	; 0x38
  6c:	3837      	subs	r0, #55	; 0x37
  6e:	005d      	lsls	r5, r3, #1

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	3041      	adds	r0, #65	; 0x41
   2:	0000      	movs	r0, r0
   4:	6100      	str	r0, [r0, #16]
   6:	6165      	str	r5, [r4, #20]
   8:	6962      	ldr	r2, [r4, #20]
   a:	0100      	lsls	r0, r0, #4
   c:	0026      	movs	r6, r4
   e:	0000      	movs	r0, r0
  10:	4305      	orrs	r5, r0
  12:	726f      	strb	r7, [r5, #9]
  14:	6574      	str	r4, [r6, #84]	; 0x54
  16:	2d78      	cmp	r5, #120	; 0x78
  18:	334d      	adds	r3, #77	; 0x4d
  1a:	0600      	lsls	r0, r0, #24
  1c:	070a      	lsls	r2, r1, #28
  1e:	094d      	lsrs	r5, r1, #5
  20:	1202      	asrs	r2, r0, #8
  22:	1404      	asrs	r4, r0, #16
  24:	1501      	asrs	r1, r0, #20
  26:	1701      	asrs	r1, r0, #28
  28:	1803      	adds	r3, r0, r0
  2a:	1a01      	subs	r1, r0, r0
  2c:	1e01      	subs	r1, r0, #0
  2e:	2201      	movs	r2, #1
  30:	Address 0x00000030 is out of bounds.


Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0024      	movs	r4, r4
   2:	0000      	movs	r0, r0
   4:	0002      	movs	r2, r0
   6:	0000      	movs	r0, r0
   8:	0000      	movs	r0, r0
   a:	0004      	movs	r4, r0
   c:	0000      	movs	r0, r0
   e:	0000      	movs	r0, r0
  10:	00c0      	lsls	r0, r0, #3
  12:	0800      	lsrs	r0, r0, #32
  14:	0080      	lsls	r0, r0, #2
  16:	0000      	movs	r0, r0
  18:	0140      	lsls	r0, r0, #5
  1a:	0800      	lsrs	r0, r0, #32
  1c:	002c      	movs	r4, r5
	...
  26:	0000      	movs	r0, r0
  28:	001c      	movs	r4, r3
  2a:	0000      	movs	r0, r0
  2c:	0002      	movs	r2, r0
  2e:	01a8      	lsls	r0, r5, #6
  30:	0000      	movs	r0, r0
  32:	0004      	movs	r4, r0
  34:	0000      	movs	r0, r0
  36:	0000      	movs	r0, r0
  38:	016c      	lsls	r4, r5, #5
  3a:	0800      	lsrs	r0, r0, #32
  3c:	007e      	lsls	r6, r7, #1
	...
  46:	0000      	movs	r0, r0
  48:	0024      	movs	r4, r4
  4a:	0000      	movs	r0, r0
  4c:	0002      	movs	r2, r0
  4e:	022c      	lsls	r4, r5, #8
  50:	0000      	movs	r0, r0
  52:	0004      	movs	r4, r0
  54:	0000      	movs	r0, r0
  56:	0000      	movs	r0, r0
  58:	01ec      	lsls	r4, r5, #7
  5a:	0800      	lsrs	r0, r0, #32
  5c:	0034      	movs	r4, r6
  5e:	0000      	movs	r0, r0
  60:	0220      	lsls	r0, r4, #8
  62:	0800      	lsrs	r0, r0, #32
  64:	0048      	lsls	r0, r1, #1
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	01a4      	lsls	r4, r4, #6
   2:	0000      	movs	r0, r0
   4:	0004      	movs	r4, r0
   6:	0000      	movs	r0, r0
   8:	0000      	movs	r0, r0
   a:	0104      	lsls	r4, r0, #4
   c:	00b0      	lsls	r0, r6, #2
   e:	0000      	movs	r0, r0
  10:	1201      	asrs	r1, r0, #8
	...
  1e:	0000      	movs	r0, r0
  20:	0200      	lsls	r0, r0, #8
  22:	0704      	lsls	r4, r0, #28
  24:	0060      	lsls	r0, r4, #1
  26:	0000      	movs	r0, r0
  28:	0102      	lsls	r2, r0, #4
  2a:	9806      	ldr	r0, [sp, #24]
  2c:	0000      	movs	r0, r0
  2e:	0200      	lsls	r0, r0, #8
  30:	0502      	lsls	r2, r0, #20
  32:	021a      	lsls	r2, r3, #8
  34:	0000      	movs	r0, r0
  36:	0403      	lsls	r3, r0, #16
  38:	6905      	ldr	r5, [r0, #16]
  3a:	746e      	strb	r6, [r5, #17]
  3c:	0200      	lsls	r0, r0, #8
  3e:	0801      	lsrs	r1, r0, #32
  40:	0096      	lsls	r6, r2, #2
  42:	0000      	movs	r0, r0
  44:	0202      	lsls	r2, r0, #8
  46:	5a07      	ldrh	r7, [r0, r0]
  48:	0000      	movs	r0, r0
  4a:	0400      	lsls	r0, r0, #16
  4c:	0231      	lsls	r1, r6, #8
  4e:	0000      	movs	r0, r0
  50:	1203      	asrs	r3, r0, #8
  52:	0021      	movs	r1, r4
  54:	0000      	movs	r0, r0
  56:	0402      	lsls	r2, r0, #16
  58:	cb07      	ldmia	r3!, {r0, r1, r2}
  5a:	0001      	movs	r1, r0
  5c:	0500      	lsls	r0, r0, #20
  5e:	004b      	lsls	r3, r1, #1
  60:	0000      	movs	r0, r0
  62:	3006      	adds	r0, #6
  64:	2c02      	cmp	r4, #2
  66:	0803      	lsrs	r3, r0, #32
  68:	0001      	movs	r1, r0
  6a:	0700      	lsls	r0, r0, #28
  6c:	0224      	lsls	r4, r4, #8
  6e:	0000      	movs	r0, r0
  70:	2e02      	cmp	r6, #2
  72:	5d03      	ldrb	r3, [r0, r4]
  74:	0000      	movs	r0, r0
  76:	0000      	movs	r0, r0
  78:	4e07      	ldr	r6, [pc, #28]	; (98 <Heap_Size+0x98>)
  7a:	0000      	movs	r0, r0
  7c:	0200      	lsls	r0, r0, #8
  7e:	032f      	lsls	r7, r5, #12
  80:	005d      	lsls	r5, r3, #1
  82:	0000      	movs	r0, r0
  84:	0704      	lsls	r4, r0, #28
  86:	008b      	lsls	r3, r1, #2
  88:	0000      	movs	r0, r0
  8a:	3002      	adds	r0, #2
  8c:	5d03      	ldrb	r3, [r0, r4]
  8e:	0000      	movs	r0, r0
  90:	0800      	lsrs	r0, r0, #32
  92:	0007      	movs	r7, r0
  94:	0000      	movs	r0, r0
  96:	0200      	lsls	r0, r0, #8
  98:	0331      	lsls	r1, r6, #12
  9a:	005d      	lsls	r5, r3, #1
  9c:	0000      	movs	r0, r0
  9e:	070c      	lsls	r4, r1, #28
  a0:	0206      	lsls	r6, r0, #8
  a2:	0000      	movs	r0, r0
  a4:	3202      	adds	r2, #2
  a6:	5d03      	ldrb	r3, [r0, r4]
  a8:	0000      	movs	r0, r0
  aa:	1000      	asrs	r0, r0, #32
  ac:	3a07      	subs	r2, #7
  ae:	0002      	movs	r2, r0
  b0:	0200      	lsls	r0, r0, #8
  b2:	0333      	lsls	r3, r6, #12
  b4:	005d      	lsls	r5, r3, #1
  b6:	0000      	movs	r0, r0
  b8:	0714      	lsls	r4, r2, #28
  ba:	019e      	lsls	r6, r3, #6
  bc:	0000      	movs	r0, r0
  be:	3402      	adds	r4, #2
  c0:	5d03      	ldrb	r3, [r0, r4]
  c2:	0000      	movs	r0, r0
  c4:	1800      	adds	r0, r0, r0
  c6:	1007      	asrs	r7, r0, #32
  c8:	0002      	movs	r2, r0
  ca:	0200      	lsls	r0, r0, #8
  cc:	0335      	lsls	r5, r6, #12
  ce:	005d      	lsls	r5, r3, #1
  d0:	0000      	movs	r0, r0
  d2:	071c      	lsls	r4, r3, #28
  d4:	0081      	lsls	r1, r0, #2
  d6:	0000      	movs	r0, r0
  d8:	3602      	adds	r6, #2
  da:	5d03      	ldrb	r3, [r0, r4]
  dc:	0000      	movs	r0, r0
  de:	2000      	movs	r0, #0
  e0:	6d07      	ldr	r7, [r0, #80]	; 0x50
  e2:	0000      	movs	r0, r0
  e4:	0200      	lsls	r0, r0, #8
  e6:	0337      	lsls	r7, r6, #12
  e8:	005d      	lsls	r5, r3, #1
  ea:	0000      	movs	r0, r0
  ec:	0724      	lsls	r4, r4, #28
  ee:	01a8      	lsls	r0, r5, #6
  f0:	0000      	movs	r0, r0
  f2:	3802      	subs	r0, #2
  f4:	5d03      	ldrb	r3, [r0, r4]
  f6:	0000      	movs	r0, r0
  f8:	2800      	cmp	r0, #0
  fa:	7707      	strb	r7, [r0, #28]
  fc:	0000      	movs	r0, r0
  fe:	0200      	lsls	r0, r0, #8
 100:	0339      	lsls	r1, r7, #12
 102:	005d      	lsls	r5, r3, #1
 104:	0000      	movs	r0, r0
 106:	002c      	movs	r4, r5
 108:	5108      	str	r0, [r1, r4]
 10a:	0003      	movs	r3, r0
 10c:	0200      	lsls	r0, r0, #8
 10e:	033a      	lsls	r2, r7, #12
 110:	0062      	lsls	r2, r4, #1
 112:	0000      	movs	r0, r0
 114:	f009 0001 	and.w	r0, r9, #1
 118:	0100      	lsls	r0, r0, #4
 11a:	c043      	stmia	r0!, {r0, r1, r6}
 11c:	0000      	movs	r0, r0
 11e:	8008      	strh	r0, [r1, #0]
 120:	0000      	movs	r0, r0
 122:	0100      	lsls	r0, r0, #4
 124:	669c      	str	r4, [r3, #104]	; 0x68
 126:	0001      	movs	r1, r0
 128:	0a00      	lsrs	r0, r0, #8
 12a:	00a4      	lsls	r4, r4, #2
 12c:	0000      	movs	r0, r0
 12e:	4501      	cmp	r1, r0
 130:	004b      	lsls	r3, r1, #1
 132:	0000      	movs	r0, r0
 134:	0000      	movs	r0, r0
 136:	0000      	movs	r0, r0
 138:	d40a      	bmi.n	150 <Heap_Size+0x150>
 13a:	0001      	movs	r1, r0
 13c:	0100      	lsls	r0, r0, #4
 13e:	4b45      	ldr	r3, [pc, #276]	; (254 <Heap_Size+0x254>)
 140:	0000      	movs	r0, r0
 142:	2300      	movs	r3, #0
 144:	0000      	movs	r0, r0
 146:	0a00      	lsrs	r0, r0, #8
 148:	0248      	lsls	r0, r1, #9
 14a:	0000      	movs	r0, r0
 14c:	4501      	cmp	r1, r0
 14e:	004b      	lsls	r3, r1, #1
 150:	0000      	movs	r0, r0
 152:	0057      	lsls	r7, r2, #1
 154:	0000      	movs	r0, r0
 156:	0a0a      	lsrs	r2, r1, #8
 158:	0000      	movs	r0, r0
 15a:	0100      	lsls	r0, r0, #4
 15c:	4b46      	ldr	r3, [pc, #280]	; (278 <Heap_Size+0x278>)
 15e:	0000      	movs	r0, r0
 160:	7b00      	ldrb	r0, [r0, #12]
 162:	0000      	movs	r0, r0
 164:	0000      	movs	r0, r0
 166:	c009      	stmia	r0!, {r0, r3}
 168:	0001      	movs	r1, r0
 16a:	0100      	lsls	r0, r0, #4
 16c:	4083      	lsls	r3, r0
 16e:	0001      	movs	r1, r0
 170:	2c08      	cmp	r4, #8
 172:	0000      	movs	r0, r0
 174:	0100      	lsls	r0, r0, #4
 176:	859c      	strh	r4, [r3, #44]	; 0x2c
 178:	0001      	movs	r1, r0
 17a:	0b00      	lsrs	r0, r0, #12
 17c:	0162      	lsls	r2, r4, #5
 17e:	0800      	lsrs	r0, r0, #32
 180:	0114      	lsls	r4, r2, #4
 182:	0000      	movs	r0, r0
 184:	0c00      	lsrs	r0, r0, #16
 186:	01b3      	lsls	r3, r6, #6
 188:	0000      	movs	r0, r0
 18a:	e404      	b.n	fffff996 <__StackTop+0xdfff7996>
 18c:	9106      	str	r1, [sp, #24]
 18e:	0001      	movs	r1, r0
 190:	0500      	lsls	r0, r0, #20
 192:	0036      	movs	r6, r6
 194:	0000      	movs	r0, r0
 196:	e00d      	b.n	1b4 <Heap_Size+0x1b4>
 198:	0001      	movs	r1, r0
 19a:	0100      	lsls	r0, r0, #4
 19c:	4b34      	ldr	r3, [pc, #208]	; (270 <Heap_Size+0x270>)
 19e:	0000      	movs	r0, r0
 1a0:	0500      	lsls	r0, r0, #20
 1a2:	0003      	movs	r3, r0
 1a4:	0000      	movs	r0, r0
 1a6:	0020      	movs	r0, r4
 1a8:	0080      	lsls	r0, r0, #2
 1aa:	0000      	movs	r0, r0
 1ac:	0002      	movs	r2, r0
 1ae:	00bb      	lsls	r3, r7, #2
 1b0:	0000      	movs	r0, r0
 1b2:	0104      	lsls	r4, r0, #4
 1b4:	0109      	lsls	r1, r1, #4
 1b6:	0000      	movs	r0, r0
 1b8:	016c      	lsls	r4, r5, #5
 1ba:	0800      	lsrs	r0, r0, #32
 1bc:	01ea      	lsls	r2, r5, #7
 1be:	0800      	lsrs	r0, r0, #32
 1c0:	682f      	ldr	r7, [r5, #0]
 1c2:	6d6f      	ldr	r7, [r5, #84]	; 0x54
 1c4:	2f65      	cmp	r7, #101	; 0x65
 1c6:	656e      	str	r6, [r5, #84]	; 0x54
 1c8:	2f73      	cmp	r7, #115	; 0x73
 1ca:	6564      	str	r4, [r4, #84]	; 0x54
 1cc:	6576      	str	r6, [r6, #84]	; 0x54
 1ce:	2f6c      	cmp	r7, #108	; 0x6c
 1d0:	696d      	ldr	r5, [r5, #20]
 1d2:	616c      	str	r4, [r5, #20]
 1d4:	622f      	str	r7, [r5, #32]
 1d6:	6975      	ldr	r5, [r6, #20]
 1d8:	646c      	str	r4, [r5, #68]	; 0x44
 1da:	6e69      	ldr	r1, [r5, #100]	; 0x64
 1dc:	2f67      	cmp	r7, #103	; 0x67
 1de:	7273      	strb	r3, [r6, #9]
 1e0:	2f63      	cmp	r7, #99	; 0x63
 1e2:	7473      	strb	r3, [r6, #17]
 1e4:	7261      	strb	r1, [r4, #9]
 1e6:	7574      	strb	r4, [r6, #21]
 1e8:	2f70      	cmp	r7, #112	; 0x70
 1ea:	7473      	strb	r3, [r6, #17]
 1ec:	7261      	strb	r1, [r4, #9]
 1ee:	7574      	strb	r4, [r6, #21]
 1f0:	5f70      	ldrsh	r0, [r6, r5]
 1f2:	444d      	add	r5, r9
 1f4:	3352      	adds	r3, #82	; 0x52
 1f6:	4632      	mov	r2, r6
 1f8:	5139      	str	r1, [r7, r4]
 1fa:	2e78      	cmp	r6, #120	; 0x78
 1fc:	0053      	lsls	r3, r2, #1
 1fe:	682f      	ldr	r7, [r5, #0]
 200:	6d6f      	ldr	r7, [r5, #84]	; 0x54
 202:	2f65      	cmp	r7, #101	; 0x65
 204:	656e      	str	r6, [r5, #84]	; 0x54
 206:	2f73      	cmp	r7, #115	; 0x73
 208:	6564      	str	r4, [r4, #84]	; 0x54
 20a:	6576      	str	r6, [r6, #84]	; 0x54
 20c:	2f6c      	cmp	r7, #108	; 0x6c
 20e:	696d      	ldr	r5, [r5, #20]
 210:	616c      	str	r4, [r5, #20]
 212:	622f      	str	r7, [r5, #32]
 214:	6975      	ldr	r5, [r6, #20]
 216:	646c      	str	r4, [r5, #68]	; 0x44
 218:	6e69      	ldr	r1, [r5, #100]	; 0x64
 21a:	0067      	lsls	r7, r4, #1
 21c:	4e47      	ldr	r6, [pc, #284]	; (33c <Heap_Size+0x33c>)
 21e:	2055      	movs	r0, #85	; 0x55
 220:	5341      	strh	r1, [r0, r5]
 222:	3220      	adds	r2, #32
 224:	322e      	adds	r2, #46	; 0x2e
 226:	2e34      	cmp	r6, #52	; 0x34
 228:	0030      	movs	r0, r6
 22a:	8001      	strh	r1, [r0, #0]
 22c:	0268      	lsls	r0, r5, #9
 22e:	0000      	movs	r0, r0
 230:	0004      	movs	r4, r0
 232:	00cf      	lsls	r7, r1, #3
 234:	0000      	movs	r0, r0
 236:	0104      	lsls	r4, r0, #4
 238:	0254      	lsls	r4, r2, #9
 23a:	0000      	movs	r0, r0
 23c:	2704      	movs	r7, #4
 23e:	0004      	movs	r4, r0
 240:	bd00      	pop	{pc}
 242:	0003      	movs	r3, r0
 244:	1800      	adds	r0, r0, r0
 246:	0000      	movs	r0, r0
 248:	0000      	movs	r0, r0
 24a:	0000      	movs	r0, r0
 24c:	b300      	cbz	r0, 290 <Heap_Size+0x290>
 24e:	0001      	movs	r1, r0
 250:	0200      	lsls	r0, r0, #8
 252:	0601      	lsls	r1, r0, #24
 254:	0098      	lsls	r0, r3, #2
 256:	0000      	movs	r0, r0
 258:	0202      	lsls	r2, r0, #8
 25a:	1a05      	subs	r5, r0, r0
 25c:	0002      	movs	r2, r0
 25e:	0300      	lsls	r0, r0, #12
 260:	0504      	lsls	r4, r0, #20
 262:	6e69      	ldr	r1, [r5, #100]	; 0x64
 264:	0074      	lsls	r4, r6, #1
 266:	0102      	lsls	r2, r0, #4
 268:	9608      	str	r6, [sp, #32]
 26a:	0000      	movs	r0, r0
 26c:	0400      	lsls	r0, r0, #16
 26e:	0403      	lsls	r3, r0, #16
 270:	0000      	movs	r0, r0
 272:	1102      	asrs	r2, r0, #4
 274:	004c      	lsls	r4, r1, #1
 276:	0000      	movs	r0, r0
 278:	0202      	lsls	r2, r0, #8
 27a:	5a07      	ldrh	r7, [r0, r0]
 27c:	0000      	movs	r0, r0
 27e:	0400      	lsls	r0, r0, #16
 280:	0231      	lsls	r1, r6, #8
 282:	0000      	movs	r0, r0
 284:	1202      	asrs	r2, r0, #8
 286:	005e      	lsls	r6, r3, #1
 288:	0000      	movs	r0, r0
 28a:	0402      	lsls	r2, r0, #16
 28c:	6007      	str	r7, [r0, #0]
 28e:	0000      	movs	r0, r0
 290:	0200      	lsls	r0, r0, #8
 292:	0704      	lsls	r4, r0, #28
 294:	01cb      	lsls	r3, r1, #7
 296:	0000      	movs	r0, r0
 298:	5305      	strh	r5, [r0, r4]
 29a:	0000      	movs	r0, r0
 29c:	0600      	lsls	r0, r0, #24
 29e:	0301      	lsls	r1, r0, #12
 2a0:	1269      	asrs	r1, r5, #9
 2a2:	0004      	movs	r4, r0
 2a4:	8a00      	ldrh	r0, [r0, #16]
 2a6:	0000      	movs	r0, r0
 2a8:	0700      	lsls	r0, r0, #28
 2aa:	0382      	lsls	r2, r0, #14
 2ac:	0000      	movs	r0, r0
 2ae:	0800      	lsrs	r0, r0, #32
 2b0:	4553      	cmp	r3, sl
 2b2:	0054      	lsls	r4, r2, #1
 2b4:	0001      	movs	r1, r0
 2b6:	1404      	asrs	r4, r0, #16
 2b8:	0004      	movs	r4, r0
 2ba:	0300      	lsls	r0, r0, #12
 2bc:	7169      	strb	r1, [r5, #5]
 2be:	0000      	movs	r0, r0
 2c0:	0600      	lsls	r0, r0, #24
 2c2:	0301      	lsls	r1, r0, #12
 2c4:	db6d      	blt.n	3a2 <Heap_Size+0x3a2>
 2c6:	0003      	movs	r3, r0
 2c8:	ae00      	add	r6, sp, #0
 2ca:	0000      	movs	r0, r0
 2cc:	0700      	lsls	r0, r0, #28
 2ce:	041f      	lsls	r7, r3, #16
 2d0:	0000      	movs	r0, r0
 2d2:	0700      	lsls	r0, r0, #28
 2d4:	0373      	lsls	r3, r6, #13
 2d6:	0000      	movs	r0, r0
 2d8:	0001      	movs	r1, r0
 2da:	dd04      	ble.n	2e6 <Heap_Size+0x2e6>
 2dc:	0003      	movs	r3, r0
 2de:	0300      	lsls	r0, r0, #12
 2e0:	956d      	str	r5, [sp, #436]	; 0x1b4
 2e2:	0000      	movs	r0, r0
 2e4:	0600      	lsls	r0, r0, #24
 2e6:	0301      	lsls	r1, r0, #12
 2e8:	aa70      	add	r2, sp, #448	; 0x1c0
 2ea:	0003      	movs	r3, r0
 2ec:	d200      	bcs.n	2f0 <Heap_Size+0x2f0>
 2ee:	0000      	movs	r0, r0
 2f0:	0700      	lsls	r0, r0, #28
 2f2:	040c      	lsls	r4, r1, #16
 2f4:	0000      	movs	r0, r0
 2f6:	0700      	lsls	r0, r0, #28
 2f8:	037a      	lsls	r2, r7, #13
 2fa:	0000      	movs	r0, r0
 2fc:	0001      	movs	r1, r0
 2fe:	ac04      	add	r4, sp, #16
 300:	0003      	movs	r3, r0
 302:	0300      	lsls	r0, r0, #12
 304:	b970      	cbnz	r0, 324 <Heap_Size+0x324>
 306:	0000      	movs	r0, r0
 308:	0900      	lsrs	r0, r0, #4
 30a:	0330      	lsls	r0, r6, #12
 30c:	032d      	lsls	r5, r5, #12
 30e:	034f      	lsls	r7, r1, #13
 310:	0000      	movs	r0, r0
 312:	0187      	lsls	r7, r0, #6
 314:	0000      	movs	r0, r0
 316:	240a      	movs	r4, #10
 318:	0002      	movs	r2, r0
 31a:	0300      	lsls	r0, r0, #12
 31c:	032e      	lsls	r6, r5, #12
 31e:	006c      	lsls	r4, r5, #1
 320:	0000      	movs	r0, r0
 322:	0a00      	lsrs	r0, r0, #8
 324:	004e      	lsls	r6, r1, #1
 326:	0000      	movs	r0, r0
 328:	2f03      	cmp	r7, #3
 32a:	6c03      	ldr	r3, [r0, #64]	; 0x40
 32c:	0000      	movs	r0, r0
 32e:	0400      	lsls	r0, r0, #16
 330:	8b0a      	ldrh	r2, [r1, #24]
 332:	0000      	movs	r0, r0
 334:	0300      	lsls	r0, r0, #12
 336:	0330      	lsls	r0, r6, #12
 338:	006c      	lsls	r4, r5, #1
 33a:	0000      	movs	r0, r0
 33c:	0a08      	lsrs	r0, r1, #8
 33e:	0000      	movs	r0, r0
 340:	0000      	movs	r0, r0
 342:	3103      	adds	r1, #3
 344:	6c03      	ldr	r3, [r0, #64]	; 0x40
 346:	0000      	movs	r0, r0
 348:	0c00      	lsrs	r0, r0, #16
 34a:	060a      	lsls	r2, r1, #24
 34c:	0002      	movs	r2, r0
 34e:	0300      	lsls	r0, r0, #12
 350:	0332      	lsls	r2, r6, #12
 352:	006c      	lsls	r4, r5, #1
 354:	0000      	movs	r0, r0
 356:	0a10      	lsrs	r0, r2, #8
 358:	023a      	lsls	r2, r7, #8
 35a:	0000      	movs	r0, r0
 35c:	3303      	adds	r3, #3
 35e:	6c03      	ldr	r3, [r0, #64]	; 0x40
 360:	0000      	movs	r0, r0
 362:	1400      	asrs	r0, r0, #16
 364:	9e0a      	ldr	r6, [sp, #40]	; 0x28
 366:	0001      	movs	r1, r0
 368:	0300      	lsls	r0, r0, #12
 36a:	0334      	lsls	r4, r6, #12
 36c:	006c      	lsls	r4, r5, #1
 36e:	0000      	movs	r0, r0
 370:	0a18      	lsrs	r0, r3, #8
 372:	0210      	lsls	r0, r2, #8
 374:	0000      	movs	r0, r0
 376:	3503      	adds	r5, #3
 378:	6c03      	ldr	r3, [r0, #64]	; 0x40
 37a:	0000      	movs	r0, r0
 37c:	1c00      	adds	r0, r0, #0
 37e:	810a      	strh	r2, [r1, #8]
 380:	0000      	movs	r0, r0
 382:	0300      	lsls	r0, r0, #12
 384:	0336      	lsls	r6, r6, #12
 386:	006c      	lsls	r4, r5, #1
 388:	0000      	movs	r0, r0
 38a:	0a20      	lsrs	r0, r4, #8
 38c:	006d      	lsls	r5, r5, #1
 38e:	0000      	movs	r0, r0
 390:	3703      	adds	r7, #3
 392:	6c03      	ldr	r3, [r0, #64]	; 0x40
 394:	0000      	movs	r0, r0
 396:	2400      	movs	r4, #0
 398:	a80a      	add	r0, sp, #40	; 0x28
 39a:	0001      	movs	r1, r0
 39c:	0300      	lsls	r0, r0, #12
 39e:	0338      	lsls	r0, r7, #12
 3a0:	006c      	lsls	r4, r5, #1
 3a2:	0000      	movs	r0, r0
 3a4:	0a28      	lsrs	r0, r5, #8
 3a6:	0077      	lsls	r7, r6, #1
 3a8:	0000      	movs	r0, r0
 3aa:	3903      	subs	r1, #3
 3ac:	6c03      	ldr	r3, [r0, #64]	; 0x40
 3ae:	0000      	movs	r0, r0
 3b0:	2c00      	cmp	r4, #0
 3b2:	0b00      	lsrs	r0, r0, #12
 3b4:	0351      	lsls	r1, r2, #13
 3b6:	0000      	movs	r0, r0
 3b8:	3a03      	subs	r2, #3
 3ba:	dd03      	ble.n	3c4 <Heap_Size+0x3c4>
 3bc:	0000      	movs	r0, r0
 3be:	0900      	lsrs	r0, r0, #4
 3c0:	0320      	lsls	r0, r4, #12
 3c2:	099d      	lsrs	r5, r3, #6
 3c4:	038d      	lsls	r5, r1, #14
 3c6:	0000      	movs	r0, r0
 3c8:	0207      	lsls	r7, r0, #8
 3ca:	0000      	movs	r0, r0
 3cc:	880a      	ldrh	r2, [r1, #0]
 3ce:	0003      	movs	r3, r0
 3d0:	0300      	lsls	r0, r0, #12
 3d2:	099e      	lsrs	r6, r3, #6
 3d4:	006c      	lsls	r4, r5, #1
 3d6:	0000      	movs	r0, r0
 3d8:	0c00      	lsrs	r0, r0, #16
 3da:	454f      	cmp	r7, r9
 3dc:	0300      	lsls	r0, r0, #12
 3de:	099f      	lsrs	r7, r3, #6
 3e0:	006c      	lsls	r4, r5, #1
 3e2:	0000      	movs	r0, r0
 3e4:	0a04      	lsrs	r4, r0, #8
 3e6:	03a0      	lsls	r0, r4, #14
 3e8:	0000      	movs	r0, r0
 3ea:	a003      	add	r0, pc, #12	; (adr r0, 3f8 <Heap_Size+0x3f8>)
 3ec:	6c09      	ldr	r1, [r1, #64]	; 0x40
 3ee:	0000      	movs	r0, r0
 3f0:	0800      	lsrs	r0, r0, #32
 3f2:	ed0a 0003 	stc	0, cr0, [sl, #-12]
 3f6:	0300      	lsls	r0, r0, #12
 3f8:	09a1      	lsrs	r1, r4, #6
 3fa:	006c      	lsls	r4, r5, #1
 3fc:	0000      	movs	r0, r0
 3fe:	0a0c      	lsrs	r4, r1, #8
 400:	03b8      	lsls	r0, r7, #14
 402:	0000      	movs	r0, r0
 404:	a203      	add	r2, pc, #12	; (adr r2, 414 <Heap_Size+0x414>)
 406:	6c09      	ldr	r1, [r1, #64]	; 0x40
 408:	0000      	movs	r0, r0
 40a:	1000      	asrs	r0, r0, #32
 40c:	500c      	str	r4, [r1, r0]
 40e:	0044      	lsls	r4, r0, #1
 410:	a303      	add	r3, pc, #12	; (adr r3, 420 <Heap_Size+0x420>)
 412:	6c09      	ldr	r1, [r1, #64]	; 0x40
 414:	0000      	movs	r0, r0
 416:	1400      	asrs	r0, r0, #16
 418:	500c      	str	r4, [r1, r0]
 41a:	5257      	strh	r7, [r2, r1]
 41c:	0300      	lsls	r0, r0, #12
 41e:	09a4      	lsrs	r4, r4, #6
 420:	006c      	lsls	r4, r5, #1
 422:	0000      	movs	r0, r0
 424:	0a18      	lsrs	r0, r3, #8
 426:	03f4      	lsls	r4, r6, #15
 428:	0000      	movs	r0, r0
 42a:	a503      	add	r5, pc, #12	; (adr r5, 438 <Heap_Size+0x438>)
 42c:	6c09      	ldr	r1, [r1, #64]	; 0x40
 42e:	0000      	movs	r0, r0
 430:	1c00      	adds	r0, r0, #0
 432:	0b00      	lsrs	r0, r0, #12
 434:	038f      	lsls	r7, r1, #14
 436:	0000      	movs	r0, r0
 438:	a603      	add	r6, pc, #12	; (adr r6, 448 <Heap_Size+0x448>)
 43a:	9309      	str	r3, [sp, #36]	; 0x24
 43c:	0001      	movs	r1, r0
 43e:	0d00      	lsrs	r0, r0, #20
 440:	03f9      	lsls	r1, r7, #15
 442:	0000      	movs	r0, r0
 444:	0b01      	lsrs	r1, r0, #12
 446:	0365      	lsls	r5, r4, #13
 448:	0000      	movs	r0, r0
 44a:	01ec      	lsls	r4, r5, #7
 44c:	0800      	lsrs	r0, r0, #32
 44e:	0034      	movs	r4, r6
 450:	0000      	movs	r0, r0
 452:	9c01      	ldr	r4, [sp, #4]
 454:	a50e      	add	r5, pc, #56	; (adr r5, 490 <Heap_Size+0x490>)
 456:	0003      	movs	r3, r0
 458:	0100      	lsls	r0, r0, #4
 45a:	3317      	adds	r3, #23
 45c:	0000      	movs	r0, r0
 45e:	2000      	movs	r0, #0
 460:	0002      	movs	r2, r0
 462:	4808      	ldr	r0, [pc, #32]	; (484 <Heap_Size+0x484>)
 464:	0000      	movs	r0, r0
 466:	0100      	lsls	r0, r0, #4
 468:	4b9c      	ldr	r3, [pc, #624]	; (6dc <Heap_Size+0x6dc>)
 46a:	0002      	movs	r2, r0
 46c:	0f00      	lsrs	r0, r0, #28
 46e:	0226      	lsls	r6, r4, #8
 470:	0800      	lsrs	r0, r0, #32
 472:	0213      	lsls	r3, r2, #8
 474:	0000      	movs	r0, r0
 476:	1000      	asrs	r0, r0, #32
 478:	01b3      	lsls	r3, r6, #6
 47a:	0000      	movs	r0, r0
 47c:	e404      	b.n	fffffc88 <__StackTop+0xdfff7c88>
 47e:	5706      	ldrsb	r6, [r0, r4]
 480:	0002      	movs	r2, r0
 482:	0500      	lsls	r0, r0, #20
 484:	0033      	movs	r3, r6
 486:	0000      	movs	r0, r0
 488:	6911      	ldr	r1, [r2, #16]
 48a:	0100      	lsls	r0, r0, #4
 48c:	4109      	asrs	r1, r1
 48e:	0000      	movs	r0, r0
 490:	0500      	lsls	r0, r0, #20
 492:	0403      	lsls	r3, r0, #16
 494:	0000      	movs	r0, r0
 496:	0020      	movs	r0, r4

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	1101      	asrs	r1, r0, #4
   2:	2501      	movs	r5, #1
   4:	130e      	asrs	r6, r1, #12
   6:	030b      	lsls	r3, r1, #12
   8:	550e      	strb	r6, [r1, r4]
   a:	1117      	asrs	r7, r2, #4
   c:	1001      	asrs	r1, r0, #32
   e:	0017      	movs	r7, r2
  10:	0200      	lsls	r0, r0, #8
  12:	0024      	movs	r4, r4
  14:	0b0b      	lsrs	r3, r1, #12
  16:	0b3e      	lsrs	r6, r7, #12
  18:	0e03      	lsrs	r3, r0, #24
  1a:	0000      	movs	r0, r0
  1c:	2403      	movs	r4, #3
  1e:	0b00      	lsrs	r0, r0, #12
  20:	3e0b      	subs	r6, #11
  22:	030b      	lsls	r3, r1, #12
  24:	0008      	movs	r0, r1
  26:	0400      	lsls	r0, r0, #16
  28:	0016      	movs	r6, r2
  2a:	0e03      	lsrs	r3, r0, #24
  2c:	0b3a      	lsrs	r2, r7, #12
  2e:	0b3b      	lsrs	r3, r7, #12
  30:	1349      	asrs	r1, r1, #13
  32:	0000      	movs	r0, r0
  34:	3505      	adds	r5, #5
  36:	4900      	ldr	r1, [pc, #0]	; (38 <Heap_Size+0x38>)
  38:	0013      	movs	r3, r2
  3a:	0600      	lsls	r0, r0, #24
  3c:	0113      	lsls	r3, r2, #4
  3e:	0b0b      	lsrs	r3, r1, #12
  40:	0b3a      	lsrs	r2, r7, #12
  42:	053b      	lsls	r3, r7, #20
  44:	1301      	asrs	r1, r0, #12
  46:	0000      	movs	r0, r0
  48:	0d07      	lsrs	r7, r0, #20
  4a:	0300      	lsls	r0, r0, #12
  4c:	3a0e      	subs	r2, #14
  4e:	3b0b      	subs	r3, #11
  50:	4905      	ldr	r1, [pc, #20]	; (68 <Heap_Size+0x68>)
  52:	3813      	subs	r0, #19
  54:	000b      	movs	r3, r1
  56:	0800      	lsrs	r0, r0, #32
  58:	0016      	movs	r6, r2
  5a:	0e03      	lsrs	r3, r0, #24
  5c:	0b3a      	lsrs	r2, r7, #12
  5e:	053b      	lsls	r3, r7, #20
  60:	1349      	asrs	r1, r1, #13
  62:	0000      	movs	r0, r0
  64:	2e09      	cmp	r6, #9
  66:	3f01      	subs	r7, #1
  68:	0319      	lsls	r1, r3, #12
  6a:	3a0e      	subs	r2, #14
  6c:	3b0b      	subs	r3, #11
  6e:	270b      	movs	r7, #11
  70:	1119      	asrs	r1, r3, #4
  72:	1201      	asrs	r1, r0, #8
  74:	4006      	ands	r6, r0
  76:	9718      	str	r7, [sp, #96]	; 0x60
  78:	1942      	adds	r2, r0, r5
  7a:	1301      	asrs	r1, r0, #12
  7c:	0000      	movs	r0, r0
  7e:	340a      	adds	r4, #10
  80:	0300      	lsls	r0, r0, #12
  82:	3a0e      	subs	r2, #14
  84:	3b0b      	subs	r3, #11
  86:	490b      	ldr	r1, [pc, #44]	; (b4 <Heap_Size+0xb4>)
  88:	0213      	lsls	r3, r2, #8
  8a:	0017      	movs	r7, r2
  8c:	0b00      	lsrs	r0, r0, #12
  8e:	8289      	strh	r1, [r1, #20]
  90:	0001      	movs	r1, r0
  92:	0111      	lsls	r1, r2, #4
  94:	1331      	asrs	r1, r6, #12
  96:	0000      	movs	r0, r0
  98:	340c      	adds	r4, #12
  9a:	0300      	lsls	r0, r0, #12
  9c:	3a0e      	subs	r2, #14
  9e:	3b0b      	subs	r3, #11
  a0:	4905      	ldr	r1, [pc, #20]	; (b8 <Heap_Size+0xb8>)
  a2:	3f13      	subs	r7, #19
  a4:	3c19      	subs	r4, #25
  a6:	0019      	movs	r1, r3
  a8:	0d00      	lsrs	r0, r0, #20
  aa:	0034      	movs	r4, r6
  ac:	0e03      	lsrs	r3, r0, #24
  ae:	0b3a      	lsrs	r2, r7, #12
  b0:	0b3b      	lsrs	r3, r7, #12
  b2:	1349      	asrs	r1, r1, #13
  b4:	193f      	adds	r7, r7, r4
  b6:	1802      	adds	r2, r0, r0
  b8:	0000      	movs	r0, r0
  ba:	0100      	lsls	r0, r0, #4
  bc:	0011      	movs	r1, r2
  be:	0610      	lsls	r0, r2, #24
  c0:	0111      	lsls	r1, r2, #4
  c2:	0112      	lsls	r2, r2, #4
  c4:	0803      	lsrs	r3, r0, #32
  c6:	081b      	lsrs	r3, r3, #32
  c8:	0825      	lsrs	r5, r4, #32
  ca:	0513      	lsls	r3, r2, #20
  cc:	0000      	movs	r0, r0
  ce:	0100      	lsls	r0, r0, #4
  d0:	0111      	lsls	r1, r2, #4
  d2:	0e25      	lsrs	r5, r4, #24
  d4:	0b13      	lsrs	r3, r2, #12
  d6:	0e03      	lsrs	r3, r0, #24
  d8:	0e1b      	lsrs	r3, r3, #24
  da:	1755      	asrs	r5, r2, #29
  dc:	0111      	lsls	r1, r2, #4
  de:	1710      	asrs	r0, r2, #28
  e0:	0000      	movs	r0, r0
  e2:	2402      	movs	r4, #2
  e4:	0b00      	lsrs	r0, r0, #12
  e6:	3e0b      	subs	r6, #11
  e8:	030b      	lsls	r3, r1, #12
  ea:	000e      	movs	r6, r1
  ec:	0300      	lsls	r0, r0, #12
  ee:	0024      	movs	r4, r4
  f0:	0b0b      	lsrs	r3, r1, #12
  f2:	0b3e      	lsrs	r6, r7, #12
  f4:	0803      	lsrs	r3, r0, #32
  f6:	0000      	movs	r0, r0
  f8:	1604      	asrs	r4, r0, #24
  fa:	0300      	lsls	r0, r0, #12
  fc:	3a0e      	subs	r2, #14
  fe:	3b0b      	subs	r3, #11
 100:	490b      	ldr	r1, [pc, #44]	; (130 <Heap_Size+0x130>)
 102:	0013      	movs	r3, r2
 104:	0500      	lsls	r0, r0, #20
 106:	0035      	movs	r5, r6
 108:	1349      	asrs	r1, r1, #13
 10a:	0000      	movs	r0, r0
 10c:	0406      	lsls	r6, r0, #16
 10e:	0b01      	lsrs	r1, r0, #12
 110:	3a0b      	subs	r2, #11
 112:	3b0b      	subs	r3, #11
 114:	6e0b      	ldr	r3, [r1, #96]	; 0x60
 116:	010e      	lsls	r6, r1, #4
 118:	0013      	movs	r3, r2
 11a:	0700      	lsls	r0, r0, #28
 11c:	0028      	movs	r0, r5
 11e:	0e03      	lsrs	r3, r0, #24
 120:	0d1c      	lsrs	r4, r3, #20
 122:	0000      	movs	r0, r0
 124:	2808      	cmp	r0, #8
 126:	0300      	lsls	r0, r0, #12
 128:	1c08      	adds	r0, r1, #0
 12a:	000d      	movs	r5, r1
 12c:	0900      	lsrs	r0, r0, #4
 12e:	0113      	lsls	r3, r2, #4
 130:	0b0b      	lsrs	r3, r1, #12
 132:	0b3a      	lsrs	r2, r7, #12
 134:	053b      	lsls	r3, r7, #20
 136:	0e6e      	lsrs	r6, r5, #25
 138:	1301      	asrs	r1, r0, #12
 13a:	0000      	movs	r0, r0
 13c:	0d0a      	lsrs	r2, r1, #20
 13e:	0300      	lsls	r0, r0, #12
 140:	3a0e      	subs	r2, #14
 142:	3b0b      	subs	r3, #11
 144:	4905      	ldr	r1, [pc, #20]	; (15c <Heap_Size+0x15c>)
 146:	3813      	subs	r0, #19
 148:	000b      	movs	r3, r1
 14a:	0b00      	lsrs	r0, r0, #12
 14c:	0016      	movs	r6, r2
 14e:	0e03      	lsrs	r3, r0, #24
 150:	0b3a      	lsrs	r2, r7, #12
 152:	053b      	lsls	r3, r7, #20
 154:	1349      	asrs	r1, r1, #13
 156:	0000      	movs	r0, r0
 158:	0d0c      	lsrs	r4, r1, #20
 15a:	0300      	lsls	r0, r0, #12
 15c:	3a08      	subs	r2, #8
 15e:	3b0b      	subs	r3, #11
 160:	4905      	ldr	r1, [pc, #20]	; (178 <Heap_Size+0x178>)
 162:	3813      	subs	r0, #19
 164:	000b      	movs	r3, r1
 166:	0d00      	lsrs	r0, r0, #20
 168:	002e      	movs	r6, r5
 16a:	193f      	adds	r7, r7, r4
 16c:	0e03      	lsrs	r3, r0, #24
 16e:	0b3a      	lsrs	r2, r7, #12
 170:	0b3b      	lsrs	r3, r7, #12
 172:	0e6e      	lsrs	r6, r5, #25
 174:	0111      	lsls	r1, r2, #4
 176:	0612      	lsls	r2, r2, #24
 178:	1840      	adds	r0, r0, r1
 17a:	4297      	cmp	r7, r2
 17c:	0019      	movs	r1, r3
 17e:	0e00      	lsrs	r0, r0, #24
 180:	012e      	lsls	r6, r5, #4
 182:	193f      	adds	r7, r7, r4
 184:	0e03      	lsrs	r3, r0, #24
 186:	0b3a      	lsrs	r2, r7, #12
 188:	0b3b      	lsrs	r3, r7, #12
 18a:	1349      	asrs	r1, r1, #13
 18c:	0111      	lsls	r1, r2, #4
 18e:	0612      	lsls	r2, r2, #24
 190:	1840      	adds	r0, r0, r1
 192:	4297      	cmp	r7, r2
 194:	0119      	lsls	r1, r3, #4
 196:	0013      	movs	r3, r2
 198:	0f00      	lsrs	r0, r0, #28
 19a:	8289      	strh	r1, [r1, #20]
 19c:	0001      	movs	r1, r0
 19e:	0111      	lsls	r1, r2, #4
 1a0:	1331      	asrs	r1, r6, #12
 1a2:	0000      	movs	r0, r0
 1a4:	3410      	adds	r4, #16
 1a6:	0300      	lsls	r0, r0, #12
 1a8:	3a0e      	subs	r2, #14
 1aa:	3b0b      	subs	r3, #11
 1ac:	4905      	ldr	r1, [pc, #20]	; (1c4 <Heap_Size+0x1c4>)
 1ae:	3f13      	subs	r7, #19
 1b0:	3c19      	subs	r4, #25
 1b2:	0019      	movs	r1, r3
 1b4:	1100      	asrs	r0, r0, #4
 1b6:	0034      	movs	r4, r6
 1b8:	0803      	lsrs	r3, r0, #32
 1ba:	0b3a      	lsrs	r2, r7, #12
 1bc:	0b3b      	lsrs	r3, r7, #12
 1be:	1349      	asrs	r1, r1, #13
 1c0:	193f      	adds	r7, r7, r4
 1c2:	1802      	adds	r2, r0, r0
 1c4:	0000      	movs	r0, r0
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	0105      	lsls	r5, r0, #4
   2:	0000      	movs	r0, r0
   4:	0002      	movs	r2, r0
   6:	00c7      	lsls	r7, r0, #3
   8:	0000      	movs	r0, r0
   a:	0102      	lsls	r2, r0, #4
   c:	0efb      	lsrs	r3, r7, #27
   e:	000d      	movs	r5, r1
  10:	0101      	lsls	r1, r0, #4
  12:	0101      	lsls	r1, r0, #4
  14:	0000      	movs	r0, r0
  16:	0100      	lsls	r0, r0, #4
  18:	0000      	movs	r0, r0
  1a:	2f01      	cmp	r7, #1
  1c:	6f68      	ldr	r0, [r5, #116]	; 0x74
  1e:	656d      	str	r5, [r5, #84]	; 0x54
  20:	6e2f      	ldr	r7, [r5, #96]	; 0x60
  22:	7365      	strb	r5, [r4, #13]
  24:	642f      	str	r7, [r5, #64]	; 0x40
  26:	7665      	strb	r5, [r4, #25]
  28:	6c65      	ldr	r5, [r4, #68]	; 0x44
  2a:	6d2f      	ldr	r7, [r5, #80]	; 0x50
  2c:	6c69      	ldr	r1, [r5, #68]	; 0x44
  2e:	2f61      	cmp	r7, #97	; 0x61
  30:	7562      	strb	r2, [r4, #21]
  32:	6c69      	ldr	r1, [r5, #68]	; 0x44
  34:	6964      	ldr	r4, [r4, #20]
  36:	676e      	str	r6, [r5, #116]	; 0x74
  38:	732f      	strb	r7, [r5, #12]
  3a:	6372      	str	r2, [r6, #52]	; 0x34
  3c:	732f      	strb	r7, [r5, #12]
  3e:	7379      	strb	r1, [r7, #13]
  40:	6574      	str	r4, [r6, #84]	; 0x54
  42:	006d      	lsls	r5, r5, #1
  44:	682f      	ldr	r7, [r5, #0]
  46:	6d6f      	ldr	r7, [r5, #84]	; 0x54
  48:	2f65      	cmp	r7, #101	; 0x65
  4a:	656e      	str	r6, [r5, #84]	; 0x54
  4c:	2f73      	cmp	r7, #115	; 0x73
  4e:	6564      	str	r4, [r4, #84]	; 0x54
  50:	6576      	str	r6, [r6, #84]	; 0x54
  52:	2f6c      	cmp	r7, #108	; 0x6c
  54:	696d      	ldr	r5, [r5, #20]
  56:	616c      	str	r4, [r5, #20]
  58:	622f      	str	r7, [r5, #32]
  5a:	6975      	ldr	r5, [r6, #20]
  5c:	646c      	str	r4, [r5, #68]	; 0x44
  5e:	6e69      	ldr	r1, [r5, #100]	; 0x64
  60:	2f67      	cmp	r7, #103	; 0x67
  62:	7273      	strb	r3, [r6, #9]
  64:	2f63      	cmp	r7, #99	; 0x63
  66:	6e69      	ldr	r1, [r5, #100]	; 0x64
  68:	0063      	lsls	r3, r4, #1
  6a:	682f      	ldr	r7, [r5, #0]
  6c:	6d6f      	ldr	r7, [r5, #84]	; 0x54
  6e:	2f65      	cmp	r7, #101	; 0x65
  70:	656e      	str	r6, [r5, #84]	; 0x54
  72:	2f73      	cmp	r7, #115	; 0x73
  74:	6564      	str	r4, [r4, #84]	; 0x54
  76:	6576      	str	r6, [r6, #84]	; 0x54
  78:	2f6c      	cmp	r7, #108	; 0x6c
  7a:	696d      	ldr	r5, [r5, #20]
  7c:	616c      	str	r4, [r5, #20]
  7e:	622f      	str	r7, [r5, #32]
  80:	6975      	ldr	r5, [r6, #20]
  82:	646c      	str	r4, [r5, #68]	; 0x44
  84:	6e69      	ldr	r1, [r5, #100]	; 0x64
  86:	2f67      	cmp	r7, #103	; 0x67
  88:	7273      	strb	r3, [r6, #9]
  8a:	2f63      	cmp	r7, #99	; 0x63
  8c:	6d63      	ldr	r3, [r4, #84]	; 0x54
  8e:	6973      	ldr	r3, [r6, #20]
  90:	0073      	lsls	r3, r6, #1
  92:	7300      	strb	r0, [r0, #12]
  94:	7379      	strb	r1, [r7, #13]
  96:	6574      	str	r4, [r6, #84]	; 0x54
  98:	5f6d      	ldrsh	r5, [r5, r5]
  9a:	444d      	add	r5, r9
  9c:	3352      	adds	r3, #82	; 0x52
  9e:	4632      	mov	r2, r6
  a0:	5139      	str	r1, [r7, r4]
  a2:	2e78      	cmp	r6, #120	; 0x78
  a4:	0063      	lsls	r3, r4, #1
  a6:	0001      	movs	r1, r0
  a8:	4d00      	ldr	r5, [pc, #0]	; (ac <Heap_Size+0xac>)
  aa:	5244      	strh	r4, [r0, r1]
  ac:	3233      	adds	r2, #51	; 0x33
  ae:	7846      	ldrb	r6, [r0, #1]
  b0:	682e      	ldr	r6, [r5, #0]
  b2:	0200      	lsls	r0, r0, #8
  b4:	0000      	movs	r0, r0
  b6:	7473      	strb	r3, [r6, #17]
  b8:	6964      	ldr	r4, [r4, #20]
  ba:	746e      	strb	r6, [r5, #17]
  bc:	682e      	ldr	r6, [r5, #0]
  be:	0300      	lsls	r0, r0, #12
  c0:	0000      	movs	r0, r0
  c2:	6f63      	ldr	r3, [r4, #116]	; 0x74
  c4:	6572      	str	r2, [r6, #84]	; 0x54
  c6:	635f      	str	r7, [r3, #52]	; 0x34
  c8:	336d      	adds	r3, #109	; 0x6d
  ca:	682e      	ldr	r6, [r5, #0]
  cc:	0300      	lsls	r0, r0, #12
  ce:	0000      	movs	r0, r0
  d0:	0000      	movs	r0, r0
  d2:	0205      	lsls	r5, r0, #8
  d4:	00c0      	lsls	r0, r0, #3
  d6:	0800      	lsrs	r0, r0, #32
  d8:	c303      	stmia	r3!, {r0, r1}
  da:	0100      	lsls	r0, r0, #4
  dc:	0319      	lsls	r1, r3, #12
  de:	2e09      	cmp	r6, #9
  e0:	6c3e      	ldr	r6, [r7, #64]	; 0x40
  e2:	4b5b      	ldr	r3, [pc, #364]	; (250 <Heap_Size+0x250>)
  e4:	a232      	add	r2, pc, #200	; (adr r2, 1b0 <Heap_Size+0x1b0>)
  e6:	243d      	movs	r4, #61	; 0x3d
  e8:	2f75      	cmp	r7, #117	; 0x75
  ea:	4b23      	ldr	r3, [pc, #140]	; (178 <Heap_Size+0x178>)
  ec:	0223      	lsls	r3, r4, #8
  ee:	000d      	movs	r5, r1
  f0:	0101      	lsls	r1, r0, #4
  f2:	0500      	lsls	r0, r0, #20
  f4:	4002      	ands	r2, r0
  f6:	0001      	movs	r1, r0
  f8:	0308      	lsls	r0, r1, #12
  fa:	0183      	lsls	r3, r0, #6
  fc:	2401      	movs	r4, #1
  fe:	3f3f      	subs	r7, #63	; 0x3f
 100:	3131      	adds	r1, #49	; 0x31
 102:	3031      	adds	r0, #49	; 0x31
 104:	0702      	lsls	r2, r0, #28
 106:	0100      	lsls	r0, r0, #4
 108:	a601      	add	r6, pc, #4	; (adr r6, 110 <Heap_Size+0x110>)
 10a:	0000      	movs	r0, r0
 10c:	0200      	lsls	r0, r0, #8
 10e:	5400      	strb	r0, [r0, r0]
 110:	0000      	movs	r0, r0
 112:	0200      	lsls	r0, r0, #8
 114:	fb01 0d0e 	mla	sp, r1, lr, r0
 118:	0100      	lsls	r0, r0, #4
 11a:	0101      	lsls	r1, r0, #4
 11c:	0001      	movs	r1, r0
 11e:	0000      	movs	r0, r0
 120:	0001      	movs	r1, r0
 122:	0100      	lsls	r0, r0, #4
 124:	682f      	ldr	r7, [r5, #0]
 126:	6d6f      	ldr	r7, [r5, #84]	; 0x54
 128:	2f65      	cmp	r7, #101	; 0x65
 12a:	656e      	str	r6, [r5, #84]	; 0x54
 12c:	2f73      	cmp	r7, #115	; 0x73
 12e:	6564      	str	r4, [r4, #84]	; 0x54
 130:	6576      	str	r6, [r6, #84]	; 0x54
 132:	2f6c      	cmp	r7, #108	; 0x6c
 134:	696d      	ldr	r5, [r5, #20]
 136:	616c      	str	r4, [r5, #20]
 138:	622f      	str	r7, [r5, #32]
 13a:	6975      	ldr	r5, [r6, #20]
 13c:	646c      	str	r4, [r5, #68]	; 0x44
 13e:	6e69      	ldr	r1, [r5, #100]	; 0x64
 140:	2f67      	cmp	r7, #103	; 0x67
 142:	7273      	strb	r3, [r6, #9]
 144:	2f63      	cmp	r7, #99	; 0x63
 146:	7473      	strb	r3, [r6, #17]
 148:	7261      	strb	r1, [r4, #9]
 14a:	7574      	strb	r4, [r6, #21]
 14c:	0070      	lsls	r0, r6, #1
 14e:	7300      	strb	r0, [r0, #12]
 150:	6174      	str	r4, [r6, #20]
 152:	7472      	strb	r2, [r6, #17]
 154:	7075      	strb	r5, [r6, #1]
 156:	4d5f      	ldr	r5, [pc, #380]	; (2d4 <Heap_Size+0x2d4>)
 158:	5244      	strh	r4, [r0, r1]
 15a:	3233      	adds	r2, #51	; 0x33
 15c:	3946      	subs	r1, #70	; 0x46
 15e:	7851      	ldrb	r1, [r2, #1]
 160:	532e      	strh	r6, [r5, r4]
 162:	0100      	lsls	r0, r0, #4
 164:	0000      	movs	r0, r0
 166:	0000      	movs	r0, r0
 168:	0205      	lsls	r5, r0, #8
 16a:	016c      	lsls	r4, r5, #5
 16c:	0800      	lsrs	r0, r0, #32
 16e:	8903      	ldrh	r3, [r0, #8]
 170:	0101      	lsls	r1, r0, #4
 172:	2121      	movs	r1, #33	; 0x21
 174:	3122      	adds	r1, #34	; 0x22
 176:	2121      	movs	r1, #33	; 0x21
 178:	0322      	lsls	r2, r4, #12
 17a:	2e17      	cmp	r6, #23
 17c:	0336      	lsls	r6, r6, #12
 17e:	2e56      	cmp	r6, #86	; 0x56
 180:	2f2f      	cmp	r7, #47	; 0x2f
 182:	2f33      	cmp	r7, #51	; 0x33
 184:	032f      	lsls	r7, r5, #12
 186:	2e2e      	cmp	r6, #46	; 0x2e
 188:	2221      	movs	r2, #33	; 0x21
 18a:	2121      	movs	r1, #33	; 0x21
 18c:	2221      	movs	r2, #33	; 0x21
 18e:	0f03      	lsrs	r3, r0, #28
 190:	2120      	movs	r1, #32
 192:	2121      	movs	r1, #33	; 0x21
 194:	2121      	movs	r1, #33	; 0x21
 196:	2121      	movs	r1, #33	; 0x21
 198:	2221      	movs	r2, #33	; 0x21
 19a:	2121      	movs	r1, #33	; 0x21
 19c:	2121      	movs	r1, #33	; 0x21
 19e:	2121      	movs	r1, #33	; 0x21
 1a0:	2121      	movs	r1, #33	; 0x21
 1a2:	2121      	movs	r1, #33	; 0x21
 1a4:	2121      	movs	r1, #33	; 0x21
 1a6:	2121      	movs	r1, #33	; 0x21
 1a8:	2121      	movs	r1, #33	; 0x21
 1aa:	2121      	movs	r1, #33	; 0x21
 1ac:	2121      	movs	r1, #33	; 0x21
 1ae:	0102      	lsls	r2, r0, #4
 1b0:	0100      	lsls	r0, r0, #4
 1b2:	cf01      	ldmia	r7!, {r0}
 1b4:	0000      	movs	r0, r0
 1b6:	0200      	lsls	r0, r0, #8
 1b8:	9400      	str	r4, [sp, #0]
 1ba:	0000      	movs	r0, r0
 1bc:	0200      	lsls	r0, r0, #8
 1be:	fb01 0d0e 	mla	sp, r1, lr, r0
 1c2:	0100      	lsls	r0, r0, #4
 1c4:	0101      	lsls	r1, r0, #4
 1c6:	0001      	movs	r1, r0
 1c8:	0000      	movs	r0, r0
 1ca:	0001      	movs	r1, r0
 1cc:	0100      	lsls	r0, r0, #4
 1ce:	682f      	ldr	r7, [r5, #0]
 1d0:	6d6f      	ldr	r7, [r5, #84]	; 0x54
 1d2:	2f65      	cmp	r7, #101	; 0x65
 1d4:	656e      	str	r6, [r5, #84]	; 0x54
 1d6:	2f73      	cmp	r7, #115	; 0x73
 1d8:	6564      	str	r4, [r4, #84]	; 0x54
 1da:	6576      	str	r6, [r6, #84]	; 0x54
 1dc:	2f6c      	cmp	r7, #108	; 0x6c
 1de:	696d      	ldr	r5, [r5, #20]
 1e0:	616c      	str	r4, [r5, #20]
 1e2:	622f      	str	r7, [r5, #32]
 1e4:	6975      	ldr	r5, [r6, #20]
 1e6:	646c      	str	r4, [r5, #68]	; 0x44
 1e8:	6e69      	ldr	r1, [r5, #100]	; 0x64
 1ea:	2f67      	cmp	r7, #103	; 0x67
 1ec:	7273      	strb	r3, [r6, #9]
 1ee:	2f63      	cmp	r7, #99	; 0x63
 1f0:	6d63      	ldr	r3, [r4, #84]	; 0x54
 1f2:	6973      	ldr	r3, [r6, #20]
 1f4:	0073      	lsls	r3, r6, #1
 1f6:	682f      	ldr	r7, [r5, #0]
 1f8:	6d6f      	ldr	r7, [r5, #84]	; 0x54
 1fa:	2f65      	cmp	r7, #101	; 0x65
 1fc:	656e      	str	r6, [r5, #84]	; 0x54
 1fe:	2f73      	cmp	r7, #115	; 0x73
 200:	6564      	str	r4, [r4, #84]	; 0x54
 202:	6576      	str	r6, [r6, #84]	; 0x54
 204:	2f6c      	cmp	r7, #108	; 0x6c
 206:	696d      	ldr	r5, [r5, #20]
 208:	616c      	str	r4, [r5, #20]
 20a:	622f      	str	r7, [r5, #32]
 20c:	6975      	ldr	r5, [r6, #20]
 20e:	646c      	str	r4, [r5, #68]	; 0x44
 210:	6e69      	ldr	r1, [r5, #100]	; 0x64
 212:	2f67      	cmp	r7, #103	; 0x67
 214:	7273      	strb	r3, [r6, #9]
 216:	2f63      	cmp	r7, #99	; 0x63
 218:	6e69      	ldr	r1, [r5, #100]	; 0x64
 21a:	0063      	lsls	r3, r4, #1
 21c:	6200      	str	r0, [r0, #32]
 21e:	696c      	ldr	r4, [r5, #20]
 220:	6b6e      	ldr	r6, [r5, #52]	; 0x34
 222:	632e      	str	r6, [r5, #48]	; 0x30
 224:	0000      	movs	r0, r0
 226:	0000      	movs	r0, r0
 228:	7473      	strb	r3, [r6, #17]
 22a:	6964      	ldr	r4, [r4, #20]
 22c:	746e      	strb	r6, [r5, #17]
 22e:	682e      	ldr	r6, [r5, #0]
 230:	0100      	lsls	r0, r0, #4
 232:	0000      	movs	r0, r0
 234:	444d      	add	r5, r9
 236:	3352      	adds	r3, #82	; 0x52
 238:	4632      	mov	r2, r6
 23a:	7839      	ldrb	r1, [r7, #0]
 23c:	682e      	ldr	r6, [r5, #0]
 23e:	0200      	lsls	r0, r0, #8
 240:	0000      	movs	r0, r0
 242:	6f63      	ldr	r3, [r4, #116]	; 0x74
 244:	6572      	str	r2, [r6, #84]	; 0x54
 246:	635f      	str	r7, [r3, #52]	; 0x34
 248:	336d      	adds	r3, #109	; 0x6d
 24a:	682e      	ldr	r6, [r5, #0]
 24c:	0100      	lsls	r0, r0, #4
 24e:	0000      	movs	r0, r0
 250:	0000      	movs	r0, r0
 252:	0205      	lsls	r5, r0, #8
 254:	01ec      	lsls	r4, r5, #7
 256:	0800      	lsrs	r0, r0, #32
 258:	0a03      	lsrs	r3, r0, #8
 25a:	1301      	asrs	r1, r0, #12
 25c:	4b4c      	ldr	r3, [pc, #304]	; (390 <Heap_Size+0x390>)
 25e:	3d2f      	subs	r5, #47	; 0x2f
 260:	3d3d      	subs	r5, #61	; 0x3d
 262:	023d      	lsls	r5, r7, #8
 264:	0004      	movs	r4, r0
 266:	0101      	lsls	r1, r0, #4
 268:	0500      	lsls	r0, r0, #20
 26a:	2002      	movs	r0, #2
 26c:	0002      	movs	r2, r0
 26e:	0308      	lsls	r0, r1, #12
 270:	0117      	lsls	r7, r2, #4
 272:	3222      	adds	r2, #34	; 0x22
 274:	1e5a      	subs	r2, r3, #1
 276:	0200      	lsls	r0, r0, #8
 278:	0304      	lsls	r4, r0, #12
 27a:	0075      	lsls	r5, r6, #1
 27c:	0402      	lsls	r2, r0, #16
 27e:	5a03      	ldrh	r3, [r0, r0]
 280:	0257      	lsls	r7, r2, #9
 282:	000a      	movs	r2, r1
 284:	0101      	lsls	r1, r0, #4

Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	000c      	movs	r4, r1
   2:	0000      	movs	r0, r0
   4:	ffff ffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	0001      	movs	r1, r0
   a:	7c02      	ldrb	r2, [r0, #16]
   c:	0c0e      	lsrs	r6, r1, #16
   e:	000d      	movs	r5, r1
  10:	000c      	movs	r4, r1
  12:	0000      	movs	r0, r0
  14:	0000      	movs	r0, r0
  16:	0000      	movs	r0, r0
  18:	00c0      	lsls	r0, r0, #3
  1a:	0800      	lsrs	r0, r0, #32
  1c:	0080      	lsls	r0, r0, #2
  1e:	0000      	movs	r0, r0
  20:	0014      	movs	r4, r2
  22:	0000      	movs	r0, r0
  24:	0000      	movs	r0, r0
  26:	0000      	movs	r0, r0
  28:	0140      	lsls	r0, r0, #5
  2a:	0800      	lsrs	r0, r0, #32
  2c:	002c      	movs	r4, r5
  2e:	0000      	movs	r0, r0
  30:	0e41      	lsrs	r1, r0, #25
  32:	8308      	strh	r0, [r1, #24]
  34:	8e02      	ldrh	r2, [r0, #48]	; 0x30
  36:	0001      	movs	r1, r0
  38:	000c      	movs	r4, r1
  3a:	0000      	movs	r0, r0
  3c:	ffff ffff 			; <UNDEFINED> instruction: 0xffffffff
  40:	0001      	movs	r1, r0
  42:	7c02      	ldrb	r2, [r0, #16]
  44:	0c0e      	lsrs	r6, r1, #16
  46:	000d      	movs	r5, r1
  48:	000c      	movs	r4, r1
  4a:	0000      	movs	r0, r0
  4c:	0038      	movs	r0, r7
  4e:	0000      	movs	r0, r0
  50:	01ec      	lsls	r4, r5, #7
  52:	0800      	lsrs	r0, r0, #32
  54:	0034      	movs	r4, r6
  56:	0000      	movs	r0, r0
  58:	0014      	movs	r4, r2
  5a:	0000      	movs	r0, r0
  5c:	0038      	movs	r0, r7
  5e:	0000      	movs	r0, r0
  60:	0220      	lsls	r0, r4, #8
  62:	0800      	lsrs	r0, r0, #32
  64:	0048      	lsls	r0, r1, #1
  66:	0000      	movs	r0, r0
  68:	0e41      	lsrs	r1, r0, #25
  6a:	8308      	strh	r0, [r1, #24]
  6c:	8e02      	ldrh	r2, [r0, #48]	; 0x30
  6e:	0001      	movs	r1, r0

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	5043      	str	r3, [r0, r1]
   2:	5f55      	ldrsh	r5, [r2, r5]
   4:	4c43      	ldr	r4, [pc, #268]	; (114 <Heap_Size+0x114>)
   6:	434f      	muls	r7, r1
   8:	004b      	lsls	r3, r1, #1
   a:	6c70      	ldr	r0, [r6, #68]	; 0x44
   c:	5f6c      	ldrsh	r4, [r5, r5]
   e:	756d      	strb	r5, [r5, #21]
  10:	006c      	lsls	r4, r5, #1
  12:	682f      	ldr	r7, [r5, #0]
  14:	6d6f      	ldr	r7, [r5, #84]	; 0x54
  16:	2f65      	cmp	r7, #101	; 0x65
  18:	656e      	str	r6, [r5, #84]	; 0x54
  1a:	2f73      	cmp	r7, #115	; 0x73
  1c:	6564      	str	r4, [r4, #84]	; 0x54
  1e:	6576      	str	r6, [r6, #84]	; 0x54
  20:	2f6c      	cmp	r7, #108	; 0x6c
  22:	696d      	ldr	r5, [r5, #20]
  24:	616c      	str	r4, [r5, #20]
  26:	622f      	str	r7, [r5, #32]
  28:	6975      	ldr	r5, [r6, #20]
  2a:	646c      	str	r4, [r5, #68]	; 0x44
  2c:	6e69      	ldr	r1, [r5, #100]	; 0x64
  2e:	2f67      	cmp	r7, #103	; 0x67
  30:	7273      	strb	r3, [r6, #9]
  32:	2f63      	cmp	r7, #99	; 0x63
  34:	7973      	ldrb	r3, [r6, #5]
  36:	7473      	strb	r3, [r6, #17]
  38:	6d65      	ldr	r5, [r4, #84]	; 0x54
  3a:	732f      	strb	r7, [r5, #12]
  3c:	7379      	strb	r1, [r7, #13]
  3e:	6574      	str	r4, [r6, #84]	; 0x54
  40:	5f6d      	ldrsh	r5, [r5, r5]
  42:	444d      	add	r5, r9
  44:	3352      	adds	r3, #82	; 0x52
  46:	4632      	mov	r2, r6
  48:	5139      	str	r1, [r7, r4]
  4a:	2e78      	cmp	r6, #120	; 0x78
  4c:	0063      	lsls	r3, r4, #1
  4e:	4c50      	ldr	r4, [pc, #320]	; (190 <Heap_Size+0x190>)
  50:	5f4c      	ldrsh	r4, [r1, r5]
  52:	4f43      	ldr	r7, [pc, #268]	; (160 <Heap_Size+0x160>)
  54:	544e      	strb	r6, [r1, r1]
  56:	4f52      	ldr	r7, [pc, #328]	; (1a0 <Heap_Size+0x1a0>)
  58:	004c      	lsls	r4, r1, #1
  5a:	6873      	ldr	r3, [r6, #4]
  5c:	726f      	strb	r7, [r5, #9]
  5e:	2074      	movs	r0, #116	; 0x74
  60:	6e75      	ldr	r5, [r6, #100]	; 0x64
  62:	6973      	ldr	r3, [r6, #20]
  64:	6e67      	ldr	r7, [r4, #100]	; 0x64
  66:	6465      	str	r5, [r4, #68]	; 0x44
  68:	6920      	ldr	r0, [r4, #16]
  6a:	746e      	strb	r6, [r5, #17]
  6c:	5400      	strb	r0, [r0, r0]
  6e:	4d49      	ldr	r5, [pc, #292]	; (194 <Heap_Size+0x194>)
  70:	435f      	muls	r7, r3
  72:	4f4c      	ldr	r7, [pc, #304]	; (1a4 <Heap_Size+0x1a4>)
  74:	4b43      	ldr	r3, [pc, #268]	; (184 <Heap_Size+0x184>)
  76:	5300      	strh	r0, [r0, r4]
  78:	5053      	str	r3, [r2, r1]
  7a:	435f      	muls	r7, r3
  7c:	4f4c      	ldr	r7, [pc, #304]	; (1b0 <Heap_Size+0x1b0>)
  7e:	4b43      	ldr	r3, [pc, #268]	; (18c <Heap_Size+0x18c>)
  80:	4300      	orrs	r0, r0
  82:	4e41      	ldr	r6, [pc, #260]	; (188 <Heap_Size+0x188>)
  84:	435f      	muls	r7, r3
  86:	4f4c      	ldr	r7, [pc, #304]	; (1b8 <Heap_Size+0x1b8>)
  88:	4b43      	ldr	r3, [pc, #268]	; (198 <Heap_Size+0x198>)
  8a:	4800      	ldr	r0, [pc, #0]	; (8c <Heap_Size+0x8c>)
  8c:	5f53      	ldrsh	r3, [r2, r5]
  8e:	4f43      	ldr	r7, [pc, #268]	; (19c <Heap_Size+0x19c>)
  90:	544e      	strb	r6, [r1, r1]
  92:	4f52      	ldr	r7, [pc, #328]	; (1dc <Heap_Size+0x1dc>)
  94:	004c      	lsls	r4, r1, #1
  96:	6e75      	ldr	r5, [r6, #100]	; 0x64
  98:	6973      	ldr	r3, [r6, #20]
  9a:	6e67      	ldr	r7, [r4, #100]	; 0x64
  9c:	6465      	str	r5, [r4, #68]	; 0x44
  9e:	6320      	str	r0, [r4, #48]	; 0x30
  a0:	6168      	str	r0, [r5, #20]
  a2:	0072      	lsls	r2, r6, #1
  a4:	7063      	strb	r3, [r4, #1]
  a6:	5f75      	ldrsh	r5, [r6, r5]
  a8:	3163      	adds	r1, #99	; 0x63
  aa:	665f      	str	r7, [r3, #100]	; 0x64
  ac:	6572      	str	r2, [r6, #84]	; 0x54
  ae:	0071      	lsls	r1, r6, #1
  b0:	4e47      	ldr	r6, [pc, #284]	; (1d0 <Heap_Size+0x1d0>)
  b2:	2055      	movs	r0, #85	; 0x55
  b4:	2043      	movs	r0, #67	; 0x43
  b6:	2e34      	cmp	r6, #52	; 0x34
  b8:	2e39      	cmp	r6, #57	; 0x39
  ba:	2033      	movs	r0, #51	; 0x33
  bc:	3032      	adds	r0, #50	; 0x32
  be:	3431      	adds	r4, #49	; 0x31
  c0:	3131      	adds	r1, #49	; 0x31
  c2:	3931      	subs	r1, #49	; 0x31
  c4:	2820      	cmp	r0, #32
  c6:	6572      	str	r2, [r6, #84]	; 0x54
  c8:	656c      	str	r4, [r5, #84]	; 0x54
  ca:	7361      	strb	r1, [r4, #13]
  cc:	2965      	cmp	r1, #101	; 0x65
  ce:	5b20      	ldrh	r0, [r4, r4]
  d0:	5241      	strh	r1, [r0, r1]
  d2:	2f4d      	cmp	r7, #77	; 0x4d
  d4:	6d65      	ldr	r5, [r4, #84]	; 0x54
  d6:	6562      	str	r2, [r4, #84]	; 0x54
  d8:	6464      	str	r4, [r4, #68]	; 0x44
  da:	6465      	str	r5, [r4, #68]	; 0x44
  dc:	342d      	adds	r4, #45	; 0x2d
  de:	395f      	subs	r1, #95	; 0x5f
  e0:	622d      	str	r5, [r5, #32]
  e2:	6172      	str	r2, [r6, #20]
  e4:	636e      	str	r6, [r5, #52]	; 0x34
  e6:	2068      	movs	r0, #104	; 0x68
  e8:	6572      	str	r2, [r6, #84]	; 0x54
  ea:	6976      	ldr	r6, [r6, #20]
  ec:	6973      	ldr	r3, [r6, #20]
  ee:	6e6f      	ldr	r7, [r5, #100]	; 0x64
  f0:	3220      	adds	r2, #32
  f2:	3831      	subs	r0, #49	; 0x31
  f4:	3732      	adds	r7, #50	; 0x32
  f6:	5d38      	ldrb	r0, [r7, r4]
  f8:	2d20      	cmp	r5, #32
  fa:	636d      	str	r5, [r5, #52]	; 0x34
  fc:	7570      	strb	r0, [r6, #21]
  fe:	633d      	str	r5, [r7, #48]	; 0x30
 100:	726f      	strb	r7, [r5, #9]
 102:	6574      	str	r4, [r6, #84]	; 0x54
 104:	2d78      	cmp	r5, #120	; 0x78
 106:	336d      	adds	r3, #109	; 0x6d
 108:	2d20      	cmp	r5, #32
 10a:	746d      	strb	r5, [r5, #17]
 10c:	7568      	strb	r0, [r5, #21]
 10e:	626d      	str	r5, [r5, #36]	; 0x24
 110:	2d20      	cmp	r5, #32
 112:	666d      	str	r5, [r5, #100]	; 0x64
 114:	6f6c      	ldr	r4, [r5, #116]	; 0x74
 116:	7461      	strb	r1, [r4, #17]
 118:	612d      	str	r5, [r5, #16]
 11a:	6962      	ldr	r2, [r4, #20]
 11c:	733d      	strb	r5, [r7, #12]
 11e:	666f      	str	r7, [r5, #100]	; 0x64
 120:	2074      	movs	r0, #116	; 0x74
 122:	672d      	str	r5, [r5, #112]	; 0x70
 124:	2d20      	cmp	r5, #32
 126:	314f      	adds	r1, #79	; 0x4f
 128:	2d20      	cmp	r5, #32
 12a:	7366      	strb	r6, [r4, #13]
 12c:	6769      	str	r1, [r5, #116]	; 0x74
 12e:	656e      	str	r6, [r5, #84]	; 0x54
 130:	2d64      	cmp	r5, #100	; 0x64
 132:	6863      	ldr	r3, [r4, #4]
 134:	7261      	strb	r1, [r4, #9]
 136:	2d20      	cmp	r5, #32
 138:	6e66      	ldr	r6, [r4, #100]	; 0x64
 13a:	2d6f      	cmp	r5, #111	; 0x6f
 13c:	7865      	ldrb	r5, [r4, #1]
 13e:	6563      	str	r3, [r4, #84]	; 0x54
 140:	7470      	strb	r0, [r6, #17]
 142:	6f69      	ldr	r1, [r5, #116]	; 0x74
 144:	736e      	strb	r6, [r5, #13]
 146:	2d20      	cmp	r5, #32
 148:	6e66      	ldr	r6, [r4, #100]	; 0x64
 14a:	2d6f      	cmp	r5, #111	; 0x6f
 14c:	6e75      	ldr	r5, [r6, #100]	; 0x64
 14e:	6977      	ldr	r7, [r6, #20]
 150:	646e      	str	r6, [r5, #68]	; 0x44
 152:	742d      	strb	r5, [r5, #16]
 154:	6261      	str	r1, [r4, #36]	; 0x24
 156:	656c      	str	r4, [r5, #84]	; 0x54
 158:	2073      	movs	r0, #115	; 0x73
 15a:	662d      	str	r5, [r5, #96]	; 0x60
 15c:	6f6e      	ldr	r6, [r5, #116]	; 0x74
 15e:	612d      	str	r5, [r5, #16]
 160:	7973      	ldrb	r3, [r6, #5]
 162:	636e      	str	r6, [r5, #52]	; 0x34
 164:	7268      	strb	r0, [r5, #9]
 166:	6e6f      	ldr	r7, [r5, #100]	; 0x64
 168:	756f      	strb	r7, [r5, #21]
 16a:	2d73      	cmp	r5, #115	; 0x73
 16c:	6e75      	ldr	r5, [r6, #100]	; 0x64
 16e:	6977      	ldr	r7, [r6, #20]
 170:	646e      	str	r6, [r5, #68]	; 0x44
 172:	742d      	strb	r5, [r5, #16]
 174:	6261      	str	r1, [r4, #36]	; 0x24
 176:	656c      	str	r4, [r5, #84]	; 0x54
 178:	2073      	movs	r0, #115	; 0x73
 17a:	662d      	str	r5, [r5, #96]	; 0x60
 17c:	7566      	strb	r6, [r4, #21]
 17e:	636e      	str	r6, [r5, #52]	; 0x34
 180:	6974      	ldr	r4, [r6, #20]
 182:	6e6f      	ldr	r7, [r5, #100]	; 0x64
 184:	732d      	strb	r5, [r5, #12]
 186:	6365      	str	r5, [r4, #52]	; 0x34
 188:	6974      	ldr	r4, [r6, #20]
 18a:	6e6f      	ldr	r7, [r5, #100]	; 0x64
 18c:	2073      	movs	r0, #115	; 0x73
 18e:	662d      	str	r5, [r5, #96]	; 0x60
 190:	6164      	str	r4, [r4, #20]
 192:	6174      	str	r4, [r6, #20]
 194:	732d      	strb	r5, [r5, #12]
 196:	6365      	str	r5, [r4, #52]	; 0x34
 198:	6974      	ldr	r4, [r6, #20]
 19a:	6e6f      	ldr	r7, [r5, #100]	; 0x64
 19c:	0073      	lsls	r3, r6, #1
 19e:	5452      	strb	r2, [r2, r1]
 1a0:	5f43      	ldrsh	r3, [r0, r5]
 1a2:	4c43      	ldr	r4, [pc, #268]	; (2b0 <Heap_Size+0x2b0>)
 1a4:	434f      	muls	r7, r1
 1a6:	004b      	lsls	r3, r1, #1
 1a8:	4155      	adcs	r5, r2
 1aa:	5452      	strb	r2, [r2, r1]
 1ac:	435f      	muls	r7, r3
 1ae:	4f4c      	ldr	r7, [pc, #304]	; (2e0 <Heap_Size+0x2e0>)
 1b0:	4b43      	ldr	r3, [pc, #268]	; (2c0 <Heap_Size+0x2c0>)
 1b2:	4900      	ldr	r1, [pc, #0]	; (1b4 <Heap_Size+0x1b4>)
 1b4:	4d54      	ldr	r5, [pc, #336]	; (308 <Heap_Size+0x308>)
 1b6:	525f      	strh	r7, [r3, r1]
 1b8:	4278      	negs	r0, r7
 1ba:	6675      	str	r5, [r6, #100]	; 0x64
 1bc:	6566      	str	r6, [r4, #84]	; 0x54
 1be:	0072      	lsls	r2, r6, #1
 1c0:	7953      	ldrb	r3, [r2, #5]
 1c2:	7473      	strb	r3, [r6, #17]
 1c4:	6d65      	ldr	r5, [r4, #84]	; 0x54
 1c6:	6e49      	ldr	r1, [r1, #100]	; 0x64
 1c8:	7469      	strb	r1, [r5, #17]
 1ca:	7300      	strb	r0, [r0, #12]
 1cc:	7a69      	ldrb	r1, [r5, #9]
 1ce:	7465      	strb	r5, [r4, #17]
 1d0:	7079      	strb	r1, [r7, #1]
 1d2:	0065      	lsls	r5, r4, #1
 1d4:	7063      	strb	r3, [r4, #1]
 1d6:	5f75      	ldrsh	r5, [r6, r5]
 1d8:	3263      	adds	r2, #99	; 0x63
 1da:	665f      	str	r7, [r3, #100]	; 0x64
 1dc:	6572      	str	r2, [r6, #84]	; 0x54
 1de:	0071      	lsls	r1, r6, #1
 1e0:	7953      	ldrb	r3, [r2, #5]
 1e2:	7473      	strb	r3, [r6, #17]
 1e4:	6d65      	ldr	r5, [r4, #84]	; 0x54
 1e6:	6f43      	ldr	r3, [r0, #116]	; 0x74
 1e8:	6572      	str	r2, [r6, #84]	; 0x54
 1ea:	6c43      	ldr	r3, [r0, #68]	; 0x44
 1ec:	636f      	str	r7, [r5, #52]	; 0x34
 1ee:	006b      	lsls	r3, r5, #1
 1f0:	7953      	ldrb	r3, [r2, #5]
 1f2:	7473      	strb	r3, [r6, #17]
 1f4:	6d65      	ldr	r5, [r4, #84]	; 0x54
 1f6:	6f43      	ldr	r3, [r0, #116]	; 0x74
 1f8:	6572      	str	r2, [r6, #84]	; 0x54
 1fa:	6c43      	ldr	r3, [r0, #68]	; 0x44
 1fc:	636f      	str	r7, [r5, #52]	; 0x34
 1fe:	556b      	strb	r3, [r5, r5]
 200:	6470      	str	r0, [r6, #68]	; 0x44
 202:	7461      	strb	r1, [r4, #17]
 204:	0065      	lsls	r5, r4, #1
 206:	5355      	strh	r5, [r2, r5]
 208:	5f42      	ldrsh	r2, [r0, r5]
 20a:	4c43      	ldr	r4, [pc, #268]	; (318 <Heap_Size+0x318>)
 20c:	434f      	muls	r7, r1
 20e:	004b      	lsls	r3, r1, #1
 210:	4550      	cmp	r0, sl
 212:	5f52      	ldrsh	r2, [r2, r5]
 214:	4c43      	ldr	r4, [pc, #268]	; (324 <Heap_Size+0x324>)
 216:	434f      	muls	r7, r1
 218:	004b      	lsls	r3, r1, #1
 21a:	6873      	ldr	r3, [r6, #4]
 21c:	726f      	strb	r7, [r5, #9]
 21e:	2074      	movs	r0, #116	; 0x74
 220:	6e69      	ldr	r1, [r5, #100]	; 0x64
 222:	0074      	lsls	r4, r6, #1
 224:	4c43      	ldr	r4, [pc, #268]	; (334 <Heap_Size+0x334>)
 226:	434f      	muls	r7, r1
 228:	5f4b      	ldrsh	r3, [r1, r5]
 22a:	5453      	strb	r3, [r2, r1]
 22c:	5441      	strb	r1, [r0, r1]
 22e:	5355      	strh	r5, [r2, r5]
 230:	7500      	strb	r0, [r0, #20]
 232:	6e69      	ldr	r1, [r5, #100]	; 0x64
 234:	3374      	adds	r3, #116	; 0x74
 236:	5f32      	ldrsh	r2, [r6, r4]
 238:	0074      	lsls	r4, r6, #1
 23a:	4441      	add	r1, r8
 23c:	5f43      	ldrsh	r3, [r0, r5]
 23e:	434d      	muls	r5, r1
 240:	5f4f      	ldrsh	r7, [r1, r5]
 242:	4c43      	ldr	r4, [pc, #268]	; (350 <Heap_Size+0x350>)
 244:	434f      	muls	r7, r1
 246:	004b      	lsls	r3, r1, #1
 248:	7063      	strb	r3, [r4, #1]
 24a:	5f75      	ldrsh	r5, [r6, r5]
 24c:	3363      	adds	r3, #99	; 0x63
 24e:	665f      	str	r7, [r3, #100]	; 0x64
 250:	6572      	str	r2, [r6, #84]	; 0x54
 252:	0071      	lsls	r1, r6, #1
 254:	4e47      	ldr	r6, [pc, #284]	; (374 <Heap_Size+0x374>)
 256:	2055      	movs	r0, #85	; 0x55
 258:	2b43      	cmp	r3, #67	; 0x43
 25a:	202b      	movs	r0, #43	; 0x2b
 25c:	2e34      	cmp	r6, #52	; 0x34
 25e:	2e39      	cmp	r6, #57	; 0x39
 260:	2033      	movs	r0, #51	; 0x33
 262:	3032      	adds	r0, #50	; 0x32
 264:	3431      	adds	r4, #49	; 0x31
 266:	3131      	adds	r1, #49	; 0x31
 268:	3931      	subs	r1, #49	; 0x31
 26a:	2820      	cmp	r0, #32
 26c:	6572      	str	r2, [r6, #84]	; 0x54
 26e:	656c      	str	r4, [r5, #84]	; 0x54
 270:	7361      	strb	r1, [r4, #13]
 272:	2965      	cmp	r1, #101	; 0x65
 274:	5b20      	ldrh	r0, [r4, r4]
 276:	5241      	strh	r1, [r0, r1]
 278:	2f4d      	cmp	r7, #77	; 0x4d
 27a:	6d65      	ldr	r5, [r4, #84]	; 0x54
 27c:	6562      	str	r2, [r4, #84]	; 0x54
 27e:	6464      	str	r4, [r4, #68]	; 0x44
 280:	6465      	str	r5, [r4, #68]	; 0x44
 282:	342d      	adds	r4, #45	; 0x2d
 284:	395f      	subs	r1, #95	; 0x5f
 286:	622d      	str	r5, [r5, #32]
 288:	6172      	str	r2, [r6, #20]
 28a:	636e      	str	r6, [r5, #52]	; 0x34
 28c:	2068      	movs	r0, #104	; 0x68
 28e:	6572      	str	r2, [r6, #84]	; 0x54
 290:	6976      	ldr	r6, [r6, #20]
 292:	6973      	ldr	r3, [r6, #20]
 294:	6e6f      	ldr	r7, [r5, #100]	; 0x64
 296:	3220      	adds	r2, #32
 298:	3831      	subs	r0, #49	; 0x31
 29a:	3732      	adds	r7, #50	; 0x32
 29c:	5d38      	ldrb	r0, [r7, r4]
 29e:	2d20      	cmp	r5, #32
 2a0:	636d      	str	r5, [r5, #52]	; 0x34
 2a2:	7570      	strb	r0, [r6, #21]
 2a4:	633d      	str	r5, [r7, #48]	; 0x30
 2a6:	726f      	strb	r7, [r5, #9]
 2a8:	6574      	str	r4, [r6, #84]	; 0x54
 2aa:	2d78      	cmp	r5, #120	; 0x78
 2ac:	336d      	adds	r3, #109	; 0x6d
 2ae:	2d20      	cmp	r5, #32
 2b0:	746d      	strb	r5, [r5, #17]
 2b2:	7568      	strb	r0, [r5, #21]
 2b4:	626d      	str	r5, [r5, #36]	; 0x24
 2b6:	2d20      	cmp	r5, #32
 2b8:	666d      	str	r5, [r5, #100]	; 0x64
 2ba:	6f6c      	ldr	r4, [r5, #116]	; 0x74
 2bc:	7461      	strb	r1, [r4, #17]
 2be:	612d      	str	r5, [r5, #16]
 2c0:	6962      	ldr	r2, [r4, #20]
 2c2:	733d      	strb	r5, [r7, #12]
 2c4:	666f      	str	r7, [r5, #100]	; 0x64
 2c6:	2074      	movs	r0, #116	; 0x74
 2c8:	672d      	str	r5, [r5, #112]	; 0x70
 2ca:	2d20      	cmp	r5, #32
 2cc:	314f      	adds	r1, #79	; 0x4f
 2ce:	2d20      	cmp	r5, #32
 2d0:	7473      	strb	r3, [r6, #17]
 2d2:	3d64      	subs	r5, #100	; 0x64
 2d4:	2b63      	cmp	r3, #99	; 0x63
 2d6:	392b      	subs	r1, #43	; 0x2b
 2d8:	2038      	movs	r0, #56	; 0x38
 2da:	662d      	str	r5, [r5, #96]	; 0x60
 2dc:	6973      	ldr	r3, [r6, #20]
 2de:	6e67      	ldr	r7, [r4, #100]	; 0x64
 2e0:	6465      	str	r5, [r4, #68]	; 0x44
 2e2:	632d      	str	r5, [r5, #48]	; 0x30
 2e4:	6168      	str	r0, [r5, #20]
 2e6:	2072      	movs	r0, #114	; 0x72
 2e8:	662d      	str	r5, [r5, #96]	; 0x60
 2ea:	6f6e      	ldr	r6, [r5, #116]	; 0x74
 2ec:	652d      	str	r5, [r5, #80]	; 0x50
 2ee:	6378      	str	r0, [r7, #52]	; 0x34
 2f0:	7065      	strb	r5, [r4, #1]
 2f2:	6974      	ldr	r4, [r6, #20]
 2f4:	6e6f      	ldr	r7, [r5, #100]	; 0x64
 2f6:	2073      	movs	r0, #115	; 0x73
 2f8:	662d      	str	r5, [r5, #96]	; 0x60
 2fa:	6f6e      	ldr	r6, [r5, #116]	; 0x74
 2fc:	752d      	strb	r5, [r5, #20]
 2fe:	776e      	strb	r6, [r5, #29]
 300:	6e69      	ldr	r1, [r5, #100]	; 0x64
 302:	2d64      	cmp	r5, #100	; 0x64
 304:	6174      	str	r4, [r6, #20]
 306:	6c62      	ldr	r2, [r4, #68]	; 0x44
 308:	7365      	strb	r5, [r4, #13]
 30a:	2d20      	cmp	r5, #32
 30c:	6e66      	ldr	r6, [r4, #100]	; 0x64
 30e:	2d6f      	cmp	r5, #111	; 0x6f
 310:	7361      	strb	r1, [r4, #13]
 312:	6e79      	ldr	r1, [r7, #100]	; 0x64
 314:	6863      	ldr	r3, [r4, #4]
 316:	6f72      	ldr	r2, [r6, #116]	; 0x74
 318:	6f6e      	ldr	r6, [r5, #116]	; 0x74
 31a:	7375      	strb	r5, [r6, #13]
 31c:	752d      	strb	r5, [r5, #20]
 31e:	776e      	strb	r6, [r5, #29]
 320:	6e69      	ldr	r1, [r5, #100]	; 0x64
 322:	2d64      	cmp	r5, #100	; 0x64
 324:	6174      	str	r4, [r6, #20]
 326:	6c62      	ldr	r2, [r4, #68]	; 0x44
 328:	7365      	strb	r5, [r4, #13]
 32a:	2d20      	cmp	r5, #32
 32c:	6666      	str	r6, [r4, #100]	; 0x64
 32e:	6e75      	ldr	r5, [r6, #100]	; 0x64
 330:	7463      	strb	r3, [r4, #17]
 332:	6f69      	ldr	r1, [r5, #116]	; 0x74
 334:	2d6e      	cmp	r5, #110	; 0x6e
 336:	6573      	str	r3, [r6, #84]	; 0x54
 338:	7463      	strb	r3, [r4, #17]
 33a:	6f69      	ldr	r1, [r5, #116]	; 0x74
 33c:	736e      	strb	r6, [r5, #13]
 33e:	2d20      	cmp	r5, #32
 340:	6466      	str	r6, [r4, #68]	; 0x44
 342:	7461      	strb	r1, [r4, #17]
 344:	2d61      	cmp	r5, #97	; 0x61
 346:	6573      	str	r3, [r6, #84]	; 0x54
 348:	7463      	strb	r3, [r4, #17]
 34a:	6f69      	ldr	r1, [r5, #116]	; 0x74
 34c:	736e      	strb	r6, [r5, #13]
 34e:	3100      	adds	r1, #0
 350:	4d39      	ldr	r5, [pc, #228]	; (438 <Heap_Size+0x438>)
 352:	5244      	strh	r4, [r0, r1]
 354:	525f      	strh	r7, [r3, r1]
 356:	5453      	strb	r3, [r2, r1]
 358:	435f      	muls	r7, r3
 35a:	4b4c      	ldr	r3, [pc, #304]	; (48c <Heap_Size+0x48c>)
 35c:	545f      	strb	r7, [r3, r1]
 35e:	7079      	strb	r1, [r7, #1]
 360:	4465      	add	r5, ip
 362:	6665      	str	r5, [r4, #100]	; 0x64
 364:	5f00      	ldrsh	r0, [r0, r4]
 366:	395a      	subs	r1, #90	; 0x5a
 368:	5047      	str	r7, [r0, r1]
 36a:	4f49      	ldr	r7, [pc, #292]	; (490 <Heap_Size+0x490>)
 36c:	495f      	ldr	r1, [pc, #380]	; (4ec <Heap_Size+0x4ec>)
 36e:	696e      	ldr	r6, [r5, #20]
 370:	7674      	strb	r4, [r6, #25]
 372:	4500      	cmp	r0, r0
 374:	414e      	adcs	r6, r1
 376:	4c42      	ldr	r4, [pc, #264]	; (480 <Heap_Size+0x480>)
 378:	0045      	lsls	r5, r0, #1
 37a:	5553      	strb	r3, [r2, r5]
 37c:	4343      	muls	r3, r0
 37e:	5345      	strh	r5, [r0, r5]
 380:	0053      	lsls	r3, r2, #1
 382:	4552      	cmp	r2, sl
 384:	4553      	cmp	r3, sl
 386:	0054      	lsls	r4, r2, #1
 388:	5852      	ldr	r2, [r2, r1]
 38a:	5854      	ldr	r4, [r2, r1]
 38c:	3100      	adds	r1, #0
 38e:	4d36      	ldr	r5, [pc, #216]	; (468 <Heap_Size+0x468>)
 390:	5244      	strh	r4, [r0, r1]
 392:	505f      	str	r7, [r3, r1]
 394:	524f      	strh	r7, [r1, r1]
 396:	5f54      	ldrsh	r4, [r2, r5]
 398:	7954      	ldrb	r4, [r2, #5]
 39a:	6570      	str	r0, [r6, #84]	; 0x54
 39c:	6544      	str	r4, [r0, #84]	; 0x54
 39e:	0066      	lsls	r6, r4, #1
 3a0:	5546      	strb	r6, [r0, r5]
 3a2:	434e      	muls	r6, r1
 3a4:	6d00      	ldr	r0, [r0, #80]	; 0x50
 3a6:	6961      	ldr	r1, [r4, #20]
 3a8:	006e      	lsls	r6, r5, #1
 3aa:	3131      	adds	r1, #49	; 0x31
 3ac:	7245      	strb	r5, [r0, #9]
 3ae:	6f72      	ldr	r2, [r6, #116]	; 0x74
 3b0:	5372      	strh	r2, [r6, r5]
 3b2:	6174      	str	r4, [r6, #20]
 3b4:	7574      	strb	r4, [r6, #21]
 3b6:	0073      	lsls	r3, r6, #1
 3b8:	5550      	strb	r0, [r2, r5]
 3ba:	4c4c      	ldr	r4, [pc, #304]	; (4ec <Heap_Size+0x4ec>)
 3bc:	2f00      	cmp	r7, #0
 3be:	6f68      	ldr	r0, [r5, #116]	; 0x74
 3c0:	656d      	str	r5, [r5, #84]	; 0x54
 3c2:	6e2f      	ldr	r7, [r5, #96]	; 0x60
 3c4:	7365      	strb	r5, [r4, #13]
 3c6:	642f      	str	r7, [r5, #64]	; 0x40
 3c8:	7665      	strb	r5, [r4, #25]
 3ca:	6c65      	ldr	r5, [r4, #68]	; 0x44
 3cc:	6d2f      	ldr	r7, [r5, #80]	; 0x50
 3ce:	6c69      	ldr	r1, [r5, #68]	; 0x44
 3d0:	2f61      	cmp	r7, #97	; 0x61
 3d2:	7562      	strb	r2, [r4, #21]
 3d4:	6c69      	ldr	r1, [r5, #68]	; 0x44
 3d6:	6964      	ldr	r4, [r4, #20]
 3d8:	676e      	str	r6, [r5, #116]	; 0x74
 3da:	3100      	adds	r1, #0
 3dc:	4635      	mov	r5, r6
 3de:	6e75      	ldr	r5, [r6, #100]	; 0x64
 3e0:	7463      	strb	r3, [r4, #17]
 3e2:	6f69      	ldr	r1, [r5, #116]	; 0x74
 3e4:	616e      	str	r6, [r5, #20]
 3e6:	536c      	strh	r4, [r5, r5]
 3e8:	6174      	str	r4, [r6, #20]
 3ea:	6574      	str	r4, [r6, #84]	; 0x54
 3ec:	4100      	asrs	r0, r0
 3ee:	414e      	adcs	r6, r1
 3f0:	4f4c      	ldr	r7, [pc, #304]	; (524 <Heap_Size+0x524>)
 3f2:	0047      	lsls	r7, r0, #1
 3f4:	4647      	mov	r7, r8
 3f6:	4e45      	ldr	r6, [pc, #276]	; (50c <Heap_Size+0x50c>)
 3f8:	4700      	bx	r0
 3fa:	4950      	ldr	r1, [pc, #320]	; (53c <Heap_Size+0x53c>)
 3fc:	5f4f      	ldrsh	r7, [r1, r5]
 3fe:	6e49      	ldr	r1, [r1, #100]	; 0x64
 400:	7469      	strb	r1, [r5, #17]
 402:	7500      	strb	r0, [r0, #20]
 404:	6e69      	ldr	r1, [r5, #100]	; 0x64
 406:	3174      	adds	r1, #116	; 0x74
 408:	5f36      	ldrsh	r6, [r6, r4]
 40a:	0074      	lsls	r4, r6, #1
 40c:	5245      	strh	r5, [r0, r1]
 40e:	4f52      	ldr	r7, [pc, #328]	; (558 <Heap_Size+0x558>)
 410:	0052      	lsls	r2, r2, #1
 412:	3031      	adds	r0, #49	; 0x31
 414:	6c46      	ldr	r6, [r0, #68]	; 0x44
 416:	6761      	str	r1, [r4, #116]	; 0x74
 418:	7453      	strb	r3, [r2, #17]
 41a:	7461      	strb	r1, [r4, #17]
 41c:	7375      	strb	r5, [r6, #13]
 41e:	4400      	add	r0, r0
 420:	5349      	strh	r1, [r1, r5]
 422:	4241      	negs	r1, r0
 424:	454c      	cmp	r4, r9
 426:	6200      	str	r0, [r0, #32]
 428:	696c      	ldr	r4, [r5, #20]
 42a:	6b6e      	ldr	r6, [r5, #52]	; 0x34
 42c:	632e      	str	r6, [r5, #48]	; 0x30
	...

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
   0:	00c4      	lsls	r4, r0, #3
   2:	0800      	lsrs	r0, r0, #32
   4:	00d6      	lsls	r6, r2, #3
   6:	0800      	lsrs	r0, r0, #32
   8:	0006      	movs	r6, r0
   a:	000c      	movs	r4, r1
   c:	7a12      	ldrb	r2, [r2, #8]
   e:	9f00      	ldr	r7, [sp, #0]
  10:	00d6      	lsls	r6, r2, #3
  12:	0800      	lsrs	r0, r0, #32
  14:	00ec      	lsls	r4, r5, #3
  16:	0800      	lsrs	r0, r0, #32
  18:	0001      	movs	r1, r0
  1a:	0053      	lsls	r3, r2, #1
  1c:	0000      	movs	r0, r0
  1e:	0000      	movs	r0, r0
  20:	0000      	movs	r0, r0
  22:	d600      	bvs.n	26 <Heap_Size+0x26>
  24:	0000      	movs	r0, r0
  26:	0408      	lsls	r0, r1, #16
  28:	0001      	movs	r1, r0
  2a:	0108      	lsls	r0, r1, #4
  2c:	5300      	strh	r0, [r0, r4]
  2e:	0108      	lsls	r0, r1, #4
  30:	0800      	lsrs	r0, r0, #32
  32:	0116      	lsls	r6, r2, #4
  34:	0800      	lsrs	r0, r0, #32
  36:	0001      	movs	r1, r0
  38:	1c53      	adds	r3, r2, #1
  3a:	0001      	movs	r1, r0
  3c:	2208      	movs	r2, #8
  3e:	0001      	movs	r1, r0
  40:	0108      	lsls	r0, r1, #4
  42:	5300      	strh	r0, [r0, r4]
  44:	0126      	lsls	r6, r4, #4
  46:	0800      	lsrs	r0, r0, #32
  48:	012c      	lsls	r4, r5, #4
  4a:	0800      	lsrs	r0, r0, #32
  4c:	0001      	movs	r1, r0
  4e:	0053      	lsls	r3, r2, #1
  50:	0000      	movs	r0, r0
  52:	0000      	movs	r0, r0
  54:	0000      	movs	r0, r0
  56:	0c00      	lsrs	r0, r0, #16
  58:	0001      	movs	r1, r0
  5a:	1008      	asrs	r0, r1, #32
  5c:	0001      	movs	r1, r0
  5e:	1208      	asrs	r0, r1, #8
  60:	7300      	strb	r0, [r0, #12]
  62:	f700 7221 			; <UNDEFINED> instruction: 0xf7007221
  66:	3400      	adds	r4, #0
  68:	3f25      	subs	r7, #37	; 0x25
  6a:	231a      	movs	r3, #26
  6c:	f701 1b21 			; <UNDEFINED> instruction: 0xf7011b21
  70:	00f7      	lsls	r7, r6, #3
  72:	009f      	lsls	r7, r3, #2
  74:	0000      	movs	r0, r0
  76:	0000      	movs	r0, r0
  78:	0000      	movs	r0, r0
  7a:	e400      	b.n	fffff87e <__StackTop+0xdfff787e>
  7c:	0000      	movs	r0, r0
  7e:	e808 0000 			; <UNDEFINED> instruction: 0xe8080000
  82:	0908      	lsrs	r0, r1, #4
  84:	7200      	strb	r0, [r0, #8]
  86:	3800      	subs	r0, #0
  88:	3f25      	subs	r7, #37	; 0x25
  8a:	231a      	movs	r3, #26
  8c:	9f01      	ldr	r7, [sp, #4]
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	00c0      	lsls	r0, r0, #3
   2:	0800      	lsrs	r0, r0, #32
   4:	0140      	lsls	r0, r0, #5
   6:	0800      	lsrs	r0, r0, #32
   8:	0140      	lsls	r0, r0, #5
   a:	0800      	lsrs	r0, r0, #32
   c:	016c      	lsls	r4, r5, #5
   e:	0800      	lsrs	r0, r0, #32
	...
  18:	01ec      	lsls	r4, r5, #7
  1a:	0800      	lsrs	r0, r0, #32
  1c:	0220      	lsls	r0, r4, #8
  1e:	0800      	lsrs	r0, r0, #32
  20:	0220      	lsls	r0, r4, #8
  22:	0800      	lsrs	r0, r0, #32
  24:	0268      	lsls	r0, r5, #9
  26:	0800      	lsrs	r0, r0, #32
	...
