SET PATH=C:\devel\Keil\ARM\ARMCC\bin\;C:\Python33\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files\Common Files\Microsoft Shared\Windows Live;C:\Program Files (x86)\Common Files\Microsoft Shared\Windows Live;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Program Files (x86)\EgisTec MyWinLocker\x64;C:\Program Files (x86)\EgisTec MyWinLocker\;C:\Program Files (x86)\Windows Live\Shared;C:\OrCAD\OrCAD_16.0\tools\fet\bin;C:\OrCAD\OrCAD_16.0\tools\pcb\bin;C:\OrCAD\OrCAD_16.0\tools\specctra\bin;C:\OrCAD\OrCAD_16.0\tools\PSpice;C:\OrCAD\OrCAD_16.0\tools\PSpice\Library;C:\OrCAD\OrCAD_16.0\tools\Capture;C:\OrCAD\OrCAD_16.0\tools\bin;C:\Program Files (x86)\MiKTeX 2.9\miktex\bin\;C:\Program Files (x86)\QuickTime\QTSystem\;
SET CPU_TYPE=MDR32F9Q2I
SET CPU_VENDOR=Milandr
SET UV2_TARGET=Target 1
SET CPU_CLOCK=0x007A1200
"C:\devel\Keil\ARM\ARMCC\bin\ArmAsm" --Via ".\startup_mdr32f9x._ia"
"C:\devel\Keil\ARM\ARMCC\bin\ArmCC" --Via ".\main.__i"
"C:\devel\Keil\ARM\ARMCC\bin\ArmCC" --Via ".\system_mdr32f9x.__i"
"C:\devel\Keil\ARM\ARMCC\bin\ArmLink" --Via ".\blink.lnp"
C:\devel\Keil\ARM\ARMCC\bin\fromelf.exe ".\blink.axf" --i32combined --output ".\blink.hex"
