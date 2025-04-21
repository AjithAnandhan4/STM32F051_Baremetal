ENTRY(_start)

MEMORY
{
    FLASH (rx)  : ORIGIN = 0x00000000, LENGTH = 256K
    RAM   (rwx) : ORIGIN = 0x20000000, LENGTH = 64K
}

_estack = ORIGIN(RAM) + LENGTH(RAM); /* Stack pointer value (top of RAM) */

SECTIONS
{
    /* Place vector table and startup code at beginning of FLASH */
    .text : {
        KEEP(*(.isr_vector))       /* Make sure vector table is not removed */
        *(.text*)                  /* All .text sections */
        *(.rodata*)                /* Read-only data */
    } > FLASH

    .data : {
        *(.data*)
    } > RAM AT > FLASH

    .bss : {
        *(.bss*)
        *(COMMON)
    } > RAM

    .stack (NOLOAD): {
        *(.stack)
    } > RAM
}

