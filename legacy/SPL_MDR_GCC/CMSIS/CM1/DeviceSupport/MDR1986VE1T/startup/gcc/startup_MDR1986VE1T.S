/* File: startup_ARMCM1.S
 * Purpose: startup file for Cortex-M1 devices. Should use with 
 *   GCC for ARM Embedded Processors
 * Version: V1.4
 * Date: 09 July 2012
 * 
 * Copyright (c) 2011, 2012, ARM Limited
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the ARM Limited nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL ARM LIMITED BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
    .syntax unified
    .cpu cortex-m1

    .section .stack
    .align 3
#ifdef __STACK_SIZE
    .equ    Stack_Size, __STACK_SIZE
#else
    .equ    Stack_Size, 0x1000
#endif
    .globl    __StackTop
    .globl    __StackLimit
__StackLimit:
    .space    Stack_Size
    .size __StackLimit, . - __StackLimit
__StackTop:
    .size __StackTop, . - __StackTop

    .section .heap
    .align 3
#ifdef __HEAP_SIZE
    .equ    Heap_Size, __HEAP_SIZE
#else
    .equ    Heap_Size, 0
#endif
    .globl    __HeapBase
    .globl    __HeapLimit
__HeapBase:
    .if    Heap_Size
    .space    Heap_Size
    .endif
    .size __HeapBase, . - __HeapBase
__HeapLimit:
    .size __HeapLimit, . - __HeapLimit
    
    .section .isr_vector
    .align 2
    .globl __isr_vector
__isr_vector:
    .long    __StackTop            		/* Top of Stack */
    .long    Reset_Handler         		/* Reset Handler */
    .long    NMI_Handler           		/* NMI Handler */
    .long    HardFault_Handler     		/* Hard Fault Handler */
    .long    0                     		/* Reserved */
    .long    0                     		/* Reserved */
    .long    0                     		/* Reserved */
    .long    0                     		/* Reserved */
    .long    0                     		/* Reserved */
    .long    0                     		/* Reserved */
    .long    0                     		/* Reserved */
    .long    SVC_Handler           		/* SVCall Handler */
    .long    0                     		/* Reserved */
    .long    0                     		/* Reserved */
    .long    PendSV_Handler        		/* PendSV Handler */
    .long    SysTick_Handler       		/* SysTick Handler */

    /* External interrupts */
    .long    MIL_STD_1553B2_Handler		/* IRQ0 */
    .long    MIL_STD_1553B1_Handler		/* IRQ1 */
    .long    USB_Handler			/* IRQ2 */
    .long    CAN1_Handler			/* IRQ3 */
    .long    CAN2_Handler			/* IRQ4 */
    .long    DMA_Handler			/* IRQ5 */
    .long    UART1_Handler			/* IRQ6 */
    .long    UART2_Handler			/* IRQ7 */
    .long    SSP1_Handler			/* IRQ8 */
    .long    BUSY_Handler			/* IRQ9 */
    .long    ARINC429R_Handler			/* IRQ10 */
    .long    POWER_Handler			/* IRQ11 */
    .long    WWDG_Handler			/* IRQ12 */
    .long    TIMER4_Handler			/* IRQ13 */
    .long    TIMER1_Handler			/* IRQ14 */
    .long    TIMER2_Handler			/* IRQ15 */
    .long    TIMER3_Handler			/* IRQ16 */
    .long    ADC_Handler			/* IRQ17 */
    .long    ETHERNET_Handler			/* IRQ18 */
    .long    SSP3_Handler			/* IRQ19 */
    .long    SSP2_Handler			/* IRQ20 */
    .long    ARINC429T1_Handler			/* IRQ21 */
    .long    ARINC429T2_Handler			/* IRQ22 */
    .long    ARINC429T3_Handler			/* IRQ23 */
    .long    ARINC429T4_Handler			/* IRQ24 */
    .long    0					/* IRQ25 */
    .long    0					/* IRQ26 */
    .long    BKP_Handler			/* IRQ27 */
    .long    EXT_INT1_Handler			/* IRQ28 */
    .long    EXT_INT2_Handler			/* IRQ29 */
    .long    EXT_INT3_Handler			/* IRQ30 */
    .long    EXT_INT4_Handler			/* IRQ31 */
    
    .size    __isr_vector, . - __isr_vector

    .text
    .thumb
    .thumb_func
    .align 2
    .globl    Reset_Handler
    .type    Reset_Handler, %function
Reset_Handler:
/*     Loop to copy data from read only memory to RAM. The ranges
 *      of copy from/to are specified by following symbols evaluated in 
 *      linker script.
 *      __etext: End of code section, i.e., begin of data sections to copy from.
 *      __data_start__/__data_end__: RAM address range that data should be
 *      copied to. Both must be aligned to 4 bytes boundary.  */

    ldr    r1, =__etext
    ldr    r2, =__data_start__
    ldr    r3, =__data_end__

    bl     copy_to_ram

/* Copy RAM functions from FLASH to IRAM */
    ldr    r1, =__exec_mem__
    ldr    r2, =__exec_mem_start__
    ldr    r3, =__exec_mem_end__

    bl     copy_to_ram

#ifdef __STARTUP_CLEAR_BSS
/*     This part of work usually is done in C library startup code. Otherwise,
 *     define this macro to enable it in this startup.
 *
 *     Loop to zero out BSS section, which uses following symbols
 *     in linker script:
 *      __bss_start__: start of BSS section. Must align to 4
 *      __bss_end__: end of BSS section. Must align to 4
 */
    ldr r1, =__bss_start__
    ldr r2, =__bss_end__

    movs    r0, 0
.LC0:
    cmp     r1, r2
    bge    .LC1
    str     r0, [r1], #4
    b      .LC0
.LC1:
#endif /* __STARTUP_CLEAR_BSS */

#ifndef __NO_SYSTEM_INIT
    bl    SystemInit
#endif

#ifndef __START
#define __START _start
#endif
    bl    __START
    .pool
    .size Reset_Handler, . - Reset_Handler

/* Copy to ram
   r1: src
   r2: target start
   r3: target end
*/
    .thumb
    .thumb_func
    .align 2
copy_to_ram:
    subs    r3, r2
    ble    1f
0:
    subs    r3, #4
    ldr    r0, [r1, r3]
    str    r0, [r2, r3]
    bgt    0b
1:
    bx lr
    
/*    Macro to define default handlers. Default handler
 *    will be weak symbol and just dead loops. They can be
 *    overwritten by other handlers */
    .macro    def_default_handler    handler_name
    .align 1
    .thumb_func
    .weak    \handler_name
    .type    \handler_name, %function
\handler_name :
    b    .
    .size    \handler_name, . - \handler_name
    .endm
    
    def_default_handler    NMI_Handler
    def_default_handler    HardFault_Handler
    def_default_handler    SVC_Handler
    def_default_handler    PendSV_Handler
    def_default_handler    SysTick_Handler
    
    def_default_handler    MIL_STD_1553B2_Handler
    def_default_handler    MIL_STD_1553B1_Handler
    def_default_handler    USB_Handler
    def_default_handler    CAN1_Handler
    def_default_handler    CAN2_Handler
    def_default_handler    DMA_Handler
    def_default_handler    UART1_Handler
    def_default_handler    UART2_Handler
    def_default_handler    SSP1_Handler
    def_default_handler    BUSY_Handler
    def_default_handler    ARINC429R_Handler
    def_default_handler    POWER_Handler
    def_default_handler    WWDG_Handler
    def_default_handler    TIMER4_Handler
    def_default_handler    TIMER1_Handler
    def_default_handler    TIMER2_Handler
    def_default_handler    TIMER3_Handler
    def_default_handler    ADC_Handler
    def_default_handler    ETHERNET_Handler
    def_default_handler    SSP3_Handler
    def_default_handler    SSP2_Handler
    def_default_handler    ARINC429T1_Handler
    def_default_handler    ARINC429T2_Handler
    def_default_handler    ARINC429T3_Handler
    def_default_handler    ARINC429T4_Handler
    def_default_handler    BKP_Handler
    def_default_handler    EXT_INT1_Handler
    def_default_handler    EXT_INT2_Handler
    def_default_handler    EXT_INT3_Handler
    def_default_handler    EXT_INT4_Handler
    
    .end
