Project:      output/Pwm_Test
Build Number: 0
Date:         Mon May 16 15:45:02 2016
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   00A4 =    164. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01A0  LoadConfigTBL_pwm_test_Bank0
       0207  LoadConfigTBL_pwm_test_Bank1
       0244  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   0244   0002 =      2. bytes (rel,con,rom,proclab)

       Addr  Global Symbol
      -----  --------------------------------
       0244  __func_lit_start
       0246  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   0246   0167 =    359. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0246  LoadConfigTBL_pwm_test_Ordered
       034B  LoadConfigInit
       034B  _LoadConfigInit
       0352  LoadConfig_pwm_test
       0352  _LoadConfig_pwm_test
       03AD  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   03AD   00BA =    186. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       03AD  _PWM_ISR
       03AE  _PWM2_ISR
       03AF  PWM2_EnableInt
       03AF  _PWM2_EnableInt
       03B3  _PWM2_DisableInt
       03B3  PWM2_DisableInt
       03B7  PWM2_Start
       03B7  _PWM2_Start
       03BB  PWM2_Stop
       03BB  _PWM2_Stop
       03BF  _PWM2_WritePeriod
       03BF  PWM2_WritePeriod
       03C5  PWM2_WritePulseWidth
       03C5  _PWM2_WritePulseWidth
       03CB  _wPWM2_ReadPulseWidth
       03CB  PWM2_wReadPulseWidth
       03CB  wPWM2_ReadPulseWidth
       03CB  _PWM2_wReadPulseWidth
       03D1  wPWM2_ReadCounter
       03D1  PWM2_wReadCounter
       03D1  _PWM2_wReadCounter
       03D1  _wPWM2_ReadCounter
       040B  PWM_EnableInt
       040B  _PWM_EnableInt
       040F  _PWM_DisableInt
       040F  PWM_DisableInt
       0413  PWM_Start
       0413  _PWM_Start
       0417  _PWM_Stop
       0417  PWM_Stop
       041B  PWM_WritePeriod
       041B  _PWM_WritePeriod
       0421  _PWM_WritePulseWidth
       0421  PWM_WritePulseWidth
       0427  _PWM_wReadPulseWidth
       0427  _wPWM_ReadPulseWidth
       0427  PWM_wReadPulseWidth
       0427  wPWM_ReadPulseWidth
       042D  PWM_wReadCounter
       042D  _PWM_wReadCounter
       042D  _wPWM_ReadCounter
       042D  wPWM_ReadCounter
       0467  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0467   00C5 =    197. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0467  Delay10msTimes
       0467  _Delay10msTimes
       0467  __text_start
       0474  _Delay50uTimes
       0474  Delay50uTimes
       047A  Delay50u_Table
       0482  _Delay50u
       0482  Delay50u
       0496  _SetBitInByte
       04EA  _main
       052C  __xidata_start
       052C  __text_end
       052E  __xidata_end

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
<library>	[ pwmint.asm, pwm2int.asm, pwm2.asm, pwm.asm, psocconfigtbl.asm, psocconfig.asm, r1.asm, r0.asm ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0
-Bpwm_test_RAM	allocated at: 0
-rwh:SSCParmBlk:0xf7.0xff

