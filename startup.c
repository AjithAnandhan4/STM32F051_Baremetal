#include <stdint.h>

extern uint32_t _sStack, _startflashdataaddr, _sdatasram, _edatasram, _sbss, _ebss;
extern int main(void);
extern void Reset_Handler(void);
uint32_t *vector_table[47] __attribute__((section (".vectors"))) = 
{
	(uint32_t *)&_sStack,    /* 0x00000000 */
	(uint32_t *)Reset_Handler, /* 0x00000004*/
	
	
};

void Reset_Handler(void)
{
	//Copy data section from flash to sram
	uint32_t *src = &_startflashdataaddr;
	uint32_t *dest = &_sdatasram;
	while(dest < &_edatasram)
	{
		*dest++ = *src++;
	}
	
	//Initalize .bss section with zero
	dest = &_sbss;
	while(dest < &_ebss)
	{
		*dest++ = 0U;
	}
	
	//give control to main 
	main();
	
}