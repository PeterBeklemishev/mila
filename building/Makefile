TARGET = $(CURDIR)

PROG_NAME = second

ARCH = cortex-m3
TOOLS_PATH = /usr/bin
TOOLS_PREFIX = arm-none-eabi-
TOOLS_VERSION = 4.8
NEWLIB_PATH = /usr/lib/arm-none-eabi/newlib

#CC		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)gcc-$(TOOLS_VERSION) -Wall
CC		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)gcc -Wall
CXX		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)g++ -Wall
#AS		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)as
AS		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)gcc-$(TOOLS_VERSION) -x assembler-with-cpp
SIZE		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)size
AR		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)ar
OBJDUMP		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)objdump --disassembler-options=force-thumb
OBJCOPY		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)objcopy

SRC	= $(TARGET)/src
STARTUP  = $(SRC)/startup/startup_MDR32F9Qx
SYSSRC	= $(SRC)/system/system_MDR32F9Qx
CORECM3 = $(SRC)/cmsis/core_cm3
LDS = $(SRC)/ldscripts

CFLAGS   = -O1 -mcpu=$(ARCH) -mthumb -g -fsigned-char -msoft-float -DARM1986_BE9 -DARM_CORTEX_M3 \
   -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables \
   -ffunction-sections -fdata-sections \
	-I$(SRC)/cmsis -I$(SRC)/inc -I$(SRC)/ldscripts -I$(SRC)/MDRlib \
	-I$(SRC)/periph/inc -I$(SRC)/periph/src -I$(SRC)/system -I$(SRC)/startup 
CFLAGS	 += -I$(NEWLIB_PATH)	
CFLAGS   += -DKHZ=8000 -DF_CPU=8000000
CFLAGS   += -DKHZ_CLKIN=8000

LDFLAGS  = -nostdlib -nostartfiles -ffreestanding -Wl,--gc-sections -T $(LDS)/mem.ld -T $(LDS)/sections.ld
LIBS     = -L$(TARGET) -lgcc -lc -specs=nosys.specs -lnosys

all:
#	$(CC) -c $(CFLAGS) -o $(PROG_NAME).o main.c
	$(CXX) -c -std=c++98 $(CFLAGS) -o $(PROG_NAME).o    main.c
	$(CC) -c $(CFLAGS) -o core_cm3.o $(CORECM3).c
	$(CC) -c $(CFLAGS) -o system.o $(SYSSRC).c
	$(CC) -c $(CFLAGS) -o startup.o $(STARTUP).S
	$(CXX) $(LDFLAGS) $(LIBS) system.o core_cm3.o startup.o $(PROG_NAME).o -o $(PROG_NAME).elf
	$(OBJCOPY) -O ihex $(PROG_NAME).elf $(PROG_NAME).hex
	$(SIZE) $(PROG_NAME).elf $(PROG_NAME).hex
	$(OBJDUMP) -D -S $(PROG_NAME).elf > dump_elf.asm

clean:
	rm startup.o system.o core_cm3.o
#	rm main.o

