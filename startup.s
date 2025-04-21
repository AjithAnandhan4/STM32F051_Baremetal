.syntax unified
.thumb

.global _start
_start:
    LDR SP, =_estack   // Set stack pointer
    BL main            // Branch to main
    B .                // Infinite loop if main returns

.section .isr_vector, "a", %progbits
.type vector_table, %object
vector_table:
    .word _estack
    .word _start
    .word NMI_Handler
    .word HardFault_Handler
    .word MemManage_Handler
    .word BusFault_Handler
    .word UsageFault_Handler
    .word 0
    .word 0
    .word 0
    .word 0
    .word SVC_Handler
    .word DebugMon_Handler
    .word 0
    .word PendSV_Handler
    .word SysTick_Handler

.section .text
.global NMI_Handler
.global HardFault_Handler
.global MemManage_Handler
.global BusFault_Handler
.global UsageFault_Handler
.global SVC_Handler
.global DebugMon_Handler
.global PendSV_Handler
.global SysTick_Handler

NMI_Handler:
    B .

HardFault_Handler:
    B .

MemManage_Handler:
    B .

BusFault_Handler:
    B .

UsageFault_Handler:
    B .

SVC_Handler:
    B .

DebugMon_Handler:
    B .

PendSV_Handler:
    B .

SysTick_Handler:
    B .

.section .stack, "aw", %nobits
.space 0x1000
_estack:
