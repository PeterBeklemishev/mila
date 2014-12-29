/* File: startup_ARMCM3.S
 * Purpose: startup file for Cortex-M3 devices. Should use with 
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
    .arch armv7-m

    .section .stack
    .align 3
#ifdef __STACK_SIZE
    .equ    Stack_Size, __STACK_SIZE
#else
    .equ    Stack_Size, 0xc00
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
    .long    __StackTop            /* Top of Stack */
    .long    Reset_Handler         /* Reset Handler */
    .long    NMI_Handler           /* NMI Handler */
    .long    HardFault_Handler     /* Hard Fault Handler */
    .long    MemManage_Handler     /* MPU Fault Handler */
    .long    BusFault_Handler      /* Bus Fault Handler */
    .long    UsageFault_Handler    /* Usage Fault Handler */
    .long    0                     /* Reserved */
    .long    0                     /* Reserved */
    .long    0                     /* Reserved */
    .long    0                     /* Reserved */
    .long    SVC_Handler           /* SVCall Handler */
    .long    DebugMon_Handler      /* Debug Monitor Handler */
    .long    0                     /* Reserved */
    .long    PendSV_Handler        /* PendSV Handler */
    .long    SysTick_Handler       /* SysTick Handler */

    /* External interrupts */
    .long    CAN1_IRQHandler       /* IRQ0 */
    .long    CAN2_IRQHandler       /* IRQ1 */
    .long    USB_IRQHandler        /* IRQ2 */
    .long    0                     /* IRQ3  reserved */
    .long    0                     /* IRQ4  reserved */
    .long    DMA_IRQHandler        /* IRQ5 */
    .long    UART1_IRQHandler      /* IRQ6 */
    .long    UART2_IRQHandler      /* IRQ7 */
    .long    SSP1_IRQHandler       /* IRQ8 */
    .long    0                     /* IRQ9  reserved */
    .long    I2C_IRQHandler        /* IRQ10 */
    .long    POWER_IRQHandler      /* IRQ11 */
    .long    WWDG_IRQHandler       /* IRQ12 */
    .long    0                     /* IRQ13 reserved */
    .long    Timer1_IRQHandler     /* IRQ14 */
    .long    Timer2_IRQHandler     /* IRQ15 */
    .long    Timer3_IRQHandler     /* IRQ16 */
    .long    ADC_IRQHandler        /* IRQ17 */
    .long    0                     /* IRQ18 reserved */
    .long    COMPARATOR_IRQHandler /* IRQ19 */
    .long    SSP2_IRQHandler       /* IRQ20 */
    .long    0                     /* IRQ21 reserved */
    .long    0                     /* IRQ22 reserved */
    .long    0                     /* IRQ23 reserved */
    .long    0                     /* IRQ24 reserved */
    .long    0                     /* IRQ25 reserved */
    .long    0                     /* IRQ26 reserved */
    .long    BACKUP_IRQHandler     /* IRQ27 */
    .long    EXT_INT1_IRQHandler   /* IRQ28 */
    .long    EXT_INT2_IRQHandler   /* IRQ29 */
    .long    EXT_INT3_IRQHandler   /* IRQ30 */
    .long    EXT_INT4_IRQHandler   /* IRQ31 */
    
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

/* Copy RAM functions from FLASH to RAM */
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
    itt    lt
    strlt   r0, [r1], #4
    blt    .LC0
#endif /* __STARTUP_CLEAR_BSS */

#ifndef __NO_SYSTEM_INIT
    bl    SystemInit
#endif

#ifndef __START
#define __START _start
#endif
    bl    __START
//    bl    _start

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
    def_default_handler    MemManage_Handler
    def_default_handler    BusFault_Handler
    def_default_handler    UsageFault_Handler
    def_default_handler    SVC_Handler
    def_default_handler    DebugMon_Handler
    def_default_handler    PendSV_Handler
    def_default_handler    SysTick_Handler
    
    def_default_handler    CAN1_IRQHandler
    def_default_handler    CAN2_IRQHandler
    def_default_handler    USB_IRQHandler
    def_default_handler    DMA_IRQHandler
    def_default_handler    UART1_IRQHandler
    def_default_handler    UART2_IRQHandler
    def_default_handler    SSP1_IRQHandler
    def_default_handler    I2C_IRQHandler
    def_default_handler    POWER_IRQHandler
    def_default_handler    WWDG_IRQHandler
    def_default_handler    Timer1_IRQHandler
    def_default_handler    Timer2_IRQHandler
    def_default_handler    Timer3_IRQHandler
    def_default_handler    ADC_IRQHandler
    def_default_handler    COMPARATOR_IRQHandler
    def_default_handler    SSP2_IRQHandler
    def_default_handler    BACKUP_IRQHandler
    def_default_handler    EXT_INT1_IRQHandler
    def_default_handler    EXT_INT2_IRQHandler
    def_default_handler    EXT_INT3_IRQHandler
    def_default_handler    EXT_INT4_IRQHandler
    
    .end
