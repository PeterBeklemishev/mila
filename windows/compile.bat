:: http://en.wikibooks.org/wiki/Windows_Batch_Scripting

@echo off


SET ARCH = cortex-m3
SET "TOOLS_PATH=C:\Program Files (x86)\GNU Tools ARM Embedded\4.9 2014q4"
SET BIN = %TOOLS_PATH%\bin
SET TOOLS_PREFIX = arm-none-eabi
SET GCC = %BIN%\%TOOLS_PREFIX%-gcc
SET SRC = %CD%\..\src
SET MDR_PATH = %SRC%\MDR
SET MILA_PATH = %SRC%\mila

SET pathik=C:\Program Files (x86)\GNU Tools ARM Embedded\4.9 2014q4\bin

SET LDS = %MDR_PATH%\ldscripts
SET CFLAGS = -O1 -mcpu=%ARCH% -mthumb -g -fsigned-char -msoft-float -DARM1986_BE9 -DARM_CORTEX_M3	-fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -ffunction-sections -fdata-sections -I%MDR_PATH%\cmsis -I%MDR_PATH%\inc -I%MDR_PATH%\ldscripts -I%MDR_PATH%\MDRlib -I%MDR_PATH%\periph\inc -I%MDR_PATH%\periph\src -I%MDR_PATH%\system -I%MDR_PATH%\startup -I%MILA_PATH% -DKHZ=8000 -DF_CPU=8000000 -DKHZ_CLKIN=8000

SET LDFLAGS = -nostdlib -nostartfiles -ffreestanding -Wl,--gc-sections -T %LDS%\sections.ld
SET LIBS = -L%CD% -lgcc -lc -lnosys
ECHO %pathik% is here
"%pathik%\arm-none-eabi-gcc.exe" %CFLAGS% usercode.c -Wall
::ECHO Task is complete  %pathik% not
pause