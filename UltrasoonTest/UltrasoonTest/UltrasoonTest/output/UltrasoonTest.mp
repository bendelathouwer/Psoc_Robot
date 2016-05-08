Project:      output/UltrasoonTest
Build Number: 0
Date:         Sun May 08 21:08:01 2016
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   0099 =    153. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01AD  LoadConfigTBL_ultrasoontest_Bank0
       0208  LoadConfigTBL_ultrasoontest_Bank1
       0239  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   0239   0002 =      2. bytes (rel,con,rom,proclab)

       Addr  Global Symbol
      -----  --------------------------------
       0239  __func_lit_start
       023B  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   023B   0170 =    368. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       023B  LoadConfigTBL_ultrasoontest_Ordered
       0340  LoadConfigInit
       0340  _LoadConfigInit
       0350  LoadConfig_ultrasoontest
       0350  _LoadConfig_ultrasoontest
       03AB  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   03AB   02F3 =    755. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       03AB  _Timer_ISR
       03AF  Timer_EnableInt
       03AF  _Timer_EnableInt
       03B3  Timer_DisableInt
       03B3  _Timer_DisableInt
       03B7  _Timer_Start
       03B7  Timer_Start
       03BB  Timer_Stop
       03BB  _Timer_Stop
       03BF  _Timer_WritePeriod
       03BF  Timer_WritePeriod
       03C5  Timer_WriteCompareValue
       03C5  _Timer_WriteCompareValue
       03CB  _Timer_wReadCompareValue
       03CB  wTimer_ReadCompareValue
       03CB  _wTimer_ReadCompareValue
       03CB  Timer_wReadCompareValue
       03D1  wTimer_ReadTimerSaveCV
       03D1  Timer_wReadTimerSaveCV
       03D1  _Timer_wReadTimerSaveCV
       03D1  _wTimer_ReadCounter
       03D1  wTimer_ReadCounter
       03D1  _wTimer_ReadTimerSaveCV
       0407  wTimer_CaptureCounter
       0407  _wTimer_CaptureCounter
       0407  _Timer_wReadTimer
       0407  _wTimer_ReadTimer
       0407  wTimer_ReadTimer
       0407  Timer_wReadTimer
       040F  _LCD_PrCString
       040F  LCD_PrCString
       0421  LCD_HEX_STR
       0431  LCD_PrHexByte
       0431  _LCD_PrHexByte
       0444  LCD_PrHexInt
       0444  _LCD_PrHexInt
       044B  _LCD_PrString
       044B  LCD_PrString
       045D  LCD_Write_Data
       045D  LCD_WriteData
       045D  _LCD_WriteData
       045D  _LCD_Write_Data
       0471  _LCD_Control
       0471  LCD_Control
       0521  _LCD_Init
       0521  LCD_Start
       0521  _LCD_Start
       0521  LCD_Init
       0590  LCD_ROW_OFFSET
       0594  LCD_Position
       0594  _LCD_Position
       05A4  LCD_Delay50uTimes
       05A4  _LCD_Delay50uTimes
       05AA  LCD_Delay50u_Table
       05B2  _LCD_Delay50u
       05B2  LCD_Delay50u
       05C6  _LCD_DrawBG
       05F7  _LCD_DrawVBG
       062B  LCD_InitVBG
       062B  _LCD_InitVBG
       065C  LCD_BG_TYPE1
       0663  LCD_BG_TYPE2
       066A  _LCD_InitBG
       066A  LCD_InitBG
       069E  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   069E   0159 =    345. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       069E  __text_start
       069E  _main
       06EF  _TimerCaptureISR
       07DE  _TrigUltrasoonSensor
       07F7  __xidata_start
       07F7  __text_end
       07FD  __xidata_end

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
                            data   0000   0007 =      7. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       0012  _CaptureNegEdge
       0014  _PulseWidth
       0016  _CapturePosEdge
       0018  _Flags

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
obj/main.o	[ main.c ]
<library>	[ timerint.asm, timer.asm, psocconfigtbl.asm, psocconfig.asm, lcd.asm, rZ.asm, rY.asm, rX.asm, r11.asm ]
[ r10.asm, r9.asm, r8.asm, r7.asm, r6.asm, r5.asm, r4.asm, r3.asm, r2.asm, r1.asm, r0.asm ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0x3
-Bultrasoontest_RAM	allocated at: 0
-rwh:SSCParmBlk:0xf7.0xff

