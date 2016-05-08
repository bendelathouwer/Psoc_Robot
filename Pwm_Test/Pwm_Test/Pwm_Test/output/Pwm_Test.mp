Project:      output/Pwm_Test
Build Number: 0
Date:         Sun May 08 14:08:46 2016
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
                     psoc_config   022E   0170 =    368. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       022E  LoadConfigTBL_pwm_test_Ordered
       0333  LoadConfigInit
       0333  _LoadConfigInit
       0343  LoadConfig_pwm_test
       0343  _LoadConfig_pwm_test
       039E  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   039E   005D =     93. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       039E  _PWM_ISR
       039F  PWM_EnableInt
       039F  _PWM_EnableInt
       03A3  _PWM_DisableInt
       03A3  PWM_DisableInt
       03A7  _PWM_Start
       03A7  PWM_Start
       03AB  _PWM_Stop
       03AB  PWM_Stop
       03AF  PWM_WritePeriod
       03AF  _PWM_WritePeriod
       03B5  _PWM_WritePulseWidth
       03B5  PWM_WritePulseWidth
       03BB  PWM_wReadPulseWidth
       03BB  wPWM_ReadPulseWidth
       03BB  _PWM_wReadPulseWidth
       03BB  _wPWM_ReadPulseWidth
       03C1  PWM_wReadCounter
       03C1  _wPWM_ReadCounter
       03C1  _PWM_wReadCounter
       03C1  wPWM_ReadCounter
       03FB  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   03FB   0050 =     80. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       03FB  __text_start
       03FB  Delay10msTimes
       03FB  _Delay10msTimes
       0408  Delay50uTimes
       0408  _Delay50uTimes
       040E  Delay50u_Table
       0416  Delay50u
       0416  _Delay50u
       042A  _main
       044B  __xidata_start
       044B  __text_end
       044D  __xidata_end

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
                    InterruptRAM   0000   0003 =      3. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  _NO_SHADOW
       0000  Port_2_Data_SHADE
       0000  NO_SHADOW
       0000  _Port_2_Data_SHADE
       0001  _Port_2_DriveMode_0_SHADE
       0001  Port_2_DriveMode_0_SHADE
       0002  _Port_2_DriveMode_1_SHADE
       0002  Port_2_DriveMode_1_SHADE

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0003   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0003  __r1
       0004  __r0

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
obj/delay.o	[ delay.asm ]
obj/main.o	[ main.c ]
<library>	[ pwmint.asm, pwm.asm, psocconfigtbl.asm, psocconfig.asm, r1.asm, r0.asm ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0x3
-Bpwm_test_RAM	allocated at: 0
-rwh:SSCParmBlk:0xf7.0xff

