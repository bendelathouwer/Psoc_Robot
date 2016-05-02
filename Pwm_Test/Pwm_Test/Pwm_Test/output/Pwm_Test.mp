Project:      output/Pwm_Test
Build Number: 0
Date:         Mon May 02 11:00:51 2016
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   008C =    140. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01A0  LoadConfigTBL_pwm_test_Bank0
       01FB  LoadConfigTBL_pwm_test_Bank1
       022C  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   022C   0002 =      2. bytes (rel,con,rom,proclab)

       Addr  Global Symbol
      -----  --------------------------------
       022C  __func_lit_start
       022E  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   022E   0167 =    359. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       022E  LoadConfigTBL_pwm_test_Ordered
       0333  LoadConfigInit
       0333  _LoadConfigInit
       033A  LoadConfig_pwm_test
       033A  _LoadConfig_pwm_test
       0395  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   0395   005D =     93. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0395  _PWM_ISR
       0396  PWM_EnableInt
       0396  _PWM_EnableInt
       039A  _PWM_DisableInt
       039A  PWM_DisableInt
       039E  _PWM_Start
       039E  PWM_Start
       03A2  _PWM_Stop
       03A2  PWM_Stop
       03A6  PWM_WritePeriod
       03A6  _PWM_WritePeriod
       03AC  _PWM_WritePulseWidth
       03AC  PWM_WritePulseWidth
       03B2  PWM_wReadPulseWidth
       03B2  wPWM_ReadPulseWidth
       03B2  _PWM_wReadPulseWidth
       03B2  _wPWM_ReadPulseWidth
       03B8  PWM_wReadCounter
       03B8  _wPWM_ReadCounter
       03B8  _PWM_wReadCounter
       03B8  wPWM_ReadCounter
       03F2  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   03F2   006F =    111. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       03F2  __text_start
       03F2  Delay10msTimes
       03F2  _Delay10msTimes
       03FF  Delay50uTimes
       03FF  _Delay50uTimes
       0405  Delay50u_Table
       040D  Delay50u
       040D  _Delay50u
       0421  _main
       0461  __xidata_start
       0461  __text_end
       0463  __xidata_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             TOP   0000   0143 =    323. bytes (abs,ovr,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __Start
       0140  _bGetPowerSetting
       0140  bGetPowerSetting

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0000   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __r1
       0001  __r0

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
obj/delay.o	[ delay.asm ]
obj/main.o	[ main.c ]
<library>	[ pwmint.asm, pwm.asm, psocconfigtbl.asm, psocconfig.asm, r1.asm, r0.asm ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0
-Bpwm_test_RAM	allocated at: 0
-rwh:SSCParmBlk:0xf7.0xff

