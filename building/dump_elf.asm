
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
 80000c4:	68da      	ldr	r2, [r3, #12]
 80000c6:	f002 0201 	and.w	r2, r2, #1
 80000ca:	4b1a      	ldr	r3, [pc, #104]	; (8000134 <SystemCoreClockUpdate+0x74>)
 80000cc:	491a      	ldr	r1, [pc, #104]	; (8000138 <SystemCoreClockUpdate+0x78>)
 80000ce:	2a00      	cmp	r2, #0
 80000d0:	bf14      	ite	ne
 80000d2:	460a      	movne	r2, r1
 80000d4:	461a      	moveq	r2, r3
  }

  /* Determine CPU_C2 frequency */
  cpu_c2_freq = cpu_c1_freq;

  if ((MDR_RST_CLK->CPU_CLOCK & (uint32_t)0x00000004) == (uint32_t)0x00000004)
 80000d6:	4b16      	ldr	r3, [pc, #88]	; (8000130 <SystemCoreClockUpdate+0x70>)
 80000d8:	68db      	ldr	r3, [r3, #12]
 80000da:	f013 0f04 	tst.w	r3, #4
 80000de:	d005      	beq.n	80000ec <SystemCoreClockUpdate+0x2c>
  {
    /* Determine CPU PLL output frequency */
    pll_mul = ((MDR_RST_CLK->PLL_CONTROL >> 8) & (uint32_t)0x0F) + 1;
 80000e0:	4b13      	ldr	r3, [pc, #76]	; (8000130 <SystemCoreClockUpdate+0x70>)
 80000e2:	685b      	ldr	r3, [r3, #4]
 80000e4:	f3c3 2303 	ubfx	r3, r3, #8, #4
    cpu_c2_freq *= pll_mul;
 80000e8:	fb03 2202 	mla	r2, r3, r2, r2
  }

  /*Select CPU_CLK from HSI, CPU_C3, LSE, LSI cases */
  switch ((MDR_RST_CLK->CPU_CLOCK >> 8) & (uint32_t)0x03)
 80000ec:	4b10      	ldr	r3, [pc, #64]	; (8000130 <SystemCoreClockUpdate+0x70>)
 80000ee:	68db      	ldr	r3, [r3, #12]
 80000f0:	f3c3 2301 	ubfx	r3, r3, #8, #2
 80000f4:	2b01      	cmp	r3, #1
 80000f6:	d007      	beq.n	8000108 <SystemCoreClockUpdate+0x48>
 80000f8:	b113      	cbz	r3, 8000100 <SystemCoreClockUpdate+0x40>
 80000fa:	2b02      	cmp	r3, #2
 80000fc:	d00e      	beq.n	800011c <SystemCoreClockUpdate+0x5c>
 80000fe:	e012      	b.n	8000126 <SystemCoreClockUpdate+0x66>
  {
    case 0 :
      /* HSI */
      SystemCoreClock = HSI_Value;
 8000100:	4a0c      	ldr	r2, [pc, #48]	; (8000134 <SystemCoreClockUpdate+0x74>)
 8000102:	4b0e      	ldr	r3, [pc, #56]	; (800013c <SystemCoreClockUpdate+0x7c>)
 8000104:	601a      	str	r2, [r3, #0]
      break;
 8000106:	4770      	bx	lr
    case 1 :
      /* CPU_C3 */
      /* Determine CPU_C3 frequency */
      cpu_c3_freq = cpu_c2_freq / ((MDR_RST_CLK->CPU_CLOCK >> 4 & (uint32_t)0x0F) + 1);
 8000108:	4b09      	ldr	r3, [pc, #36]	; (8000130 <SystemCoreClockUpdate+0x70>)
 800010a:	68db      	ldr	r3, [r3, #12]
 800010c:	f3c3 1303 	ubfx	r3, r3, #4, #4
 8000110:	3301      	adds	r3, #1
 8000112:	fbb2 f2f3 	udiv	r2, r2, r3
      SystemCoreClock = cpu_c3_freq;
 8000116:	4b09      	ldr	r3, [pc, #36]	; (800013c <SystemCoreClockUpdate+0x7c>)
 8000118:	601a      	str	r2, [r3, #0]
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
 8000134:	1200      	asrs	r0, r0, #8
 8000136:	007a      	lsls	r2, r7, #1
 8000138:	0900      	lsrs	r0, r0, #4
 800013a:	003d      	movs	r5, r7
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

20000008 <__HeapBase>:
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	4347      	muls	r7, r0
   2:	3a43      	subs	r2, #67	; 0x43
   4:	2820      	cmp	r0, #32
   6:	2e34      	cmp	r6, #52	; 0x34
   8:	2e38      	cmp	r6, #56	; 0x38
   a:	2d33      	cmp	r5, #51	; 0x33
   c:	3131      	adds	r1, #49	; 0x31
   e:	6275      	str	r5, [r6, #36]	; 0x24
  10:	6e75      	ldr	r5, [r6, #100]	; 0x64
  12:	7574      	strb	r4, [r6, #21]
  14:	2b31      	cmp	r3, #49	; 0x31
  16:	3131      	adds	r1, #49	; 0x31
  18:	2029      	movs	r0, #41	; 0x29
  1a:	2e34      	cmp	r6, #52	; 0x34
  1c:	2e38      	cmp	r6, #56	; 0x38
  1e:	2033      	movs	r0, #51	; 0x33
  20:	3032      	adds	r0, #50	; 0x32
  22:	3431      	adds	r4, #49	; 0x31
  24:	3930      	subs	r1, #48	; 0x30
  26:	3331      	adds	r3, #49	; 0x31
  28:	2820      	cmp	r0, #32
  2a:	6572      	str	r2, [r6, #84]	; 0x54
  2c:	656c      	str	r4, [r5, #84]	; 0x54
  2e:	7361      	strb	r1, [r4, #13]
  30:	2965      	cmp	r1, #101	; 0x65
	...

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
   c:	00f4      	lsls	r4, r6, #3
   e:	0000      	movs	r0, r0
  10:	9501      	str	r5, [sp, #4]
	...
  1e:	0000      	movs	r0, r0
  20:	0200      	lsls	r0, r0, #8
  22:	0704      	lsls	r4, r0, #28
  24:	0024      	movs	r4, r4
  26:	0000      	movs	r0, r0
  28:	0102      	lsls	r2, r0, #4
  2a:	7006      	strb	r6, [r0, #0]
  2c:	0000      	movs	r0, r0
  2e:	0200      	lsls	r0, r0, #8
  30:	0502      	lsls	r2, r0, #20
  32:	0207      	lsls	r7, r0, #8
  34:	0000      	movs	r0, r0
  36:	0403      	lsls	r3, r0, #16
  38:	6905      	ldr	r5, [r0, #16]
  3a:	746e      	strb	r6, [r5, #17]
  3c:	0200      	lsls	r0, r0, #8
  3e:	0801      	lsrs	r1, r0, #32
  40:	006e      	lsls	r6, r5, #1
  42:	0000      	movs	r0, r0
  44:	0202      	lsls	r2, r0, #8
  46:	1e07      	subs	r7, r0, #0
  48:	0000      	movs	r0, r0
  4a:	0400      	lsls	r0, r0, #16
  4c:	021e      	lsls	r6, r3, #8
  4e:	0000      	movs	r0, r0
  50:	1203      	asrs	r3, r0, #8
  52:	0021      	movs	r1, r4
  54:	0000      	movs	r0, r0
  56:	0402      	lsls	r2, r0, #16
  58:	b807      			; <UNDEFINED> instruction: 0xb807
  5a:	0001      	movs	r1, r0
  5c:	0500      	lsls	r0, r0, #20
  5e:	004b      	lsls	r3, r1, #1
  60:	0000      	movs	r0, r0
  62:	3006      	adds	r0, #6
  64:	2c02      	cmp	r4, #2
  66:	0803      	lsrs	r3, r0, #32
  68:	0001      	movs	r1, r0
  6a:	0700      	lsls	r0, r0, #28
  6c:	0211      	lsls	r1, r2, #8
  6e:	0000      	movs	r0, r0
  70:	2e02      	cmp	r6, #2
  72:	5d03      	ldrb	r3, [r0, r4]
  74:	0000      	movs	r0, r0
  76:	0000      	movs	r0, r0
  78:	1207      	asrs	r7, r0, #8
  7a:	0000      	movs	r0, r0
  7c:	0200      	lsls	r0, r0, #8
  7e:	032f      	lsls	r7, r5, #12
  80:	005d      	lsls	r5, r3, #1
  82:	0000      	movs	r0, r0
  84:	0704      	lsls	r4, r0, #28
  86:	0063      	lsls	r3, r4, #1
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
  a0:	01f3      	lsls	r3, r6, #7
  a2:	0000      	movs	r0, r0
  a4:	3202      	adds	r2, #2
  a6:	5d03      	ldrb	r3, [r0, r4]
  a8:	0000      	movs	r0, r0
  aa:	1000      	asrs	r0, r0, #32
  ac:	2707      	movs	r7, #7
  ae:	0002      	movs	r2, r0
  b0:	0200      	lsls	r0, r0, #8
  b2:	0333      	lsls	r3, r6, #12
  b4:	005d      	lsls	r5, r3, #1
  b6:	0000      	movs	r0, r0
  b8:	0714      	lsls	r4, r2, #28
  ba:	00d4      	lsls	r4, r2, #3
  bc:	0000      	movs	r0, r0
  be:	3402      	adds	r4, #2
  c0:	5d03      	ldrb	r3, [r0, r4]
  c2:	0000      	movs	r0, r0
  c4:	1800      	adds	r0, r0, r0
  c6:	fd07 0001 	stc2	0, cr0, [r7, #-4]
  ca:	0200      	lsls	r0, r0, #8
  cc:	0335      	lsls	r5, r6, #12
  ce:	005d      	lsls	r5, r3, #1
  d0:	0000      	movs	r0, r0
  d2:	071c      	lsls	r4, r3, #28
  d4:	0059      	lsls	r1, r3, #1
  d6:	0000      	movs	r0, r0
  d8:	3602      	adds	r6, #2
  da:	5d03      	ldrb	r3, [r0, r4]
  dc:	0000      	movs	r0, r0
  de:	2000      	movs	r0, #0
  e0:	3107      	adds	r1, #7
  e2:	0000      	movs	r0, r0
  e4:	0200      	lsls	r0, r0, #8
  e6:	0337      	lsls	r7, r6, #12
  e8:	005d      	lsls	r5, r3, #1
  ea:	0000      	movs	r0, r0
  ec:	0724      	lsls	r4, r4, #28
  ee:	00de      	lsls	r6, r3, #3
  f0:	0000      	movs	r0, r0
  f2:	3802      	subs	r0, #2
  f4:	5d03      	ldrb	r3, [r0, r4]
  f6:	0000      	movs	r0, r0
  f8:	2800      	cmp	r0, #0
  fa:	4f07      	ldr	r7, [pc, #28]	; (118 <Heap_Size+0x118>)
  fc:	0000      	movs	r0, r0
  fe:	0200      	lsls	r0, r0, #8
 100:	0339      	lsls	r1, r7, #12
 102:	005d      	lsls	r5, r3, #1
 104:	0000      	movs	r0, r0
 106:	002c      	movs	r4, r5
 108:	3b08      	subs	r3, #8
 10a:	0000      	movs	r0, r0
 10c:	0200      	lsls	r0, r0, #8
 10e:	033a      	lsls	r2, r7, #12
 110:	0062      	lsls	r2, r4, #1
 112:	0000      	movs	r0, r0
 114:	dd09      	ble.n	12a <Heap_Size+0x12a>
 116:	0001      	movs	r1, r0
 118:	0100      	lsls	r0, r0, #4
 11a:	c043      	stmia	r0!, {r0, r1, r6}
 11c:	0000      	movs	r0, r0
 11e:	8008      	strh	r0, [r1, #0]
 120:	0000      	movs	r0, r0
 122:	0100      	lsls	r0, r0, #4
 124:	669c      	str	r4, [r3, #104]	; 0x68
 126:	0001      	movs	r1, r0
 128:	0a00      	lsrs	r0, r0, #8
 12a:	007c      	lsls	r4, r7, #1
 12c:	0000      	movs	r0, r0
 12e:	4501      	cmp	r1, r0
 130:	004b      	lsls	r3, r1, #1
 132:	0000      	movs	r0, r0
 134:	0000      	movs	r0, r0
 136:	0000      	movs	r0, r0
 138:	c10a      	stmia	r1!, {r1, r3}
 13a:	0001      	movs	r1, r0
 13c:	0100      	lsls	r0, r0, #4
 13e:	4b45      	ldr	r3, [pc, #276]	; (254 <Heap_Size+0x254>)
 140:	0000      	movs	r0, r0
 142:	2300      	movs	r3, #0
 144:	0000      	movs	r0, r0
 146:	0a00      	lsrs	r0, r0, #8
 148:	0235      	lsls	r5, r6, #8
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
 166:	e909 0000 	stmdb	r9, {}
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
 186:	0088      	lsls	r0, r1, #2
 188:	0000      	movs	r0, r0
 18a:	e404      	b.n	fffff996 <__StackTop+0xdfff7996>
 18c:	9106      	str	r1, [sp, #24]
 18e:	0001      	movs	r1, r0
 190:	0500      	lsls	r0, r0, #20
 192:	0036      	movs	r6, r6
 194:	0000      	movs	r0, r0
 196:	cd0d      	ldmia	r5!, {r0, r2, r3}
 198:	0001      	movs	r1, r0
 19a:	0100      	lsls	r0, r0, #4
 19c:	4b34      	ldr	r3, [pc, #208]	; (270 <Heap_Size+0x270>)
 19e:	0000      	movs	r0, r0
 1a0:	0500      	lsls	r0, r0, #20
 1a2:	0003      	movs	r3, r0
 1a4:	0000      	movs	r0, r0
 1a6:	0020      	movs	r0, r4
 1a8:	0087      	lsls	r7, r0, #2
 1aa:	0000      	movs	r0, r0
 1ac:	0002      	movs	r2, r0
 1ae:	00bb      	lsls	r3, r7, #2
 1b0:	0000      	movs	r0, r0
 1b2:	0104      	lsls	r4, r0, #4
 1b4:	0111      	lsls	r1, r2, #4
 1b6:	0000      	movs	r0, r0
 1b8:	016c      	lsls	r4, r5, #5
 1ba:	0800      	lsrs	r0, r0, #32
 1bc:	01e6      	lsls	r6, r4, #7
 1be:	0800      	lsrs	r0, r0, #32
 1c0:	682f      	ldr	r7, [r5, #0]
 1c2:	6d6f      	ldr	r7, [r5, #84]	; 0x54
 1c4:	2f65      	cmp	r7, #101	; 0x65
 1c6:	6564      	str	r4, [r4, #84]	; 0x54
 1c8:	766c      	strb	r4, [r5, #25]
 1ca:	7265      	strb	r5, [r4, #9]
 1cc:	642f      	str	r7, [r5, #64]	; 0x40
 1ce:	7665      	strb	r5, [r4, #25]
 1d0:	6c65      	ldr	r5, [r4, #68]	; 0x44
 1d2:	6d2f      	ldr	r7, [r5, #80]	; 0x50
 1d4:	6c69      	ldr	r1, [r5, #68]	; 0x44
 1d6:	2f61      	cmp	r7, #97	; 0x61
 1d8:	7562      	strb	r2, [r4, #21]
 1da:	6c69      	ldr	r1, [r5, #68]	; 0x44
 1dc:	6964      	ldr	r4, [r4, #20]
 1de:	676e      	str	r6, [r5, #116]	; 0x74
 1e0:	732f      	strb	r7, [r5, #12]
 1e2:	6372      	str	r2, [r6, #52]	; 0x34
 1e4:	732f      	strb	r7, [r5, #12]
 1e6:	6174      	str	r4, [r6, #20]
 1e8:	7472      	strb	r2, [r6, #17]
 1ea:	7075      	strb	r5, [r6, #1]
 1ec:	732f      	strb	r7, [r5, #12]
 1ee:	6174      	str	r4, [r6, #20]
 1f0:	7472      	strb	r2, [r6, #17]
 1f2:	7075      	strb	r5, [r6, #1]
 1f4:	4d5f      	ldr	r5, [pc, #380]	; (374 <Heap_Size+0x374>)
 1f6:	5244      	strh	r4, [r0, r1]
 1f8:	3233      	adds	r2, #51	; 0x33
 1fa:	3946      	subs	r1, #70	; 0x46
 1fc:	7851      	ldrb	r1, [r2, #1]
 1fe:	532e      	strh	r6, [r5, r4]
 200:	2f00      	cmp	r7, #0
 202:	6f68      	ldr	r0, [r5, #116]	; 0x74
 204:	656d      	str	r5, [r5, #84]	; 0x54
 206:	642f      	str	r7, [r5, #64]	; 0x40
 208:	6c65      	ldr	r5, [r4, #68]	; 0x44
 20a:	6576      	str	r6, [r6, #84]	; 0x54
 20c:	2f72      	cmp	r7, #114	; 0x72
 20e:	6564      	str	r4, [r4, #84]	; 0x54
 210:	6576      	str	r6, [r6, #84]	; 0x54
 212:	2f6c      	cmp	r7, #108	; 0x6c
 214:	696d      	ldr	r5, [r5, #20]
 216:	616c      	str	r4, [r5, #20]
 218:	622f      	str	r7, [r5, #32]
 21a:	6975      	ldr	r5, [r6, #20]
 21c:	646c      	str	r4, [r5, #68]	; 0x44
 21e:	6e69      	ldr	r1, [r5, #100]	; 0x64
 220:	0067      	lsls	r7, r4, #1
 222:	4e47      	ldr	r6, [pc, #284]	; (340 <Heap_Size+0x340>)
 224:	2055      	movs	r0, #85	; 0x55
 226:	5341      	strh	r1, [r0, r5]
 228:	3220      	adds	r2, #32
 22a:	322e      	adds	r2, #46	; 0x2e
 22c:	2e34      	cmp	r6, #52	; 0x34
 22e:	3135      	adds	r1, #53	; 0x35
 230:	0100      	lsls	r0, r0, #4
 232:	Address 0x00000232 is out of bounds.


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
   0:	010d      	lsls	r5, r1, #4
   2:	0000      	movs	r0, r0
   4:	0002      	movs	r2, r0
   6:	00d0      	lsls	r0, r2, #3
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
  20:	642f      	str	r7, [r5, #64]	; 0x40
  22:	6c65      	ldr	r5, [r4, #68]	; 0x44
  24:	6576      	str	r6, [r6, #84]	; 0x54
  26:	2f72      	cmp	r7, #114	; 0x72
  28:	6564      	str	r4, [r4, #84]	; 0x54
  2a:	6576      	str	r6, [r6, #84]	; 0x54
  2c:	2f6c      	cmp	r7, #108	; 0x6c
  2e:	696d      	ldr	r5, [r5, #20]
  30:	616c      	str	r4, [r5, #20]
  32:	622f      	str	r7, [r5, #32]
  34:	6975      	ldr	r5, [r6, #20]
  36:	646c      	str	r4, [r5, #68]	; 0x44
  38:	6e69      	ldr	r1, [r5, #100]	; 0x64
  3a:	2f67      	cmp	r7, #103	; 0x67
  3c:	7273      	strb	r3, [r6, #9]
  3e:	2f63      	cmp	r7, #99	; 0x63
  40:	7973      	ldrb	r3, [r6, #5]
  42:	7473      	strb	r3, [r6, #17]
  44:	6d65      	ldr	r5, [r4, #84]	; 0x54
  46:	2f00      	cmp	r7, #0
  48:	6f68      	ldr	r0, [r5, #116]	; 0x74
  4a:	656d      	str	r5, [r5, #84]	; 0x54
  4c:	642f      	str	r7, [r5, #64]	; 0x40
  4e:	6c65      	ldr	r5, [r4, #68]	; 0x44
  50:	6576      	str	r6, [r6, #84]	; 0x54
  52:	2f72      	cmp	r7, #114	; 0x72
  54:	6564      	str	r4, [r4, #84]	; 0x54
  56:	6576      	str	r6, [r6, #84]	; 0x54
  58:	2f6c      	cmp	r7, #108	; 0x6c
  5a:	696d      	ldr	r5, [r5, #20]
  5c:	616c      	str	r4, [r5, #20]
  5e:	622f      	str	r7, [r5, #32]
  60:	6975      	ldr	r5, [r6, #20]
  62:	646c      	str	r4, [r5, #68]	; 0x44
  64:	6e69      	ldr	r1, [r5, #100]	; 0x64
  66:	2f67      	cmp	r7, #103	; 0x67
  68:	7273      	strb	r3, [r6, #9]
  6a:	2f63      	cmp	r7, #99	; 0x63
  6c:	6e69      	ldr	r1, [r5, #100]	; 0x64
  6e:	0063      	lsls	r3, r4, #1
  70:	682f      	ldr	r7, [r5, #0]
  72:	6d6f      	ldr	r7, [r5, #84]	; 0x54
  74:	2f65      	cmp	r7, #101	; 0x65
  76:	6564      	str	r4, [r4, #84]	; 0x54
  78:	766c      	strb	r4, [r5, #25]
  7a:	7265      	strb	r5, [r4, #9]
  7c:	642f      	str	r7, [r5, #64]	; 0x40
  7e:	7665      	strb	r5, [r4, #25]
  80:	6c65      	ldr	r5, [r4, #68]	; 0x44
  82:	6d2f      	ldr	r7, [r5, #80]	; 0x50
  84:	6c69      	ldr	r1, [r5, #68]	; 0x44
  86:	2f61      	cmp	r7, #97	; 0x61
  88:	7562      	strb	r2, [r4, #21]
  8a:	6c69      	ldr	r1, [r5, #68]	; 0x44
  8c:	6964      	ldr	r4, [r4, #20]
  8e:	676e      	str	r6, [r5, #116]	; 0x74
  90:	732f      	strb	r7, [r5, #12]
  92:	6372      	str	r2, [r6, #52]	; 0x34
  94:	632f      	str	r7, [r5, #48]	; 0x30
  96:	736d      	strb	r5, [r5, #13]
  98:	7369      	strb	r1, [r5, #13]
  9a:	0000      	movs	r0, r0
  9c:	7973      	ldrb	r3, [r6, #5]
  9e:	7473      	strb	r3, [r6, #17]
  a0:	6d65      	ldr	r5, [r4, #84]	; 0x54
  a2:	4d5f      	ldr	r5, [pc, #380]	; (220 <Heap_Size+0x220>)
  a4:	5244      	strh	r4, [r0, r1]
  a6:	3233      	adds	r2, #51	; 0x33
  a8:	3946      	subs	r1, #70	; 0x46
  aa:	7851      	ldrb	r1, [r2, #1]
  ac:	632e      	str	r6, [r5, #48]	; 0x30
  ae:	0100      	lsls	r0, r0, #4
  b0:	0000      	movs	r0, r0
  b2:	444d      	add	r5, r9
  b4:	3352      	adds	r3, #82	; 0x52
  b6:	4632      	mov	r2, r6
  b8:	2e78      	cmp	r6, #120	; 0x78
  ba:	0068      	lsls	r0, r5, #1
  bc:	0002      	movs	r2, r0
  be:	7300      	strb	r0, [r0, #12]
  c0:	6474      	str	r4, [r6, #68]	; 0x44
  c2:	6e69      	ldr	r1, [r5, #100]	; 0x64
  c4:	2e74      	cmp	r6, #116	; 0x74
  c6:	0068      	lsls	r0, r5, #1
  c8:	0003      	movs	r3, r0
  ca:	6300      	str	r0, [r0, #48]	; 0x30
  cc:	726f      	strb	r7, [r5, #9]
  ce:	5f65      	ldrsh	r5, [r4, r5]
  d0:	6d63      	ldr	r3, [r4, #84]	; 0x54
  d2:	2e33      	cmp	r6, #51	; 0x33
  d4:	0068      	lsls	r0, r5, #1
  d6:	0003      	movs	r3, r0
  d8:	0000      	movs	r0, r0
  da:	0500      	lsls	r0, r0, #20
  dc:	c002      	stmia	r0!, {r1}
  de:	0000      	movs	r0, r0
  e0:	0308      	lsls	r0, r1, #12
  e2:	00c3      	lsls	r3, r0, #3
  e4:	1901      	adds	r1, r0, r4
  e6:	0903      	lsrs	r3, r0, #4
  e8:	982e      	ldr	r0, [sp, #184]	; 0xb8
  ea:	4b5b      	ldr	r3, [pc, #364]	; (258 <Heap_Size+0x258>)
  ec:	a232      	add	r2, pc, #200	; (adr r2, 1b8 <Heap_Size+0x1b8>)
  ee:	243d      	movs	r4, #61	; 0x3d
  f0:	2f75      	cmp	r7, #117	; 0x75
  f2:	4b23      	ldr	r3, [pc, #140]	; (180 <Heap_Size+0x180>)
  f4:	0223      	lsls	r3, r4, #8
  f6:	000d      	movs	r5, r1
  f8:	0101      	lsls	r1, r0, #4
  fa:	0500      	lsls	r0, r0, #20
  fc:	4002      	ands	r2, r0
  fe:	0001      	movs	r1, r0
 100:	0308      	lsls	r0, r1, #12
 102:	0183      	lsls	r3, r0, #6
 104:	2401      	movs	r4, #1
 106:	3f3f      	subs	r7, #63	; 0x3f
 108:	3131      	adds	r1, #49	; 0x31
 10a:	3031      	adds	r0, #49	; 0x31
 10c:	0702      	lsls	r2, r0, #28
 10e:	0100      	lsls	r0, r0, #4
 110:	a801      	add	r0, sp, #4
 112:	0000      	movs	r0, r0
 114:	0200      	lsls	r0, r0, #8
 116:	5700      	ldrsb	r0, [r0, r4]
 118:	0000      	movs	r0, r0
 11a:	0200      	lsls	r0, r0, #8
 11c:	fb01 0d0e 	mla	sp, r1, lr, r0
 120:	0100      	lsls	r0, r0, #4
 122:	0101      	lsls	r1, r0, #4
 124:	0001      	movs	r1, r0
 126:	0000      	movs	r0, r0
 128:	0001      	movs	r1, r0
 12a:	0100      	lsls	r0, r0, #4
 12c:	682f      	ldr	r7, [r5, #0]
 12e:	6d6f      	ldr	r7, [r5, #84]	; 0x54
 130:	2f65      	cmp	r7, #101	; 0x65
 132:	6564      	str	r4, [r4, #84]	; 0x54
 134:	766c      	strb	r4, [r5, #25]
 136:	7265      	strb	r5, [r4, #9]
 138:	642f      	str	r7, [r5, #64]	; 0x40
 13a:	7665      	strb	r5, [r4, #25]
 13c:	6c65      	ldr	r5, [r4, #68]	; 0x44
 13e:	6d2f      	ldr	r7, [r5, #80]	; 0x50
 140:	6c69      	ldr	r1, [r5, #68]	; 0x44
 142:	2f61      	cmp	r7, #97	; 0x61
 144:	7562      	strb	r2, [r4, #21]
 146:	6c69      	ldr	r1, [r5, #68]	; 0x44
 148:	6964      	ldr	r4, [r4, #20]
 14a:	676e      	str	r6, [r5, #116]	; 0x74
 14c:	732f      	strb	r7, [r5, #12]
 14e:	6372      	str	r2, [r6, #52]	; 0x34
 150:	732f      	strb	r7, [r5, #12]
 152:	6174      	str	r4, [r6, #20]
 154:	7472      	strb	r2, [r6, #17]
 156:	7075      	strb	r5, [r6, #1]
 158:	0000      	movs	r0, r0
 15a:	7473      	strb	r3, [r6, #17]
 15c:	7261      	strb	r1, [r4, #9]
 15e:	7574      	strb	r4, [r6, #21]
 160:	5f70      	ldrsh	r0, [r6, r5]
 162:	444d      	add	r5, r9
 164:	3352      	adds	r3, #82	; 0x52
 166:	4632      	mov	r2, r6
 168:	5139      	str	r1, [r7, r4]
 16a:	2e78      	cmp	r6, #120	; 0x78
 16c:	0053      	lsls	r3, r2, #1
 16e:	0001      	movs	r1, r0
 170:	0000      	movs	r0, r0
 172:	0500      	lsls	r0, r0, #20
 174:	6c02      	ldr	r2, [r0, #64]	; 0x40
 176:	0001      	movs	r1, r0
 178:	0308      	lsls	r0, r1, #12
 17a:	0189      	lsls	r1, r1, #6
 17c:	2101      	movs	r1, #1
 17e:	2221      	movs	r2, #33	; 0x21
 180:	2131      	movs	r1, #49	; 0x31
 182:	2221      	movs	r2, #33	; 0x21
 184:	1703      	asrs	r3, r0, #28
 186:	032e      	lsls	r6, r5, #12
 188:	2e5e      	cmp	r6, #94	; 0x5e
 18a:	2f2f      	cmp	r7, #47	; 0x2f
 18c:	2f33      	cmp	r7, #51	; 0x33
 18e:	032f      	lsls	r7, r5, #12
 190:	2e2d      	cmp	r6, #45	; 0x2d
 192:	2221      	movs	r2, #33	; 0x21
 194:	2121      	movs	r1, #33	; 0x21
 196:	2221      	movs	r2, #33	; 0x21
 198:	0f03      	lsrs	r3, r0, #28
 19a:	2120      	movs	r1, #32
 19c:	2121      	movs	r1, #33	; 0x21
 19e:	2121      	movs	r1, #33	; 0x21
 1a0:	2121      	movs	r1, #33	; 0x21
 1a2:	2221      	movs	r2, #33	; 0x21
 1a4:	2121      	movs	r1, #33	; 0x21
 1a6:	2121      	movs	r1, #33	; 0x21
 1a8:	2121      	movs	r1, #33	; 0x21
 1aa:	2121      	movs	r1, #33	; 0x21
 1ac:	2121      	movs	r1, #33	; 0x21
 1ae:	2121      	movs	r1, #33	; 0x21
 1b0:	2121      	movs	r1, #33	; 0x21
 1b2:	2121      	movs	r1, #33	; 0x21
 1b4:	2121      	movs	r1, #33	; 0x21
 1b6:	2121      	movs	r1, #33	; 0x21
 1b8:	0102      	lsls	r2, r0, #4
 1ba:	0100      	lsls	r0, r0, #4
 1bc:	Address 0x000001bc is out of bounds.


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
  12:	4c50      	ldr	r4, [pc, #320]	; (154 <Heap_Size+0x154>)
  14:	5f4c      	ldrsh	r4, [r1, r5]
  16:	4f43      	ldr	r7, [pc, #268]	; (124 <Heap_Size+0x124>)
  18:	544e      	strb	r6, [r1, r1]
  1a:	4f52      	ldr	r7, [pc, #328]	; (164 <Heap_Size+0x164>)
  1c:	004c      	lsls	r4, r1, #1
  1e:	6873      	ldr	r3, [r6, #4]
  20:	726f      	strb	r7, [r5, #9]
  22:	2074      	movs	r0, #116	; 0x74
  24:	6e75      	ldr	r5, [r6, #100]	; 0x64
  26:	6973      	ldr	r3, [r6, #20]
  28:	6e67      	ldr	r7, [r4, #100]	; 0x64
  2a:	6465      	str	r5, [r4, #68]	; 0x44
  2c:	6920      	ldr	r0, [r4, #16]
  2e:	746e      	strb	r6, [r5, #17]
  30:	5400      	strb	r0, [r0, r0]
  32:	4d49      	ldr	r5, [pc, #292]	; (158 <Heap_Size+0x158>)
  34:	435f      	muls	r7, r3
  36:	4f4c      	ldr	r7, [pc, #304]	; (168 <Heap_Size+0x168>)
  38:	4b43      	ldr	r3, [pc, #268]	; (148 <Heap_Size+0x148>)
  3a:	4d00      	ldr	r5, [pc, #0]	; (3c <Heap_Size+0x3c>)
  3c:	5244      	strh	r4, [r0, r1]
  3e:	525f      	strh	r7, [r3, r1]
  40:	5453      	strb	r3, [r2, r1]
  42:	435f      	muls	r7, r3
  44:	4b4c      	ldr	r3, [pc, #304]	; (178 <Heap_Size+0x178>)
  46:	545f      	strb	r7, [r3, r1]
  48:	7079      	strb	r1, [r7, #1]
  4a:	4465      	add	r5, ip
  4c:	6665      	str	r5, [r4, #100]	; 0x64
  4e:	5300      	strh	r0, [r0, r4]
  50:	5053      	str	r3, [r2, r1]
  52:	435f      	muls	r7, r3
  54:	4f4c      	ldr	r7, [pc, #304]	; (188 <Heap_Size+0x188>)
  56:	4b43      	ldr	r3, [pc, #268]	; (164 <Heap_Size+0x164>)
  58:	4300      	orrs	r0, r0
  5a:	4e41      	ldr	r6, [pc, #260]	; (160 <Heap_Size+0x160>)
  5c:	435f      	muls	r7, r3
  5e:	4f4c      	ldr	r7, [pc, #304]	; (190 <Heap_Size+0x190>)
  60:	4b43      	ldr	r3, [pc, #268]	; (170 <Heap_Size+0x170>)
  62:	4800      	ldr	r0, [pc, #0]	; (64 <Heap_Size+0x64>)
  64:	5f53      	ldrsh	r3, [r2, r5]
  66:	4f43      	ldr	r7, [pc, #268]	; (174 <Heap_Size+0x174>)
  68:	544e      	strb	r6, [r1, r1]
  6a:	4f52      	ldr	r7, [pc, #328]	; (1b4 <Heap_Size+0x1b4>)
  6c:	004c      	lsls	r4, r1, #1
  6e:	6e75      	ldr	r5, [r6, #100]	; 0x64
  70:	6973      	ldr	r3, [r6, #20]
  72:	6e67      	ldr	r7, [r4, #100]	; 0x64
  74:	6465      	str	r5, [r4, #68]	; 0x44
  76:	6320      	str	r0, [r4, #48]	; 0x30
  78:	6168      	str	r0, [r5, #20]
  7a:	0072      	lsls	r2, r6, #1
  7c:	7063      	strb	r3, [r4, #1]
  7e:	5f75      	ldrsh	r5, [r6, r5]
  80:	3163      	adds	r1, #99	; 0x63
  82:	665f      	str	r7, [r3, #100]	; 0x64
  84:	6572      	str	r2, [r6, #84]	; 0x54
  86:	0071      	lsls	r1, r6, #1
  88:	5449      	strb	r1, [r1, r1]
  8a:	5f4d      	ldrsh	r5, [r1, r5]
  8c:	7852      	ldrb	r2, [r2, #1]
  8e:	7542      	strb	r2, [r0, #21]
  90:	6666      	str	r6, [r4, #100]	; 0x64
  92:	7265      	strb	r5, [r4, #9]
  94:	2f00      	cmp	r7, #0
  96:	6f68      	ldr	r0, [r5, #116]	; 0x74
  98:	656d      	str	r5, [r5, #84]	; 0x54
  9a:	642f      	str	r7, [r5, #64]	; 0x40
  9c:	6c65      	ldr	r5, [r4, #68]	; 0x44
  9e:	6576      	str	r6, [r6, #84]	; 0x54
  a0:	2f72      	cmp	r7, #114	; 0x72
  a2:	6564      	str	r4, [r4, #84]	; 0x54
  a4:	6576      	str	r6, [r6, #84]	; 0x54
  a6:	2f6c      	cmp	r7, #108	; 0x6c
  a8:	696d      	ldr	r5, [r5, #20]
  aa:	616c      	str	r4, [r5, #20]
  ac:	622f      	str	r7, [r5, #32]
  ae:	6975      	ldr	r5, [r6, #20]
  b0:	646c      	str	r4, [r5, #68]	; 0x44
  b2:	6e69      	ldr	r1, [r5, #100]	; 0x64
  b4:	2f67      	cmp	r7, #103	; 0x67
  b6:	7273      	strb	r3, [r6, #9]
  b8:	2f63      	cmp	r7, #99	; 0x63
  ba:	7973      	ldrb	r3, [r6, #5]
  bc:	7473      	strb	r3, [r6, #17]
  be:	6d65      	ldr	r5, [r4, #84]	; 0x54
  c0:	732f      	strb	r7, [r5, #12]
  c2:	7379      	strb	r1, [r7, #13]
  c4:	6574      	str	r4, [r6, #84]	; 0x54
  c6:	5f6d      	ldrsh	r5, [r5, r5]
  c8:	444d      	add	r5, r9
  ca:	3352      	adds	r3, #82	; 0x52
  cc:	4632      	mov	r2, r6
  ce:	5139      	str	r1, [r7, r4]
  d0:	2e78      	cmp	r6, #120	; 0x78
  d2:	0063      	lsls	r3, r4, #1
  d4:	5452      	strb	r2, [r2, r1]
  d6:	5f43      	ldrsh	r3, [r0, r5]
  d8:	4c43      	ldr	r4, [pc, #268]	; (1e8 <Heap_Size+0x1e8>)
  da:	434f      	muls	r7, r1
  dc:	004b      	lsls	r3, r1, #1
  de:	4155      	adcs	r5, r2
  e0:	5452      	strb	r2, [r2, r1]
  e2:	435f      	muls	r7, r3
  e4:	4f4c      	ldr	r7, [pc, #304]	; (218 <Heap_Size+0x218>)
  e6:	4b43      	ldr	r3, [pc, #268]	; (1f4 <Heap_Size+0x1f4>)
  e8:	5300      	strh	r0, [r0, r4]
  ea:	7379      	strb	r1, [r7, #13]
  ec:	6574      	str	r4, [r6, #84]	; 0x54
  ee:	496d      	ldr	r1, [pc, #436]	; (2a4 <Heap_Size+0x2a4>)
  f0:	696e      	ldr	r6, [r5, #20]
  f2:	0074      	lsls	r4, r6, #1
  f4:	4e47      	ldr	r6, [pc, #284]	; (214 <Heap_Size+0x214>)
  f6:	2055      	movs	r0, #85	; 0x55
  f8:	2043      	movs	r0, #67	; 0x43
  fa:	2e34      	cmp	r6, #52	; 0x34
  fc:	2e38      	cmp	r6, #56	; 0x38
  fe:	2033      	movs	r0, #51	; 0x33
 100:	3032      	adds	r0, #50	; 0x32
 102:	3431      	adds	r4, #49	; 0x31
 104:	3930      	subs	r1, #48	; 0x30
 106:	3331      	adds	r3, #49	; 0x31
 108:	2820      	cmp	r0, #32
 10a:	6572      	str	r2, [r6, #84]	; 0x54
 10c:	656c      	str	r4, [r5, #84]	; 0x54
 10e:	7361      	strb	r1, [r4, #13]
 110:	2965      	cmp	r1, #101	; 0x65
 112:	2d20      	cmp	r5, #32
 114:	636d      	str	r5, [r5, #52]	; 0x34
 116:	7570      	strb	r0, [r6, #21]
 118:	633d      	str	r5, [r7, #48]	; 0x30
 11a:	726f      	strb	r7, [r5, #9]
 11c:	6574      	str	r4, [r6, #84]	; 0x54
 11e:	2d78      	cmp	r5, #120	; 0x78
 120:	336d      	adds	r3, #109	; 0x6d
 122:	2d20      	cmp	r5, #32
 124:	746d      	strb	r5, [r5, #17]
 126:	7568      	strb	r0, [r5, #21]
 128:	626d      	str	r5, [r5, #36]	; 0x24
 12a:	2d20      	cmp	r5, #32
 12c:	666d      	str	r5, [r5, #100]	; 0x64
 12e:	6f6c      	ldr	r4, [r5, #116]	; 0x74
 130:	7461      	strb	r1, [r4, #17]
 132:	612d      	str	r5, [r5, #16]
 134:	6962      	ldr	r2, [r4, #20]
 136:	733d      	strb	r5, [r7, #12]
 138:	666f      	str	r7, [r5, #100]	; 0x64
 13a:	2074      	movs	r0, #116	; 0x74
 13c:	672d      	str	r5, [r5, #112]	; 0x70
 13e:	2d20      	cmp	r5, #32
 140:	314f      	adds	r1, #79	; 0x4f
 142:	2d20      	cmp	r5, #32
 144:	7366      	strb	r6, [r4, #13]
 146:	6769      	str	r1, [r5, #116]	; 0x74
 148:	656e      	str	r6, [r5, #84]	; 0x54
 14a:	2d64      	cmp	r5, #100	; 0x64
 14c:	6863      	ldr	r3, [r4, #4]
 14e:	7261      	strb	r1, [r4, #9]
 150:	2d20      	cmp	r5, #32
 152:	6e66      	ldr	r6, [r4, #100]	; 0x64
 154:	2d6f      	cmp	r5, #111	; 0x6f
 156:	7865      	ldrb	r5, [r4, #1]
 158:	6563      	str	r3, [r4, #84]	; 0x54
 15a:	7470      	strb	r0, [r6, #17]
 15c:	6f69      	ldr	r1, [r5, #116]	; 0x74
 15e:	736e      	strb	r6, [r5, #13]
 160:	2d20      	cmp	r5, #32
 162:	6e66      	ldr	r6, [r4, #100]	; 0x64
 164:	2d6f      	cmp	r5, #111	; 0x6f
 166:	6e75      	ldr	r5, [r6, #100]	; 0x64
 168:	6977      	ldr	r7, [r6, #20]
 16a:	646e      	str	r6, [r5, #68]	; 0x44
 16c:	742d      	strb	r5, [r5, #16]
 16e:	6261      	str	r1, [r4, #36]	; 0x24
 170:	656c      	str	r4, [r5, #84]	; 0x54
 172:	2073      	movs	r0, #115	; 0x73
 174:	662d      	str	r5, [r5, #96]	; 0x60
 176:	6f6e      	ldr	r6, [r5, #116]	; 0x74
 178:	612d      	str	r5, [r5, #16]
 17a:	7973      	ldrb	r3, [r6, #5]
 17c:	636e      	str	r6, [r5, #52]	; 0x34
 17e:	7268      	strb	r0, [r5, #9]
 180:	6e6f      	ldr	r7, [r5, #100]	; 0x64
 182:	756f      	strb	r7, [r5, #21]
 184:	2d73      	cmp	r5, #115	; 0x73
 186:	6e75      	ldr	r5, [r6, #100]	; 0x64
 188:	6977      	ldr	r7, [r6, #20]
 18a:	646e      	str	r6, [r5, #68]	; 0x44
 18c:	742d      	strb	r5, [r5, #16]
 18e:	6261      	str	r1, [r4, #36]	; 0x24
 190:	656c      	str	r4, [r5, #84]	; 0x54
 192:	2073      	movs	r0, #115	; 0x73
 194:	662d      	str	r5, [r5, #96]	; 0x60
 196:	7566      	strb	r6, [r4, #21]
 198:	636e      	str	r6, [r5, #52]	; 0x34
 19a:	6974      	ldr	r4, [r6, #20]
 19c:	6e6f      	ldr	r7, [r5, #100]	; 0x64
 19e:	732d      	strb	r5, [r5, #12]
 1a0:	6365      	str	r5, [r4, #52]	; 0x34
 1a2:	6974      	ldr	r4, [r6, #20]
 1a4:	6e6f      	ldr	r7, [r5, #100]	; 0x64
 1a6:	2073      	movs	r0, #115	; 0x73
 1a8:	662d      	str	r5, [r5, #96]	; 0x60
 1aa:	6164      	str	r4, [r4, #20]
 1ac:	6174      	str	r4, [r6, #20]
 1ae:	732d      	strb	r5, [r5, #12]
 1b0:	6365      	str	r5, [r4, #52]	; 0x34
 1b2:	6974      	ldr	r4, [r6, #20]
 1b4:	6e6f      	ldr	r7, [r5, #100]	; 0x64
 1b6:	0073      	lsls	r3, r6, #1
 1b8:	6973      	ldr	r3, [r6, #20]
 1ba:	657a      	str	r2, [r7, #84]	; 0x54
 1bc:	7974      	ldrb	r4, [r6, #5]
 1be:	6570      	str	r0, [r6, #84]	; 0x54
 1c0:	6300      	str	r0, [r0, #48]	; 0x30
 1c2:	7570      	strb	r0, [r6, #21]
 1c4:	635f      	str	r7, [r3, #52]	; 0x34
 1c6:	5f32      	ldrsh	r2, [r6, r4]
 1c8:	7266      	strb	r6, [r4, #9]
 1ca:	7165      	strb	r5, [r4, #5]
 1cc:	5300      	strh	r0, [r0, r4]
 1ce:	7379      	strb	r1, [r7, #13]
 1d0:	6574      	str	r4, [r6, #84]	; 0x54
 1d2:	436d      	muls	r5, r5
 1d4:	726f      	strb	r7, [r5, #9]
 1d6:	4365      	muls	r5, r4
 1d8:	6f6c      	ldr	r4, [r5, #116]	; 0x74
 1da:	6b63      	ldr	r3, [r4, #52]	; 0x34
 1dc:	5300      	strh	r0, [r0, r4]
 1de:	7379      	strb	r1, [r7, #13]
 1e0:	6574      	str	r4, [r6, #84]	; 0x54
 1e2:	436d      	muls	r5, r5
 1e4:	726f      	strb	r7, [r5, #9]
 1e6:	4365      	muls	r5, r4
 1e8:	6f6c      	ldr	r4, [r5, #116]	; 0x74
 1ea:	6b63      	ldr	r3, [r4, #52]	; 0x34
 1ec:	7055      	strb	r5, [r2, #1]
 1ee:	6164      	str	r4, [r4, #20]
 1f0:	6574      	str	r4, [r6, #84]	; 0x54
 1f2:	5500      	strb	r0, [r0, r4]
 1f4:	4253      	negs	r3, r2
 1f6:	435f      	muls	r7, r3
 1f8:	4f4c      	ldr	r7, [pc, #304]	; (32c <Heap_Size+0x32c>)
 1fa:	4b43      	ldr	r3, [pc, #268]	; (308 <Heap_Size+0x308>)
 1fc:	5000      	str	r0, [r0, r0]
 1fe:	5245      	strh	r5, [r0, r1]
 200:	435f      	muls	r7, r3
 202:	4f4c      	ldr	r7, [pc, #304]	; (334 <Heap_Size+0x334>)
 204:	4b43      	ldr	r3, [pc, #268]	; (314 <Heap_Size+0x314>)
 206:	7300      	strb	r0, [r0, #12]
 208:	6f68      	ldr	r0, [r5, #116]	; 0x74
 20a:	7472      	strb	r2, [r6, #17]
 20c:	6920      	ldr	r0, [r4, #16]
 20e:	746e      	strb	r6, [r5, #17]
 210:	4300      	orrs	r0, r0
 212:	4f4c      	ldr	r7, [pc, #304]	; (344 <Heap_Size+0x344>)
 214:	4b43      	ldr	r3, [pc, #268]	; (324 <Heap_Size+0x324>)
 216:	535f      	strh	r7, [r3, r5]
 218:	4154      	adcs	r4, r2
 21a:	5554      	strb	r4, [r2, r5]
 21c:	0053      	lsls	r3, r2, #1
 21e:	6975      	ldr	r5, [r6, #20]
 220:	746e      	strb	r6, [r5, #17]
 222:	3233      	adds	r2, #51	; 0x33
 224:	745f      	strb	r7, [r3, #17]
 226:	4100      	asrs	r0, r0
 228:	4344      	muls	r4, r0
 22a:	4d5f      	ldr	r5, [pc, #380]	; (3a8 <Heap_Size+0x3a8>)
 22c:	4f43      	ldr	r7, [pc, #268]	; (33c <Heap_Size+0x33c>)
 22e:	435f      	muls	r7, r3
 230:	4f4c      	ldr	r7, [pc, #304]	; (364 <Heap_Size+0x364>)
 232:	4b43      	ldr	r3, [pc, #268]	; (340 <Heap_Size+0x340>)
 234:	6300      	str	r0, [r0, #48]	; 0x30
 236:	7570      	strb	r0, [r6, #21]
 238:	635f      	str	r7, [r3, #52]	; 0x34
 23a:	5f33      	ldrsh	r3, [r6, r4]
 23c:	7266      	strb	r6, [r4, #9]
 23e:	7165      	strb	r5, [r4, #5]
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
  1a:	0052      	lsls	r2, r2, #1
  1c:	0000      	movs	r0, r0
  1e:	0000      	movs	r0, r0
  20:	0000      	movs	r0, r0
  22:	d600      	bvs.n	26 <Heap_Size+0x26>
  24:	0000      	movs	r0, r0
  26:	0208      	lsls	r0, r1, #8
  28:	0001      	movs	r1, r0
  2a:	0108      	lsls	r0, r1, #4
  2c:	5200      	strh	r0, [r0, r0]
  2e:	0108      	lsls	r0, r1, #4
  30:	0800      	lsrs	r0, r0, #32
  32:	0116      	lsls	r6, r2, #4
  34:	0800      	lsrs	r0, r0, #32
  36:	0001      	movs	r1, r0
  38:	1c52      	adds	r2, r2, #1
  3a:	0001      	movs	r1, r0
  3c:	2008      	movs	r0, #8
  3e:	0001      	movs	r1, r0
  40:	0108      	lsls	r0, r1, #4
  42:	5200      	strh	r0, [r0, r0]
  44:	0126      	lsls	r6, r4, #4
  46:	0800      	lsrs	r0, r0, #32
  48:	012a      	lsls	r2, r5, #4
  4a:	0800      	lsrs	r0, r0, #32
  4c:	0001      	movs	r1, r0
  4e:	0052      	lsls	r2, r2, #1
  50:	0000      	movs	r0, r0
  52:	0000      	movs	r0, r0
  54:	0000      	movs	r0, r0
  56:	0c00      	lsrs	r0, r0, #16
  58:	0001      	movs	r1, r0
  5a:	1008      	asrs	r0, r1, #32
  5c:	0001      	movs	r1, r0
  5e:	1208      	asrs	r0, r1, #8
  60:	7200      	strb	r0, [r0, #8]
  62:	f700 7321 			; <UNDEFINED> instruction: 0xf7007321
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
  84:	7300      	strb	r0, [r0, #12]
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
