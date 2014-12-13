REM
REM   1986BE91T_DEMO.IDE - command file
REM   Created: Sun Aug 25 23:42:23 2013
 
IF EXIST "Debug\Exe\1986BE91T_DEMO.MCE" DEL "Debug\Exe\1986BE91T_DEMO.MCE" 
IF EXIST "Debug\Exe\1986BE91T_DEMO.HEX" DEL "Debug\Exe\1986BE91T_DEMO.HEX" 
IF EXIST "Debug\Exe\1986BE91T_DEMO.ELF" DEL "Debug\Exe\1986BE91T_DEMO.ELF" 
"C:\Program Files\Phyton CodeMaster-ARM\2_32_00\CMC-ARM\Bin\MCAARM.EXE" @startup_1986BE9x.{1}
"C:\Program Files\Phyton CodeMaster-ARM\2_32_00\CMC-ARM\Bin\MCCARM.EXE" @text.{1}
"C:\Program Files\Phyton CodeMaster-ARM\2_32_00\CMC-ARM\Bin\MCLINK.EXE" @1986BE91T_DEMO.(1)
