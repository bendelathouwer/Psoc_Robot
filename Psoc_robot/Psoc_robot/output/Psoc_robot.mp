Project:      output/Psoc_robot
Build Number: 0
Date:         Sat Mar 12 10:57:21 2016
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   00B2 =    178. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01AE  LoadConfigTBL_psoc_robot_Bank0
       0215  LoadConfigTBL_psoc_robot_Bank1
       0252  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   0252   0002 =      2. bytes (rel,con,rom,proclab)

       Addr  Global Symbol
      -----  --------------------------------
       0252  __func_lit_start
       0254  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   0254   0170 =    368. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0254  LoadConfigTBL_psoc_robot_Ordered
       0359  _LoadConfigInit
       0359  LoadConfigInit
       0369  _LoadConfig_psoc_robot
       0369  LoadConfig_psoc_robot
       03C4  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   03C4   0350 =    848. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       03C4  _Timer_ISR
       03C8  _Timer_EnableInt
       03C8  Timer_EnableInt
       03CC  Timer_DisableInt
       03CC  _Timer_DisableInt
       03D0  Timer_Start
       03D0  _Timer_Start
       03D4  _Timer_Stop
       03D4  Timer_Stop
       03D8  _Timer_WritePeriod
       03D8  Timer_WritePeriod
       03DE  Timer_WriteCompareValue
       03DE  _Timer_WriteCompareValue
       03E4  wTimer_ReadCompareValue
       03E4  Timer_wReadCompareValue
       03E4  _Timer_wReadCompareValue
       03E4  _wTimer_ReadCompareValue
       03EA  _Timer_wReadTimerSaveCV
       03EA  wTimer_ReadCounter
       03EA  _wTimer_ReadCounter
       03EA  Timer_wReadTimerSaveCV
       03EA  wTimer_ReadTimerSaveCV
       03EA  _wTimer_ReadTimerSaveCV
       0420  wTimer_CaptureCounter
       0420  _wTimer_ReadTimer
       0420  _Timer_wReadTimer
       0420  Timer_wReadTimer
       0420  _wTimer_CaptureCounter
       0420  wTimer_ReadTimer
       0428  _PWM_ISR
       0429  PWM_EnableInt
       0429  _PWM_EnableInt
       042D  PWM_DisableInt
       042D  _PWM_DisableInt
       0431  _PWM_Start
       0431  PWM_Start
       0435  _PWM_Stop
       0435  PWM_Stop
       0439  PWM_WritePeriod
       0439  _PWM_WritePeriod
       043F  _PWM_WritePulseWidth
       043F  PWM_WritePulseWidth
       0445  _PWM_wReadPulseWidth
       0445  wPWM_ReadPulseWidth
       0445  PWM_wReadPulseWidth
       0445  _wPWM_ReadPulseWidth
       044B  _wPWM_ReadCounter
       044B  PWM_wReadCounter
       044B  _PWM_wReadCounter
       044B  wPWM_ReadCounter
       0485  _LCD_PrCString
       0485  LCD_PrCString
       0497  LCD_HEX_STR
       04A7  LCD_PrHexByte
       04A7  _LCD_PrHexByte
       04BA  _LCD_PrHexInt
       04BA  LCD_PrHexInt
       04C1  LCD_PrString
       04C1  _LCD_PrString
       04D3  _LCD_Write_Data
       04D3  LCD_Write_Data
       04D3  LCD_WriteData
       04D3  _LCD_WriteData
       04E7  LCD_Control
       04E7  _LCD_Control
       0597  LCD_Start
       0597  _LCD_Start
       0597  LCD_Init
       0597  _LCD_Init
       0606  LCD_ROW_OFFSET
       060A  LCD_Position
       060A  _LCD_Position
       061A  LCD_Delay50uTimes
       061A  _LCD_Delay50uTimes
       0620  LCD_Delay50u_Table
       0628  _LCD_Delay50u
       0628  LCD_Delay50u
       063C  _LCD_DrawBG
       066D  _LCD_DrawVBG
       06A1  LCD_InitVBG
       06A1  _LCD_InitVBG
       06D2  LCD_BG_TYPE1
       06D9  LCD_BG_TYPE2
       06E0  LCD_InitBG
       06E0  _LCD_InitBG
       0714  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0714   0194 =    404. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0714  __text_start
       0714  _main
       07B9  _TimerCaptureISR
       08A8  __xidata_start
       08A8  __text_end
       08AE  __xidata_end

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
               virtual_registers   0003   000F =     15. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0003  __rZ
       0004  __rY
       0005  __rX
       0006  __r11
       0007  __r10
       0008  __r9
       0009  __r8
       000A  __r7
       000B  __r6
       000C  __r5
       000D  __r4
       000E  __r3
       000F  __r2
       0010  __r1
       0011  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   000B =     11. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       0012  _Period
       0014  _PWM_New
       0016  _CaptureNegEdge
       0018  _PulseWidth
       001A  _CapturePosEdge
       001C  _Flags

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
obj/main.o	[ main.c ]
<library>	[ timerint.asm, timer.asm, pwmint.asm, pwm.asm, psocconfigtbl.asm, psocconfig.asm, lcd.asm, rZ.asm ]
[ rY.asm, rX.asm, r11.asm, r10.asm, r9.asm, r8.asm, r7.asm, r6.asm, r5.asm, r4.asm, r3.asm, r2.asm, r1.asm ]
[ r0.asm ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0x3
-Bpsoc_robot_RAM	allocated at: 0
-rwh:SSCParmBlk:0xf7.0xff

