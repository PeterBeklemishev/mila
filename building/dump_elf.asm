
second.elf:     file format elf32-littlearm


Disassembly of section .text:

08000000 <__isr_vector>:
 8000000:	8000      	strh	r0, [r0, #0]
 8000002:	2000      	movs	r0, #0
 8000004:	016d      	lsls	r5, r5, #5
 8000006:	0800      	lsrs	r0, r0, #32
 8000008:	01ab      	lsls	r3, r5, #6
 800000a:	0800      	lsrs	r0, r0, #32
 800000c:	01ad      	lsls	r5, r5, #6
 800000e:	0800      	lsrs	r0, r0, #32
 8000010:	01af      	lsls	r7, r5, #6
 8000012:	0800      	lsrs	r0, r0, #32
 8000014:	01b1      	lsls	r1, r6, #6
 8000016:	0800      	lsrs	r0, r0, #32
 8000018:	01b3      	lsls	r3, r6, #6
 800001a:	0800      	lsrs	r0, r0, #32
	...
 800002c:	01b5      	lsls	r5, r6, #6
 800002e:	0800      	lsrs	r0, r0, #32
 8000030:	01b7      	lsls	r7, r6, #6
 8000032:	0800      	lsrs	r0, r0, #32
 8000034:	0000      	movs	r0, r0
 8000036:	0000      	movs	r0, r0
 8000038:	01b9      	lsls	r1, r7, #6
 800003a:	0800      	lsrs	r0, r0, #32
 800003c:	01bb      	lsls	r3, r7, #6
 800003e:	0800      	lsrs	r0, r0, #32
 8000040:	01bd      	lsls	r5, r7, #6
 8000042:	0800      	lsrs	r0, r0, #32
 8000044:	01bf      	lsls	r7, r7, #6
 8000046:	0800      	lsrs	r0, r0, #32
 8000048:	01c1      	lsls	r1, r0, #7
 800004a:	0800      	lsrs	r0, r0, #32
	...
 8000054:	01c3      	lsls	r3, r0, #7
 8000056:	0800      	lsrs	r0, r0, #32
 8000058:	01c5      	lsls	r5, r0, #7
 800005a:	0800      	lsrs	r0, r0, #32
 800005c:	01c7      	lsls	r7, r0, #7
 800005e:	0800      	lsrs	r0, r0, #32
 8000060:	01c9      	lsls	r1, r1, #7
 8000062:	0800      	lsrs	r0, r0, #32
 8000064:	0000      	movs	r0, r0
 8000066:	0000      	movs	r0, r0
 8000068:	01cb      	lsls	r3, r1, #7
 800006a:	0800      	lsrs	r0, r0, #32
 800006c:	01cd      	lsls	r5, r1, #7
 800006e:	0800      	lsrs	r0, r0, #32
 8000070:	01cf      	lsls	r7, r1, #7
 8000072:	0800      	lsrs	r0, r0, #32
 8000074:	0000      	movs	r0, r0
 8000076:	0000      	movs	r0, r0
 8000078:	01d1      	lsls	r1, r2, #7
 800007a:	0800      	lsrs	r0, r0, #32
 800007c:	01d3      	lsls	r3, r2, #7
 800007e:	0800      	lsrs	r0, r0, #32
 8000080:	01d5      	lsls	r5, r2, #7
 8000082:	0800      	lsrs	r0, r0, #32
 8000084:	01d7      	lsls	r7, r2, #7
 8000086:	0800      	lsrs	r0, r0, #32
 8000088:	0000      	movs	r0, r0
 800008a:	0000      	movs	r0, r0
 800008c:	01d9      	lsls	r1, r3, #7
 800008e:	0800      	lsrs	r0, r0, #32
 8000090:	01db      	lsls	r3, r3, #7
 8000092:	0800      	lsrs	r0, r0, #32
	...
 80000ac:	01dd      	lsls	r5, r3, #7
 80000ae:	0800      	lsrs	r0, r0, #32
 80000b0:	01df      	lsls	r7, r3, #7
 80000b2:	0800      	lsrs	r0, r0, #32
 80000b4:	01e1      	lsls	r1, r4, #7
 80000b6:	0800      	lsrs	r0, r0, #32
 80000b8:	01e3      	lsls	r3, r4, #7
 80000ba:	0800      	lsrs	r0, r0, #32
 80000bc:	01e5      	lsls	r5, r4, #7
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
 800016c:	4905      	ldr	r1, [pc, #20]	; (8000184 <Reset_Handler+0x18>)
    ldr    r2, =__data_start__
 800016e:	4a06      	ldr	r2, [pc, #24]	; (8000188 <Reset_Handler+0x1c>)
    ldr    r3, =__data_end__
 8000170:	4b06      	ldr	r3, [pc, #24]	; (800018c <Reset_Handler+0x20>)

    bl     copy_to_ram
 8000172:	f000 f813 	bl	800019c <copy_to_ram>

/* Copy RAM functions from FLASH to RAM */
    ldr    r1, =__exec_mem__
 8000176:	4906      	ldr	r1, [pc, #24]	; (8000190 <Reset_Handler+0x24>)
    ldr    r2, =__exec_mem_start__
 8000178:	4a06      	ldr	r2, [pc, #24]	; (8000194 <Reset_Handler+0x28>)
    ldr    r3, =__exec_mem_end__
 800017a:	4b07      	ldr	r3, [pc, #28]	; (8000198 <Reset_Handler+0x2c>)

    bl     copy_to_ram
 800017c:	f000 f80e 	bl	800019c <copy_to_ram>
    strlt   r0, [r1], #4
    blt    .LC0
#endif /* __STARTUP_CLEAR_BSS */

#ifndef __NO_SYSTEM_INIT
    bl    SystemInit
 8000180:	f7ff ffde 	bl	8000140 <SystemInit>
 *      linker script.
 *      __etext: End of code section, i.e., begin of data sections to copy from.
 *      __data_start__/__data_end__: RAM address range that data should be
 *      copied to. Both must be aligned to 4 bytes boundary.  */

    ldr    r1, =__etext
 8000184:	01e8      	lsls	r0, r5, #7
 8000186:	0800      	lsrs	r0, r0, #32
    ldr    r2, =__data_start__
 8000188:	0000      	movs	r0, r0
 800018a:	2000      	movs	r0, #0
    ldr    r3, =__data_end__
 800018c:	0004      	movs	r4, r0
 800018e:	2000      	movs	r0, #0

    bl     copy_to_ram

/* Copy RAM functions from FLASH to RAM */
    ldr    r1, =__exec_mem__
 8000190:	01ec      	lsls	r4, r5, #7
 8000192:	0800      	lsrs	r0, r0, #32
    ldr    r2, =__exec_mem_start__
 8000194:	0004      	movs	r4, r0
 8000196:	2000      	movs	r0, #0
    ldr    r3, =__exec_mem_end__
 8000198:	0004      	movs	r4, r0
 800019a:	2000      	movs	r0, #0

0800019c <copy_to_ram>:
*/
    .thumb
    .thumb_func
    .align 2
copy_to_ram:
    subs    r3, r2
 800019c:	1a9b      	subs	r3, r3, r2
    ble    1f
 800019e:	dd03      	ble.n	80001a8 <copy_to_ram+0xc>
0:
    subs    r3, #4
 80001a0:	3b04      	subs	r3, #4
    ldr    r0, [r1, r3]
 80001a2:	58c8      	ldr	r0, [r1, r3]
    str    r0, [r2, r3]
 80001a4:	50d0      	str	r0, [r2, r3]
    bgt    0b
 80001a6:	dcfb      	bgt.n	80001a0 <copy_to_ram+0x4>
1:
    bx lr
 80001a8:	4770      	bx	lr

080001aa <NMI_Handler>:
\handler_name :
    b    .
    .size    \handler_name, . - \handler_name
    .endm
    
    def_default_handler    NMI_Handler
 80001aa:	e7fe      	b.n	80001aa <NMI_Handler>

080001ac <HardFault_Handler>:
    def_default_handler    HardFault_Handler
 80001ac:	e7fe      	b.n	80001ac <HardFault_Handler>

080001ae <MemManage_Handler>:
    def_default_handler    MemManage_Handler
 80001ae:	e7fe      	b.n	80001ae <MemManage_Handler>

080001b0 <BusFault_Handler>:
    def_default_handler    BusFault_Handler
 80001b0:	e7fe      	b.n	80001b0 <BusFault_Handler>

080001b2 <UsageFault_Handler>:
    def_default_handler    UsageFault_Handler
 80001b2:	e7fe      	b.n	80001b2 <UsageFault_Handler>

080001b4 <SVC_Handler>:
    def_default_handler    SVC_Handler
 80001b4:	e7fe      	b.n	80001b4 <SVC_Handler>

080001b6 <DebugMon_Handler>:
    def_default_handler    DebugMon_Handler
 80001b6:	e7fe      	b.n	80001b6 <DebugMon_Handler>

080001b8 <PendSV_Handler>:
    def_default_handler    PendSV_Handler
 80001b8:	e7fe      	b.n	80001b8 <PendSV_Handler>

080001ba <SysTick_Handler>:
    def_default_handler    SysTick_Handler
 80001ba:	e7fe      	b.n	80001ba <SysTick_Handler>

080001bc <CAN1_IRQHandler>:
    
    def_default_handler    CAN1_IRQHandler
 80001bc:	e7fe      	b.n	80001bc <CAN1_IRQHandler>

080001be <CAN2_IRQHandler>:
    def_default_handler    CAN2_IRQHandler
 80001be:	e7fe      	b.n	80001be <CAN2_IRQHandler>

080001c0 <USB_IRQHandler>:
    def_default_handler    USB_IRQHandler
 80001c0:	e7fe      	b.n	80001c0 <USB_IRQHandler>

080001c2 <DMA_IRQHandler>:
    def_default_handler    DMA_IRQHandler
 80001c2:	e7fe      	b.n	80001c2 <DMA_IRQHandler>

080001c4 <UART1_IRQHandler>:
    def_default_handler    UART1_IRQHandler
 80001c4:	e7fe      	b.n	80001c4 <UART1_IRQHandler>

080001c6 <UART2_IRQHandler>:
    def_default_handler    UART2_IRQHandler
 80001c6:	e7fe      	b.n	80001c6 <UART2_IRQHandler>

080001c8 <SSP1_IRQHandler>:
    def_default_handler    SSP1_IRQHandler
 80001c8:	e7fe      	b.n	80001c8 <SSP1_IRQHandler>

080001ca <I2C_IRQHandler>:
    def_default_handler    I2C_IRQHandler
 80001ca:	e7fe      	b.n	80001ca <I2C_IRQHandler>

080001cc <POWER_IRQHandler>:
    def_default_handler    POWER_IRQHandler
 80001cc:	e7fe      	b.n	80001cc <POWER_IRQHandler>

080001ce <WWDG_IRQHandler>:
    def_default_handler    WWDG_IRQHandler
 80001ce:	e7fe      	b.n	80001ce <WWDG_IRQHandler>

080001d0 <Timer1_IRQHandler>:
    def_default_handler    Timer1_IRQHandler
 80001d0:	e7fe      	b.n	80001d0 <Timer1_IRQHandler>

080001d2 <Timer2_IRQHandler>:
    def_default_handler    Timer2_IRQHandler
 80001d2:	e7fe      	b.n	80001d2 <Timer2_IRQHandler>

080001d4 <Timer3_IRQHandler>:
    def_default_handler    Timer3_IRQHandler
 80001d4:	e7fe      	b.n	80001d4 <Timer3_IRQHandler>

080001d6 <ADC_IRQHandler>:
    def_default_handler    ADC_IRQHandler
 80001d6:	e7fe      	b.n	80001d6 <ADC_IRQHandler>

080001d8 <COMPARATOR_IRQHandler>:
    def_default_handler    COMPARATOR_IRQHandler
 80001d8:	e7fe      	b.n	80001d8 <COMPARATOR_IRQHandler>

080001da <SSP2_IRQHandler>:
    def_default_handler    SSP2_IRQHandler
 80001da:	e7fe      	b.n	80001da <SSP2_IRQHandler>

080001dc <BACKUP_IRQHandler>:
    def_default_handler    BACKUP_IRQHandler
 80001dc:	e7fe      	b.n	80001dc <BACKUP_IRQHandler>

080001de <EXT_INT1_IRQHandler>:
    def_default_handler    EXT_INT1_IRQHandler
 80001de:	e7fe      	b.n	80001de <EXT_INT1_IRQHandler>

080001e0 <EXT_INT2_IRQHandler>:
    def_default_handler    EXT_INT2_IRQHandler
 80001e0:	e7fe      	b.n	80001e0 <EXT_INT2_IRQHandler>

080001e2 <EXT_INT3_IRQHandler>:
    def_default_handler    EXT_INT3_IRQHandler
 80001e2:	e7fe      	b.n	80001e2 <EXT_INT3_IRQHandler>

080001e4 <EXT_INT4_IRQHandler>:
    def_default_handler    EXT_INT4_IRQHandler
 80001e4:	e7fe      	b.n	80001e4 <EXT_INT4_IRQHandler>
 80001e6:	bf00      	nop

Disassembly of section .data:

20000000 <SystemCoreClock>:
20000000:	1200      	asrs	r0, r0, #8
20000002:	007a      	lsls	r2, r7, #1

Disassembly of section .stack_dummy:

20000008 <.stack_dummy>:
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
  3c:	007a      	lsls	r2, r7, #1
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	01a4      	lsls	r4, r4, #6
   2:	0000      	movs	r0, r0
   4:	0004      	movs	r4, r0
   6:	0000      	movs	r0, r0
   8:	0000      	movs	r0, r0
   a:	0104      	lsls	r4, r0, #4
   c:	00c4      	lsls	r4, r0, #3
   e:	0000      	movs	r0, r0
  10:	1201      	asrs	r1, r0, #8
	...
  1e:	0000      	movs	r0, r0
  20:	0200      	lsls	r0, r0, #8
  22:	0704      	lsls	r4, r0, #28
  24:	0060      	lsls	r0, r4, #1
  26:	0000      	movs	r0, r0
  28:	0102      	lsls	r2, r0, #4
  2a:	ac06      	add	r4, sp, #24
  2c:	0000      	movs	r0, r0
  2e:	0200      	lsls	r0, r0, #8
  30:	0502      	lsls	r2, r0, #20
  32:	022e      	lsls	r6, r5, #8
  34:	0000      	movs	r0, r0
  36:	0403      	lsls	r3, r0, #16
  38:	6905      	ldr	r5, [r0, #16]
  3a:	746e      	strb	r6, [r5, #17]
  3c:	0200      	lsls	r0, r0, #8
  3e:	0801      	lsrs	r1, r0, #32
  40:	00aa      	lsls	r2, r5, #2
  42:	0000      	movs	r0, r0
  44:	0202      	lsls	r2, r0, #8
  46:	5a07      	ldrh	r7, [r0, r0]
  48:	0000      	movs	r0, r0
  4a:	0400      	lsls	r0, r0, #16
  4c:	0245      	lsls	r5, r0, #9
  4e:	0000      	movs	r0, r0
  50:	1203      	asrs	r3, r0, #8
  52:	0021      	movs	r1, r4
  54:	0000      	movs	r0, r0
  56:	0402      	lsls	r2, r0, #16
  58:	df07      	svc	7
  5a:	0001      	movs	r1, r0
  5c:	0500      	lsls	r0, r0, #20
  5e:	004b      	lsls	r3, r1, #1
  60:	0000      	movs	r0, r0
  62:	3006      	adds	r0, #6
  64:	2c02      	cmp	r4, #2
  66:	0803      	lsrs	r3, r0, #32
  68:	0001      	movs	r1, r0
  6a:	0700      	lsls	r0, r0, #28
  6c:	0238      	lsls	r0, r7, #8
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
  86:	009f      	lsls	r7, r3, #2
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
  a0:	021a      	lsls	r2, r3, #8
  a2:	0000      	movs	r0, r0
  a4:	3202      	adds	r2, #2
  a6:	5d03      	ldrb	r3, [r0, r4]
  a8:	0000      	movs	r0, r0
  aa:	1000      	asrs	r0, r0, #32
  ac:	4e07      	ldr	r6, [pc, #28]	; (cc <Heap_Size+0xcc>)
  ae:	0002      	movs	r2, r0
  b0:	0200      	lsls	r0, r0, #8
  b2:	0333      	lsls	r3, r6, #12
  b4:	005d      	lsls	r5, r3, #1
  b6:	0000      	movs	r0, r0
  b8:	0714      	lsls	r4, r2, #28
  ba:	01b2      	lsls	r2, r6, #6
  bc:	0000      	movs	r0, r0
  be:	3402      	adds	r4, #2
  c0:	5d03      	ldrb	r3, [r0, r4]
  c2:	0000      	movs	r0, r0
  c4:	1800      	adds	r0, r0, r0
  c6:	2407      	movs	r4, #7
  c8:	0002      	movs	r2, r0
  ca:	0200      	lsls	r0, r0, #8
  cc:	0335      	lsls	r5, r6, #12
  ce:	005d      	lsls	r5, r3, #1
  d0:	0000      	movs	r0, r0
  d2:	071c      	lsls	r4, r3, #28
  d4:	0095      	lsls	r5, r2, #2
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
  ee:	01bc      	lsls	r4, r7, #6
  f0:	0000      	movs	r0, r0
  f2:	3802      	subs	r0, #2
  f4:	5d03      	ldrb	r3, [r0, r4]
  f6:	0000      	movs	r0, r0
  f8:	2800      	cmp	r0, #0
  fa:	8b07      	ldrh	r7, [r0, #24]
  fc:	0000      	movs	r0, r0
  fe:	0200      	lsls	r0, r0, #8
 100:	0339      	lsls	r1, r7, #12
 102:	005d      	lsls	r5, r3, #1
 104:	0000      	movs	r0, r0
 106:	002c      	movs	r4, r5
 108:	7708      	strb	r0, [r1, #28]
 10a:	0000      	movs	r0, r0
 10c:	0200      	lsls	r0, r0, #8
 10e:	033a      	lsls	r2, r7, #12
 110:	0062      	lsls	r2, r4, #1
 112:	0000      	movs	r0, r0
 114:	0409      	lsls	r1, r1, #16
 116:	0002      	movs	r2, r0
 118:	0100      	lsls	r0, r0, #4
 11a:	c043      	stmia	r0!, {r0, r1, r6}
 11c:	0000      	movs	r0, r0
 11e:	8008      	strh	r0, [r1, #0]
 120:	0000      	movs	r0, r0
 122:	0100      	lsls	r0, r0, #4
 124:	669c      	str	r4, [r3, #104]	; 0x68
 126:	0001      	movs	r1, r0
 128:	0a00      	lsrs	r0, r0, #8
 12a:	00b8      	lsls	r0, r7, #2
 12c:	0000      	movs	r0, r0
 12e:	4501      	cmp	r1, r0
 130:	004b      	lsls	r3, r1, #1
 132:	0000      	movs	r0, r0
 134:	0000      	movs	r0, r0
 136:	0000      	movs	r0, r0
 138:	e80a 0001 			; <UNDEFINED> instruction: 0xe80a0001
 13c:	0100      	lsls	r0, r0, #4
 13e:	4b45      	ldr	r3, [pc, #276]	; (254 <Heap_Size+0x254>)
 140:	0000      	movs	r0, r0
 142:	2300      	movs	r3, #0
 144:	0000      	movs	r0, r0
 146:	0a00      	lsrs	r0, r0, #8
 148:	025c      	lsls	r4, r3, #9
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
 166:	d409      	bmi.n	17c <Heap_Size+0x17c>
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
 186:	01c7      	lsls	r7, r0, #7
 188:	0000      	movs	r0, r0
 18a:	e404      	b.n	fffff996 <__StackTop+0xdfff7996>
 18c:	9106      	str	r1, [sp, #24]
 18e:	0001      	movs	r1, r0
 190:	0500      	lsls	r0, r0, #20
 192:	0036      	movs	r6, r6
 194:	0000      	movs	r0, r0
 196:	f40d 0001 	and.w	r0, sp, #8454144	; 0x810000
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
 1bc:	01e6      	lsls	r6, r4, #7
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
 108:	a501      	add	r5, pc, #4	; (adr r5, 110 <Heap_Size+0x110>)
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
 17c:	5e03      	ldrsh	r3, [r0, r0]
 17e:	2f2e      	cmp	r7, #46	; 0x2e
 180:	332f      	adds	r3, #47	; 0x2f
 182:	2f2f      	cmp	r7, #47	; 0x2f
 184:	2d03      	cmp	r5, #3
 186:	212e      	movs	r1, #46	; 0x2e
 188:	2122      	movs	r1, #34	; 0x22
 18a:	2121      	movs	r1, #33	; 0x21
 18c:	0322      	lsls	r2, r4, #12
 18e:	200f      	movs	r0, #15
 190:	2121      	movs	r1, #33	; 0x21
 192:	2121      	movs	r1, #33	; 0x21
 194:	2121      	movs	r1, #33	; 0x21
 196:	2121      	movs	r1, #33	; 0x21
 198:	2122      	movs	r1, #34	; 0x22
 19a:	2121      	movs	r1, #33	; 0x21
 19c:	2121      	movs	r1, #33	; 0x21
 19e:	2121      	movs	r1, #33	; 0x21
 1a0:	2121      	movs	r1, #33	; 0x21
 1a2:	2121      	movs	r1, #33	; 0x21
 1a4:	2121      	movs	r1, #33	; 0x21
 1a6:	2121      	movs	r1, #33	; 0x21
 1a8:	2121      	movs	r1, #33	; 0x21
 1aa:	2121      	movs	r1, #33	; 0x21
 1ac:	0221      	lsls	r1, r4, #8
 1ae:	0001      	movs	r1, r0
 1b0:	0101      	lsls	r1, r0, #4

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
  76:	4d00      	ldr	r5, [pc, #0]	; (78 <Heap_Size+0x78>)
  78:	5244      	strh	r4, [r0, r1]
  7a:	525f      	strh	r7, [r3, r1]
  7c:	5453      	strb	r3, [r2, r1]
  7e:	435f      	muls	r7, r3
  80:	4b4c      	ldr	r3, [pc, #304]	; (1b4 <Heap_Size+0x1b4>)
  82:	545f      	strb	r7, [r3, r1]
  84:	7079      	strb	r1, [r7, #1]
  86:	4465      	add	r5, ip
  88:	6665      	str	r5, [r4, #100]	; 0x64
  8a:	5300      	strh	r0, [r0, r4]
  8c:	5053      	str	r3, [r2, r1]
  8e:	435f      	muls	r7, r3
  90:	4f4c      	ldr	r7, [pc, #304]	; (1c4 <Heap_Size+0x1c4>)
  92:	4b43      	ldr	r3, [pc, #268]	; (1a0 <Heap_Size+0x1a0>)
  94:	4300      	orrs	r0, r0
  96:	4e41      	ldr	r6, [pc, #260]	; (19c <Heap_Size+0x19c>)
  98:	435f      	muls	r7, r3
  9a:	4f4c      	ldr	r7, [pc, #304]	; (1cc <Heap_Size+0x1cc>)
  9c:	4b43      	ldr	r3, [pc, #268]	; (1ac <Heap_Size+0x1ac>)
  9e:	4800      	ldr	r0, [pc, #0]	; (a0 <Heap_Size+0xa0>)
  a0:	5f53      	ldrsh	r3, [r2, r5]
  a2:	4f43      	ldr	r7, [pc, #268]	; (1b0 <Heap_Size+0x1b0>)
  a4:	544e      	strb	r6, [r1, r1]
  a6:	4f52      	ldr	r7, [pc, #328]	; (1f0 <Heap_Size+0x1f0>)
  a8:	004c      	lsls	r4, r1, #1
  aa:	6e75      	ldr	r5, [r6, #100]	; 0x64
  ac:	6973      	ldr	r3, [r6, #20]
  ae:	6e67      	ldr	r7, [r4, #100]	; 0x64
  b0:	6465      	str	r5, [r4, #68]	; 0x44
  b2:	6320      	str	r0, [r4, #48]	; 0x30
  b4:	6168      	str	r0, [r5, #20]
  b6:	0072      	lsls	r2, r6, #1
  b8:	7063      	strb	r3, [r4, #1]
  ba:	5f75      	ldrsh	r5, [r6, r5]
  bc:	3163      	adds	r1, #99	; 0x63
  be:	665f      	str	r7, [r3, #100]	; 0x64
  c0:	6572      	str	r2, [r6, #84]	; 0x54
  c2:	0071      	lsls	r1, r6, #1
  c4:	4e47      	ldr	r6, [pc, #284]	; (1e4 <Heap_Size+0x1e4>)
  c6:	2055      	movs	r0, #85	; 0x55
  c8:	2043      	movs	r0, #67	; 0x43
  ca:	2e34      	cmp	r6, #52	; 0x34
  cc:	2e39      	cmp	r6, #57	; 0x39
  ce:	2033      	movs	r0, #51	; 0x33
  d0:	3032      	adds	r0, #50	; 0x32
  d2:	3431      	adds	r4, #49	; 0x31
  d4:	3131      	adds	r1, #49	; 0x31
  d6:	3931      	subs	r1, #49	; 0x31
  d8:	2820      	cmp	r0, #32
  da:	6572      	str	r2, [r6, #84]	; 0x54
  dc:	656c      	str	r4, [r5, #84]	; 0x54
  de:	7361      	strb	r1, [r4, #13]
  e0:	2965      	cmp	r1, #101	; 0x65
  e2:	5b20      	ldrh	r0, [r4, r4]
  e4:	5241      	strh	r1, [r0, r1]
  e6:	2f4d      	cmp	r7, #77	; 0x4d
  e8:	6d65      	ldr	r5, [r4, #84]	; 0x54
  ea:	6562      	str	r2, [r4, #84]	; 0x54
  ec:	6464      	str	r4, [r4, #68]	; 0x44
  ee:	6465      	str	r5, [r4, #68]	; 0x44
  f0:	342d      	adds	r4, #45	; 0x2d
  f2:	395f      	subs	r1, #95	; 0x5f
  f4:	622d      	str	r5, [r5, #32]
  f6:	6172      	str	r2, [r6, #20]
  f8:	636e      	str	r6, [r5, #52]	; 0x34
  fa:	2068      	movs	r0, #104	; 0x68
  fc:	6572      	str	r2, [r6, #84]	; 0x54
  fe:	6976      	ldr	r6, [r6, #20]
 100:	6973      	ldr	r3, [r6, #20]
 102:	6e6f      	ldr	r7, [r5, #100]	; 0x64
 104:	3220      	adds	r2, #32
 106:	3831      	subs	r0, #49	; 0x31
 108:	3732      	adds	r7, #50	; 0x32
 10a:	5d38      	ldrb	r0, [r7, r4]
 10c:	2d20      	cmp	r5, #32
 10e:	636d      	str	r5, [r5, #52]	; 0x34
 110:	7570      	strb	r0, [r6, #21]
 112:	633d      	str	r5, [r7, #48]	; 0x30
 114:	726f      	strb	r7, [r5, #9]
 116:	6574      	str	r4, [r6, #84]	; 0x54
 118:	2d78      	cmp	r5, #120	; 0x78
 11a:	336d      	adds	r3, #109	; 0x6d
 11c:	2d20      	cmp	r5, #32
 11e:	746d      	strb	r5, [r5, #17]
 120:	7568      	strb	r0, [r5, #21]
 122:	626d      	str	r5, [r5, #36]	; 0x24
 124:	2d20      	cmp	r5, #32
 126:	666d      	str	r5, [r5, #100]	; 0x64
 128:	6f6c      	ldr	r4, [r5, #116]	; 0x74
 12a:	7461      	strb	r1, [r4, #17]
 12c:	612d      	str	r5, [r5, #16]
 12e:	6962      	ldr	r2, [r4, #20]
 130:	733d      	strb	r5, [r7, #12]
 132:	666f      	str	r7, [r5, #100]	; 0x64
 134:	2074      	movs	r0, #116	; 0x74
 136:	672d      	str	r5, [r5, #112]	; 0x70
 138:	2d20      	cmp	r5, #32
 13a:	314f      	adds	r1, #79	; 0x4f
 13c:	2d20      	cmp	r5, #32
 13e:	7366      	strb	r6, [r4, #13]
 140:	6769      	str	r1, [r5, #116]	; 0x74
 142:	656e      	str	r6, [r5, #84]	; 0x54
 144:	2d64      	cmp	r5, #100	; 0x64
 146:	6863      	ldr	r3, [r4, #4]
 148:	7261      	strb	r1, [r4, #9]
 14a:	2d20      	cmp	r5, #32
 14c:	6e66      	ldr	r6, [r4, #100]	; 0x64
 14e:	2d6f      	cmp	r5, #111	; 0x6f
 150:	7865      	ldrb	r5, [r4, #1]
 152:	6563      	str	r3, [r4, #84]	; 0x54
 154:	7470      	strb	r0, [r6, #17]
 156:	6f69      	ldr	r1, [r5, #116]	; 0x74
 158:	736e      	strb	r6, [r5, #13]
 15a:	2d20      	cmp	r5, #32
 15c:	6e66      	ldr	r6, [r4, #100]	; 0x64
 15e:	2d6f      	cmp	r5, #111	; 0x6f
 160:	6e75      	ldr	r5, [r6, #100]	; 0x64
 162:	6977      	ldr	r7, [r6, #20]
 164:	646e      	str	r6, [r5, #68]	; 0x44
 166:	742d      	strb	r5, [r5, #16]
 168:	6261      	str	r1, [r4, #36]	; 0x24
 16a:	656c      	str	r4, [r5, #84]	; 0x54
 16c:	2073      	movs	r0, #115	; 0x73
 16e:	662d      	str	r5, [r5, #96]	; 0x60
 170:	6f6e      	ldr	r6, [r5, #116]	; 0x74
 172:	612d      	str	r5, [r5, #16]
 174:	7973      	ldrb	r3, [r6, #5]
 176:	636e      	str	r6, [r5, #52]	; 0x34
 178:	7268      	strb	r0, [r5, #9]
 17a:	6e6f      	ldr	r7, [r5, #100]	; 0x64
 17c:	756f      	strb	r7, [r5, #21]
 17e:	2d73      	cmp	r5, #115	; 0x73
 180:	6e75      	ldr	r5, [r6, #100]	; 0x64
 182:	6977      	ldr	r7, [r6, #20]
 184:	646e      	str	r6, [r5, #68]	; 0x44
 186:	742d      	strb	r5, [r5, #16]
 188:	6261      	str	r1, [r4, #36]	; 0x24
 18a:	656c      	str	r4, [r5, #84]	; 0x54
 18c:	2073      	movs	r0, #115	; 0x73
 18e:	662d      	str	r5, [r5, #96]	; 0x60
 190:	7566      	strb	r6, [r4, #21]
 192:	636e      	str	r6, [r5, #52]	; 0x34
 194:	6974      	ldr	r4, [r6, #20]
 196:	6e6f      	ldr	r7, [r5, #100]	; 0x64
 198:	732d      	strb	r5, [r5, #12]
 19a:	6365      	str	r5, [r4, #52]	; 0x34
 19c:	6974      	ldr	r4, [r6, #20]
 19e:	6e6f      	ldr	r7, [r5, #100]	; 0x64
 1a0:	2073      	movs	r0, #115	; 0x73
 1a2:	662d      	str	r5, [r5, #96]	; 0x60
 1a4:	6164      	str	r4, [r4, #20]
 1a6:	6174      	str	r4, [r6, #20]
 1a8:	732d      	strb	r5, [r5, #12]
 1aa:	6365      	str	r5, [r4, #52]	; 0x34
 1ac:	6974      	ldr	r4, [r6, #20]
 1ae:	6e6f      	ldr	r7, [r5, #100]	; 0x64
 1b0:	0073      	lsls	r3, r6, #1
 1b2:	5452      	strb	r2, [r2, r1]
 1b4:	5f43      	ldrsh	r3, [r0, r5]
 1b6:	4c43      	ldr	r4, [pc, #268]	; (2c4 <Heap_Size+0x2c4>)
 1b8:	434f      	muls	r7, r1
 1ba:	004b      	lsls	r3, r1, #1
 1bc:	4155      	adcs	r5, r2
 1be:	5452      	strb	r2, [r2, r1]
 1c0:	435f      	muls	r7, r3
 1c2:	4f4c      	ldr	r7, [pc, #304]	; (2f4 <Heap_Size+0x2f4>)
 1c4:	4b43      	ldr	r3, [pc, #268]	; (2d4 <Heap_Size+0x2d4>)
 1c6:	4900      	ldr	r1, [pc, #0]	; (1c8 <Heap_Size+0x1c8>)
 1c8:	4d54      	ldr	r5, [pc, #336]	; (31c <Heap_Size+0x31c>)
 1ca:	525f      	strh	r7, [r3, r1]
 1cc:	4278      	negs	r0, r7
 1ce:	6675      	str	r5, [r6, #100]	; 0x64
 1d0:	6566      	str	r6, [r4, #84]	; 0x54
 1d2:	0072      	lsls	r2, r6, #1
 1d4:	7953      	ldrb	r3, [r2, #5]
 1d6:	7473      	strb	r3, [r6, #17]
 1d8:	6d65      	ldr	r5, [r4, #84]	; 0x54
 1da:	6e49      	ldr	r1, [r1, #100]	; 0x64
 1dc:	7469      	strb	r1, [r5, #17]
 1de:	7300      	strb	r0, [r0, #12]
 1e0:	7a69      	ldrb	r1, [r5, #9]
 1e2:	7465      	strb	r5, [r4, #17]
 1e4:	7079      	strb	r1, [r7, #1]
 1e6:	0065      	lsls	r5, r4, #1
 1e8:	7063      	strb	r3, [r4, #1]
 1ea:	5f75      	ldrsh	r5, [r6, r5]
 1ec:	3263      	adds	r2, #99	; 0x63
 1ee:	665f      	str	r7, [r3, #100]	; 0x64
 1f0:	6572      	str	r2, [r6, #84]	; 0x54
 1f2:	0071      	lsls	r1, r6, #1
 1f4:	7953      	ldrb	r3, [r2, #5]
 1f6:	7473      	strb	r3, [r6, #17]
 1f8:	6d65      	ldr	r5, [r4, #84]	; 0x54
 1fa:	6f43      	ldr	r3, [r0, #116]	; 0x74
 1fc:	6572      	str	r2, [r6, #84]	; 0x54
 1fe:	6c43      	ldr	r3, [r0, #68]	; 0x44
 200:	636f      	str	r7, [r5, #52]	; 0x34
 202:	006b      	lsls	r3, r5, #1
 204:	7953      	ldrb	r3, [r2, #5]
 206:	7473      	strb	r3, [r6, #17]
 208:	6d65      	ldr	r5, [r4, #84]	; 0x54
 20a:	6f43      	ldr	r3, [r0, #116]	; 0x74
 20c:	6572      	str	r2, [r6, #84]	; 0x54
 20e:	6c43      	ldr	r3, [r0, #68]	; 0x44
 210:	636f      	str	r7, [r5, #52]	; 0x34
 212:	556b      	strb	r3, [r5, r5]
 214:	6470      	str	r0, [r6, #68]	; 0x44
 216:	7461      	strb	r1, [r4, #17]
 218:	0065      	lsls	r5, r4, #1
 21a:	5355      	strh	r5, [r2, r5]
 21c:	5f42      	ldrsh	r2, [r0, r5]
 21e:	4c43      	ldr	r4, [pc, #268]	; (32c <Heap_Size+0x32c>)
 220:	434f      	muls	r7, r1
 222:	004b      	lsls	r3, r1, #1
 224:	4550      	cmp	r0, sl
 226:	5f52      	ldrsh	r2, [r2, r5]
 228:	4c43      	ldr	r4, [pc, #268]	; (338 <Heap_Size+0x338>)
 22a:	434f      	muls	r7, r1
 22c:	004b      	lsls	r3, r1, #1
 22e:	6873      	ldr	r3, [r6, #4]
 230:	726f      	strb	r7, [r5, #9]
 232:	2074      	movs	r0, #116	; 0x74
 234:	6e69      	ldr	r1, [r5, #100]	; 0x64
 236:	0074      	lsls	r4, r6, #1
 238:	4c43      	ldr	r4, [pc, #268]	; (348 <Heap_Size+0x348>)
 23a:	434f      	muls	r7, r1
 23c:	5f4b      	ldrsh	r3, [r1, r5]
 23e:	5453      	strb	r3, [r2, r1]
 240:	5441      	strb	r1, [r0, r1]
 242:	5355      	strh	r5, [r2, r5]
 244:	7500      	strb	r0, [r0, #20]
 246:	6e69      	ldr	r1, [r5, #100]	; 0x64
 248:	3374      	adds	r3, #116	; 0x74
 24a:	5f32      	ldrsh	r2, [r6, r4]
 24c:	0074      	lsls	r4, r6, #1
 24e:	4441      	add	r1, r8
 250:	5f43      	ldrsh	r3, [r0, r5]
 252:	434d      	muls	r5, r1
 254:	5f4f      	ldrsh	r7, [r1, r5]
 256:	4c43      	ldr	r4, [pc, #268]	; (364 <Heap_Size+0x364>)
 258:	434f      	muls	r7, r1
 25a:	004b      	lsls	r3, r1, #1
 25c:	7063      	strb	r3, [r4, #1]
 25e:	5f75      	ldrsh	r5, [r6, r5]
 260:	3363      	adds	r3, #99	; 0x63
 262:	665f      	str	r7, [r3, #100]	; 0x64
 264:	6572      	str	r2, [r6, #84]	; 0x54
 266:	0071      	lsls	r1, r6, #1

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
