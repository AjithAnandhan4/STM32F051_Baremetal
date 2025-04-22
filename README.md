
# README

## To Generate Preprocessed Output from `src` File:
```bash
arm-none-eabi-gcc -E main.c -o main.i
```

## To Generate `.s` or Assembly File for a Particular Architecture:
- Default architecture will be selected if you use this command:
```bash
arm-none-eabi-gcc -S main.i -o main.s
```

- For ARM Cortex-M0:
```bash
arm-none-eabi-gcc -S -mcpu=cortex-m0 -mthumb main.i -o main.s
```

## To Compile `.c` to `.o` Object File:
```bash
arm-none-eabi-gcc -c -mcpu=cortex-m0 -mthumb startup.c -o startup.o	
arm-none-eabi-gcc -c -mcpu=cortex-m0 -mthumb main.c -o main.o
```

## To Link Multiple `.o` Files:
```bash
arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -T main.ld -o main.elf main.o startup.o
```

### Output:
```bash
D:\_AJITH_ANANDHAN\Practice Project\lowlevel_c_ practice\sample_project1> arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -nostdlib -T main.ld -o main.elf main.o startup.o
C:/arm-gnu-toolchain-14.2.rel1-mingw-w64-x86_64-arm-none-eabi/bin/../lib/gcc/arm-none-eabi/14.2.1/../../../../arm-none-eabi/bin/ld.exe: warning: main.elf has a LOAD segment with RWX permissions
```

## To Generate `.map` File:
Add the following option to the GCC command:
```bash
arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -nostdlib -Wl,-Map=main.map -T main.ld -o main.elf main.o startup.o
```

### Output:
```bash
D:\_AJITH_ANANDHAN\Practice Project\lowlevel_c_ practice\sample_project1> arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -nostdlib -Wl,-Map=main.map -T main.ld -o main.elf main.o startup.o
C:/arm-gnu-toolchain-14.2.rel1-mingw-w64-x86_64-arm-none-eabi/bin/../lib/gcc/arm-none-eabi/14.2.1/../../../../arm-none-eabi/bin/ld.exe: warning: main.elf has a LOAD segment with RWX permissions
```

## Makefile Cookbook:
For more information on creating Makefiles, check out the [Makefile Cookbook](https://makefiletutorial.com/#makefile-cookbook).
```