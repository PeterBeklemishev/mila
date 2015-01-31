PROG_NAME 	= 	usercode

TARGET 		= 	$(CURDIR)
ARCH 		= 	cortex-m3
TOOLS_PATH 	= 	/usr/bin
TOOLS_PREFIX 	= 	arm-none-eabi-
TOOLS_VERSION 	= 	4.8.2

CC		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)gcc -Wall
CXX		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)g++ -Wall
AS		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)gcc -x assembler-with-cpp
SIZE		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)size
AR		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)ar
OBJDUMP		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)objdump --disassembler-options=force-thumb
OBJCOPY		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)objcopy

SRC 		= 	$(TARGET)/../src
MDR_PATH 	= 	$(SRC)/MDR
MILA_PATH 	= 	$(SRC)/mila
STARTUP  	= 	$(MDR_PATH)/startup/startup_MDR32F9Qx
SYSSRC		= 	$(MDR_PATH)/system/system_MDR32F9Qx
CORECM3 	= 	$(MDR_PATH)/cmsis/core_cm3
LDS 		= 	$(MDR_PATH)/ldscripts
OBJS 		= 	$(MDR_PATH)/objs

CFLAGS   = -O1 -mcpu=$(ARCH) -mthumb -g -fsigned-char -msoft-float -DARM1986_BE9 -DARM_CORTEX_M3 \
	-fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables \
	-ffunction-sections -fdata-sections \
	-I$(MDR_PATH)/cmsis -I$(MDR_PATH)/inc -I$(MDR_PATH)/ldscripts -I$(MDR_PATH)/MDRlib \
	-I$(MDR_PATH)/periph/inc -I$(MDR_PATH)/periph/src -I$(MDR_PATH)/system -I$(MDR_PATH)/startup \
	-I$(MILA_PATH)
CFLAGS   += -DKHZ=8000 -DF_CPU=8000000
CFLAGS   += -DKHZ_CLKIN=8000

LDFLAGS  = -nostdlib -nostartfiles -ffreestanding -Wl,--gc-sections -T $(LDS)/sections.ld
LIBS     = -L$(TARGET) -lgcc -lc -lnosys

all:
	$(CC) -c $(CFLAGS) -o $(OBJS)/core_cm3.o $(CORECM3).c
	$(CC) -c $(CFLAGS) -o $(OBJS)/system.o $(SYSSRC).c
	$(AS) -c $(CFLAGS) -o $(OBJS)/startup.o $(STARTUP).S
	$(CC) -c $(CFLAGS) -o $(OBJS)/timers.o $(MILA_PATH)/timers.c
	$(CC) -c $(CFLAGS) -o $(OBJS)/gpio.o $(MILA_PATH)/gpio.c
	$(CC) -c $(CFLAGS) -o $(OBJS)/milasrv.o $(MILA_PATH)/milasrv.c
	$(CC) -c $(CFLAGS) -o $(OBJS)/$(PROG_NAME).o $(TARGET)/$(PROG_NAME).c
	$(CC) -c $(CFLAGS) -o $(OBJS)/main.o $(SRC)/mila/main.c

	$(CXX) $(LDFLAGS) $(LIBS) $(OBJS)/$(PROG_NAME).o $(OBJS)/timers.o $(OBJS)/gpio.o $(OBJS)/milasrv.o \
		$(OBJS)/system.o $(OBJS)/startup.o $(OBJS)/core_cm3.o $(OBJS)/main.o -o $(TARGET)/$(PROG_NAME).elf

	$(OBJCOPY) -O ihex $(TARGET)/$(PROG_NAME).elf $(TARGET)/$(PROG_NAME).hex
	$(SIZE) $(TARGET)/$(PROG_NAME).elf $(TARGET)/$(PROG_NAME).hex
	$(OBJDUMP) -d $(PROG_NAME).elf > $(PROG_NAME).dump

clean:
	rm $(PROG_NAME).elf $(PROG_NAME).hex $(PROG_NAME).dump
