TARGET = $(CURDIR)
PROG_NAME = second


ARCH = cortex-m3
#BINDIR   = I:/arm/gcc48/bin
TOOLS_PATH = /sbin
TOOLS_PREFIX = arm-none-eabi
TOOLS_VERSION = 4.9.2

CC		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)gcc-$(TOOLS_VERSION)
CXX		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)g++
AS		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)as
SIZE		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)size
AR		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)ar
SIZE		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)size
OBJDUMP		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)objdump --disassembler-options=force-thumb
OBJCOPY		=	$(TOOLS_PATH)/$(TOOLS_PREFIX)objcopy

CFLAGS   = -O1 -mcpu=cortex-m3 -mthumb -g -fsigned-char -msoft-float -DARM1986_BE9 -DARM_CORTEX_M3 \
   -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables \
   -ffunction-sections -fdata-sections \
      -I"I:\Mcucpp\mcucpp" \
      -I"I:\Mcucpp\mcucpp\ARM\CortexM3" \
      -I"I:\Mcucpp\mcucpp\ARM\MDR32Fx" \
      -I"I:\arm\MdrStdLib\Libraries\CMSIS\CM3\CoreSupport" \
      -I"I:\arm\MdrStdLib\Libraries\CMSIS\CM3\DeviceSupport\MDR32F9Qx\startup\gcc" \
      -I"I:\arm\MdrStdLib\Libraries\CMSIS\CM3\DeviceSupport\MDR32F9Qx\inc" \
      -I"I:\arm\gcc480\arm-none-eabi\include" \
      -I"..\src"
CFLAGS   += -DKHZ=8000 -DF_CPU=8000000
CFLAGS   += -DKHZ_CLKIN=8000

LDFLAGS  = -nostdlib -nostartfiles -ffreestanding -Wl,--gc-sections -T $(TARGET)/src/ldscripts/mem.ld -T $(TARGET)/src/ldscripts/sections.ld

LIBS     = -L$(TARGET) -lgcc


SRC	= $(TARGET)/src
STARTUP  = $(TARGET)/src/startup/startup_MDR32F9Qx.S
SYSSRC	= $(SRC)/system/system_MDR32F9Qx

# -fno-builtin без inline'ов
# -march=armv7-m
# -g отладочная

#CFLAGS   += -print-search-dirs
#DEPFLAGS = -MT $@ -MD -MP -MF .deps/$*.dep
#LDFLAGS  = -nostdlib -T $(TARGET)/ldscript.x


DEFINE   = EVALBOARD  

all:
#   $(CXX) -c -std=c++98 $(CFLAGS) -o main.o    ../src/main.c
#   $(CC) -c $(CFLAGS) -o core_cm3.o    core_cm3.c
   $(CC) -c $(CFLAGS) -o $(SYSSRC).o    $(SYSSRC).c
   $(CC) -c $(CFLAGS) -o startup.o $(STARTUP)
#   $(CXX) -c -std=c++98 $(CFLAGS) -o GlcdTestMdr.o    ../src/GlcdTestMdr.cpp
#   $(CXX) -c -std=c++98 $(CFLAGS) -o demo.o           ../common/demo.cpp
#   $(CXX) -c -std=c++98 $(CFLAGS) -o resources.o      ../common/resources.cpp
#   $(CXX) -c -std=c++98 $(CFLAGS) -o main.o    ../src/main.c

   $(CXX) $(LDFLAGS) $(LIBS) startup.o $(SYSSRC).o $(PROG_NAME).o resources.o -o $(PROG_NAME).elf

   $(OBJCOPY) -O ihex $(PROG_NAME).elf $(PROG_NAME).hex

   $(SIZE) $(PROG_NAME).elf $(PROG_NAME).hex

   $(OBJDUMP) -D -S .\$(PROG_NAME).elf > .\dump_elf.asm
#   $(CC) -E $(CFLAGS) -o pre_board.c   uac_board.c

clean:
   del main.o uac.elf uac.srec


