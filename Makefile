# Target
all: build.elf

# Link the object files into an ELF executable
build.elf: startup.o main.o
	arm-none-eabi-ld -T linker.ld -nostdlib -Map=build.map -o build.elf startup.o main.o

# Compile C source into object file
main.o: main.c
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -g -c main.c -o main.o

# Assemble startup code
startup.o: startup.s
	arm-none-eabi-as -mcpu=cortex-m3 -g -o startup.o startup.s

# Clean build artifacts
clean:
	rm -f *.o *.elf *.map
