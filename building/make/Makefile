TARGET = $(CURDIR)

PROG_NAME = test

ARCH = cortex-m3
TOOLS_PATH = /usr/bin
TOOLS_PREFIX = arm-none-eabi-
TOOLS_VERSION = 4.9.2
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

SRC	= $(TARGET)/../src
STARTUP  = $(SRC)/startup/startup_MDR32F9Qx
SYSSRC	= $(SRC)/system/system_MDR32F9Qx
CORECM3 = $(SRC)/cmsis/core_cm3
LDS = $(SRC)/ldscripts
OBJS = $(SRC)/objs

CFLAGS   = -O1 -mcpu=$(ARCH) -mthumb -g -fsigned-char -msoft-float -DARM1986_BE9 -DARM_CORTEX_M3 \
   -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables \
   -ffunction-sections -fdata-sections \
	-I$(SRC)/cmsis -I$(SRC)/inc -I$(SRC)/ldscripts -I$(SRC)/MDRlib \
	-I$(SRC)/periph/inc -I$(SRC)/periph/src -I$(SRC)/system -I$(SRC)/startup 
CFLAGS	 += -I$(NEWLIB_PATH)	
CFLAGS   += -DKHZ=8000 -DF_CPU=8000000
CFLAGS   += -DKHZ_CLKIN=8000
CFLAGS	+= -I/usr/arm-none-eabi/include/
CFLAGS	+= -I$(SRC)/../mila/

LDFLAGS  = -nostdlib -nostartfiles -ffreestanding -Wl,--gc-sections -T $(LDS)/sections.ld
LIBS     = -L$(TARGET) -lgcc -lc -specs=nosys.specs -lnosys

all:
#	$(CC) -c $(CFLAGS) -o $(PROG_NAME).o $(PROG_NAME).c
	$(CXX) -c -std=c++98 $(CFLAGS) -o $(OBJS)/$(PROG_NAME).o ../$(PROG_NAME).c
	$(CXX) -c -std=c++98 $(CFLAGS) -o $(OBJS)/main.o ../mila/main.c
	$(CC) -c $(CFLAGS) -o $(OBJS)/core_cm3.o $(CORECM3).c
	$(CC) -c $(CFLAGS) -o $(OBJS)/system.o $(SYSSRC).c
	$(AS) -c $(CFLAGS) -o $(OBJS)/startup.o $(STARTUP).S
#	$(AS) -c $(CFLAGS) -o $(OBJS)/stubstart.o $(SRC)/startup/stubstart.S

	$(CXX) $(LDFLAGS) $(LIBS) $(OBJS)/test.o $(OBJS)/system.o $(OBJS)/startup.o $(OBJS)/core_cm3.o $(OBJS)/main.o -o ../$(PROG_NAME).elf

	$(OBJCOPY) -O ihex ../$(PROG_NAME).elf ../$(PROG_NAME).hex
	$(SIZE) ../$(PROG_NAME).elf ../$(PROG_NAME).hex
#	$(OBJDUMP) -D -S $(PROG_NAME).elf > dump_elf.asm

clean:
	rm $(PROG_NAME).elf $(PROG_NAME).hex
#	rm main.o

