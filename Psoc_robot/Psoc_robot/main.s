	cpu LMM
	.module main.c
	.area text(rom, con, rel)
	.dbfile ./main.c
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
	.dbfunc e main _main fV
_main::
	.dbline -1
	.dbline 112
; //****************************************************************************
; //*****************************************************************************
; //  FILENAME: main.c
; //   Made for project 2 in the second semester of school
; //
; //  DESCRIPTION: Main file of the Psoc_robot project.
; //
; //-----------------------------------------------------------------------------
; // 
; //*****************************************************************************
; //*****************************************************************************
; ////***************************************************************************************
; 
; //------------------------------------------------------------------------------
; // Name: Psoc_robot
; //------------------------------------------------------------------------------
; //------------------------------------------------------------------------------
; // For Device: CY8C29466
; //------------------------------------------------------------------------------
; // Required Software:  PSoC Designer 5.3
; 
; // Project Settings: 
; //      
; //      Power Setting [Vcc/SysClk Freq]:  5.0V/24MHz
; //      CPU Clock:                        Sysclk/1  
; //      VC1                               Sysclk/12
; //      VC2                               VC1/2 = Sysclk/24
; //      
; //		Timer:				`			  For reading one joystick channel 	
; //      Clock 							   VC2
; //      Period                             65535
; //      CompareValue                       0
; //      CompareType                        Less than or equal to
; //      Conected to port                   Port_0_0
; 
; //  	Timer2:				`			  For reading one joystick channel 	
; //      Clock 							   VC2
; //      Period                             65535
; //      CompareValue                       0
; //      CompareType                        Less than or equal to
; //      Conected to port                   Port_0_1
; //  	
; //      Timer3:				`			  For reading the  ultrasonic sensor
; //      Clock 							   VC2
; //      Period                             65535
; //      CompareValue                       0
; //      CompareTy pe                        Less than or equal to
; //      Conected to port                   Port_0_3
; //		
; //		
; //    Pwm conected to port                 Port_0_4
; //    PWM:								   For controlling one motor on one side
; //      Clock                              VC2
; //      Enable                             High
; //      Period                             1000
; //      PulseWidth                         0
; //      CompareType                        Less than 
; //      Interrupt Type                     Terminal count
; //      LCD:
; //      LCDPort                            Port_2
; //      
; //---------------------------------------------------------------------------------
; //   Hardware Connections
; // Connect P0.1 to P0.2 and press reset.
; // You should note the Value of Pulse Width on the LCD.
; //
; //---------------------------------------------------------------------------------
; 
; #include <m8c.h>        // part specific constants and macros
; #include "PSoCAPI.h"    // PSoC API definitions for all User Modules
; 
; 
; 
; // for timer 1 and motorcontrol 1
; #define DATA_AVAILABLE 0x01//staat in de eerste bit van de flag 
; #define FALLING_EDGE 0x02 // staat in de 2de bit van de flag 
; WORD CapturePosEdge;
; WORD CaptureNegEdge;
; WORD PulseWidth;
; BYTE Flags;
; 
; 
; volatile BOOL done;//dit gedaan om compiler te verplichten waarde terug in te lezen (Caching tegen te gaan )
; 
; // for timer 2 and motor controll 2
; #define DATA_AVAILABLE2 0x01 // new for motorcontroll2
; #define FALLING_EDGE2 0x02    // new for motorcontroll2
; WORD CapturePosEdge2;// new for motorcontroll2
; WORD CaptureNegEdge2;// new for motorcontroll2
; WORD PulseWidth2;// new for motorcontroll2
; BYTE Flags2;
; 
; // for timer 3 and ultrasoon sensor 1
; #define DATA_AVAILABLE3 0x01 
; #define FALLING_EDGE3 0x02    
; #define Set_Distance  50;
; 
; WORD CapturePosEdge3;
; WORD CaptureNegEdge3;
; WORD PulseWidth3;
; BYTE Flags3;
; 
; void motorControll1(void);
; void motorController(void);
; void ultrasoonSensor(void);//long ultrasoon sensor(void);
;  
; #pragma interrupt_handler TimerCaptureISR// for motorcontroll2
; #pragma interrupt_handler Timer2CaptureISR// new for motorcontroll2
; #pragma interrupt_handler Timer3CaptureISR
; 
; void main(void)
; {
	.dbline 114
;    // Enable Global Interrupt   
;    M8C_EnableGInt;
		or  F, 01h

	.dbline 117
;    
;    // Clear the flags
;    Flags = 0;
	mov REG[0xd0],>_Flags
	mov [_Flags],0
	.dbline 118
;    Flags2 = 0;// new for motorcontroll2
	mov REG[0xd0],>_Flags2
	mov [_Flags2],0
	.dbline 119
;    Flags3 = 0;
	mov REG[0xd0],>_Flags3
	mov [_Flags3],0
	.dbline 121
;    // Start timers and enable interrupt
;    Timer_Start();
	push X
	xcall _Timer_Start
	.dbline 122
;    Timer_EnableInt();
	xcall _Timer_EnableInt
	.dbline 124
;    
;    Timer2_Start();// new for motorcontroll2
	xcall _Timer2_Start
	.dbline 125
;    Timer2_EnableInt();// new for motorcontroll2
	xcall _Timer2_EnableInt
	.dbline 127
;   
;    Timer3_Start();
	xcall _Timer3_Start
	.dbline 128
;    Timer3_EnableInt();
	xcall _Timer3_EnableInt
	.dbline 130
;    
;    PWM1_Start();	
	xcall _PWM1_Start
	.dbline 131
;    PWM2_Start();
	xcall _PWM2_Start
	.dbline 132
;    LCD_Start();
	xcall _LCD_Start
	pop X
	.dbline 134
;    
; 	PRT1DR = 0x80;
	mov REG[0x4],-128
	xjmp L3
L2:
	.dbline 137
; 
;    while(1)
;    {
	.dbline 139
; 	//long OutputDistance = ultrasoonSensor(); 
; 	motorControll1();//OutputDistance
	xcall _motorControll1
	.dbline 140
;     motorControll2();//OutputDistance
	xcall _motorControll2
	.dbline 141
; 	ultrasoonSensor();
	xcall _ultrasoonSensor
	.dbline 142
;    }
L3:
	.dbline 136
	xjmp L2
X0:
	.dbline -2
L1:
	.dbline 0 ; func end
	jmp .
	.dbend
	.dbfunc e TimerCaptureISR _TimerCaptureISR fV
_TimerCaptureISR::
	.dbline -1
	or F,-64
	push A
	mov A,REG[0xd0]
	push A
	mov A,REG[0xd3]
	push A
	mov A,REG[0xd4]
	push A
	mov A,REG[0xd5]
	push A
	mov REG[0xd0],>__r0
	mov A,[__r0]
	push A
	mov A,[__r1]
	push A
	mov A,[__r2]
	push A
	mov A,[__r3]
	push A
	mov A,[__r4]
	push A
	mov A,[__r5]
	push A
	mov A,[__r6]
	push A
	mov A,[__r7]
	push A
	mov A,[__r8]
	push A
	mov A,[__r9]
	push A
	mov A,[__r10]
	push A
	mov A,[__r11]
	push A
	mov A,[__rX]
	push A
	mov A,[__rY]
	push A
	mov A,[__rZ]
	push A
	.dbline 146
; }
; 
; void TimerCaptureISR(void)
; {
	.dbline 147
;    if(Flags & FALLING_EDGE)
	mov REG[0xd0],>_Flags
	tst [_Flags],2
	jz L6
	.dbline 150
;    {
;       // Read the count on negative edge
;       CaptureNegEdge = Timer_wReadCompareValue();
	.dbline 150
	push X
	xcall _Timer_wReadCompareValue
	mov REG[0xd0],>__r0
	mov [__r0],X
	pop X
	push A
	mov A,[__r0]
	mov REG[0xd0],>_CaptureNegEdge
	mov [_CaptureNegEdge],A
	pop A
	mov [_CaptureNegEdge+1],A
	.dbline 153
; 
;       // Change the capture to positive edge and clear the FALLING_EDGE flag
;       Timer_FUNC_LSB_REG &= ~0x80;
	or F,0x10  ; iopage = 1
	and REG[0x20],127
	.dbline 154
;       Flags &= ~FALLING_EDGE;
	and F,0xCF	; iopage = 0
	mov REG[0xd0],>_Flags
	and [_Flags],-3
	.dbline 161
; 
;       // Calculate the pulswidth by finding difference between positive edge
;       // and negative edge counts.  As both the numbers are unsigned numbers
;       // the result will be correct even if there is an underflow in the counter
;       // The result will be accurate as long as the total pulsewidth is less than
;       // 65535 timer ticks.
;       PulseWidth = CapturePosEdge - CaptureNegEdge;
	mov REG[0xd0],>_CapturePosEdge
	mov A,[_CapturePosEdge+1]
	mov REG[0xd0],>_CaptureNegEdge
	sub A,[_CaptureNegEdge+1]
	mov REG[0xd0],>_PulseWidth
	mov [_PulseWidth+1],A
	mov REG[0xd0],>_CapturePosEdge
	mov A,[_CapturePosEdge]
	mov REG[0xd0],>_CaptureNegEdge
	sbb A,[_CaptureNegEdge]
	mov REG[0xd0],>_PulseWidth
	mov [_PulseWidth],A
	.dbline 164
;       
;       // Set the Data available flag
;       Flags |= DATA_AVAILABLE;
	mov REG[0xd0],>_Flags
	or [_Flags],1
	.dbline 165
;    }
	xjmp L7
L6:
	.dbline 167
;    else
;    {
	.dbline 169
;       // Read the count on positive edge
;       CapturePosEdge = Timer_wReadCompareValue();
	push X
	xcall _Timer_wReadCompareValue
	mov REG[0xd0],>__r0
	mov [__r0],X
	pop X
	push A
	mov A,[__r0]
	mov REG[0xd0],>_CapturePosEdge
	mov [_CapturePosEdge],A
	pop A
	mov [_CapturePosEdge+1],A
	.dbline 172
;       
;       // Change the capture to negative edge and set flag
;       Timer_FUNC_LSB_REG |= 0x80;
	or F,0x10  ; iopage = 1
	or REG[0x20],-128
	.dbline 173
;       Flags |= FALLING_EDGE;
	and F,0xCF	; iopage = 0
	mov REG[0xd0],>_Flags
	or [_Flags],2
	.dbline 174
;    }
L7:
	.dbline -2
L5:
	mov REG[0xD0],>__r0
	pop A
	mov [__rZ],A
	pop A
	mov [__rY],A
	pop A
	mov [__rX],A
	pop A
	mov [__r11],A
	pop A
	mov [__r10],A
	pop A
	mov [__r9],A
	pop A
	mov [__r8],A
	pop A
	mov [__r7],A
	pop A
	mov [__r6],A
	pop A
	mov [__r5],A
	pop A
	mov [__r4],A
	pop A
	mov [__r3],A
	pop A
	mov [__r2],A
	pop A
	mov [__r1],A
	pop A
	mov [__r0],A
	pop A
	mov REG[213],A
	pop A
	mov REG[212],A
	pop A
	mov REG[211],A
	pop A
	mov REG[208],A
	pop A
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e Timer2CaptureISR _Timer2CaptureISR fV
_Timer2CaptureISR::
	.dbline -1
	or F,-64
	push A
	mov A,REG[0xd0]
	push A
	mov A,REG[0xd3]
	push A
	mov A,REG[0xd4]
	push A
	mov A,REG[0xd5]
	push A
	mov REG[0xd0],>__r0
	mov A,[__r0]
	push A
	mov A,[__r1]
	push A
	mov A,[__r2]
	push A
	mov A,[__r3]
	push A
	mov A,[__r4]
	push A
	mov A,[__r5]
	push A
	mov A,[__r6]
	push A
	mov A,[__r7]
	push A
	mov A,[__r8]
	push A
	mov A,[__r9]
	push A
	mov A,[__r10]
	push A
	mov A,[__r11]
	push A
	mov A,[__rX]
	push A
	mov A,[__rY]
	push A
	mov A,[__rZ]
	push A
	.dbline 178
; }
; 
; void Timer2CaptureISR(void)// new function for motorcontroll2
; {
	.dbline 179
; 	 if(Flags2 & FALLING_EDGE)//
	mov REG[0xd0],>_Flags2
	tst [_Flags2],2
	jz L9
	.dbline 182
;    {
;       // Read the count on negative edge
;       CaptureNegEdge2 = Timer2_wReadCompareValue();
	.dbline 182
	push X
	xcall _Timer2_wReadCompareValue
	mov REG[0xd0],>__r0
	mov [__r0],X
	pop X
	push A
	mov A,[__r0]
	mov REG[0xd0],>_CaptureNegEdge2
	mov [_CaptureNegEdge2],A
	pop A
	mov [_CaptureNegEdge2+1],A
	.dbline 185
; 
;       // Change the capture to positive edge and clear the FALLING_EDGE flag
;       Timer2_FUNC_LSB_REG &= ~0x80;
	or F,0x10  ; iopage = 1
	and REG[0x28],127
	.dbline 186
;       Flags2 &= ~FALLING_EDGE2;// clearing faling edge bit in flags
	and F,0xCF	; iopage = 0
	mov REG[0xd0],>_Flags2
	and [_Flags2],-3
	.dbline 194
; 	
; 
;       // Calculate the pulswidth by finding difference between positive edge
;       // and negative edge counts.  As both the numbers are unsigned numbers
;       // the result will be correct even if there is an underflow in the counter
;       // The result will be accurate as long as the total pulsewidth is less than
;       // 65535 timer ticks.
;       PulseWidth2 = CapturePosEdge2 - CaptureNegEdge2;
	mov REG[0xd0],>_CapturePosEdge2
	mov A,[_CapturePosEdge2+1]
	mov REG[0xd0],>_CaptureNegEdge2
	sub A,[_CaptureNegEdge2+1]
	mov REG[0xd0],>_PulseWidth2
	mov [_PulseWidth2+1],A
	mov REG[0xd0],>_CapturePosEdge2
	mov A,[_CapturePosEdge2]
	mov REG[0xd0],>_CaptureNegEdge2
	sbb A,[_CaptureNegEdge2]
	mov REG[0xd0],>_PulseWidth2
	mov [_PulseWidth2],A
	.dbline 197
;       
;       // Set the Data available flag
;       Flags2 |= DATA_AVAILABLE2;
	mov REG[0xd0],>_Flags2
	or [_Flags2],1
	.dbline 198
;    }
	xjmp L10
L9:
	.dbline 200
;    else
;    {
	.dbline 202
;       // Read the count on positive edge
;       CapturePosEdge2 = Timer2_wReadCompareValue();
	push X
	xcall _Timer2_wReadCompareValue
	mov REG[0xd0],>__r0
	mov [__r0],X
	pop X
	push A
	mov A,[__r0]
	mov REG[0xd0],>_CapturePosEdge2
	mov [_CapturePosEdge2],A
	pop A
	mov [_CapturePosEdge2+1],A
	.dbline 205
;       
;       // Change the capture to negative edge and set flag
;       Timer2_FUNC_LSB_REG |= 0x80;//0x80
	or F,0x10  ; iopage = 1
	or REG[0x28],-128
	.dbline 206
;       Flags2 |= FALLING_EDGE2;
	and F,0xCF	; iopage = 0
	mov REG[0xd0],>_Flags2
	or [_Flags2],2
	.dbline 207
;    }
L10:
	.dbline -2
L8:
	mov REG[0xD0],>__r0
	pop A
	mov [__rZ],A
	pop A
	mov [__rY],A
	pop A
	mov [__rX],A
	pop A
	mov [__r11],A
	pop A
	mov [__r10],A
	pop A
	mov [__r9],A
	pop A
	mov [__r8],A
	pop A
	mov [__r7],A
	pop A
	mov [__r6],A
	pop A
	mov [__r5],A
	pop A
	mov [__r4],A
	pop A
	mov [__r3],A
	pop A
	mov [__r2],A
	pop A
	mov [__r1],A
	pop A
	mov [__r0],A
	pop A
	mov REG[213],A
	pop A
	mov REG[212],A
	pop A
	mov REG[211],A
	pop A
	mov REG[208],A
	pop A
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e Timer3CaptureISR _Timer3CaptureISR fV
_Timer3CaptureISR::
	.dbline -1
	or F,-64
	push A
	mov A,REG[0xd0]
	push A
	mov A,REG[0xd3]
	push A
	mov A,REG[0xd4]
	push A
	mov A,REG[0xd5]
	push A
	mov REG[0xd0],>__r0
	mov A,[__r0]
	push A
	mov A,[__r1]
	push A
	mov A,[__r2]
	push A
	mov A,[__r3]
	push A
	mov A,[__r4]
	push A
	mov A,[__r5]
	push A
	mov A,[__r6]
	push A
	mov A,[__r7]
	push A
	mov A,[__r8]
	push A
	mov A,[__r9]
	push A
	mov A,[__r10]
	push A
	mov A,[__r11]
	push A
	mov A,[__rX]
	push A
	mov A,[__rY]
	push A
	mov A,[__rZ]
	push A
	.dbline 211
; }
; 
; void Timer3CaptureISR(void)
; {
	.dbline 212
;    if(Flags3 & FALLING_EDGE3)
	mov REG[0xd0],>_Flags3
	tst [_Flags3],2
	jz L12
	.dbline 215
;    {
;       // Read the count on negative edge
;       CaptureNegEdge3 = Timer3_wReadCompareValue();
	.dbline 215
	push X
	xcall _Timer3_wReadCompareValue
	mov REG[0xd0],>__r0
	mov [__r0],X
	pop X
	push A
	mov A,[__r0]
	mov REG[0xd0],>_CaptureNegEdge3
	mov [_CaptureNegEdge3],A
	pop A
	mov [_CaptureNegEdge3+1],A
	.dbline 218
; 
;       // Change the capture to positive edge and clear the FALLING_EDGE flag
;       Timer3_FUNC_LSB_REG &= ~0x80;
	or F,0x10  ; iopage = 1
	and REG[0x30],127
	.dbline 219
;       Flags3 &= ~FALLING_EDGE3;
	and F,0xCF	; iopage = 0
	mov REG[0xd0],>_Flags3
	and [_Flags3],-3
	.dbline 226
; 
;       // Calculate the pulswidth by finding difference between positive edge
;       // and negative edge counts.  As both the numbers are unsigned numbers
;       // the result will be correct even if there is an underflow in the counter
;       // The result will be accurate as long as the total pulsewidth is less than
;       // 65535 timer ticks.
;       PulseWidth3 = CapturePosEdge3 - CaptureNegEdge3;
	mov REG[0xd0],>_CapturePosEdge3
	mov A,[_CapturePosEdge3+1]
	mov REG[0xd0],>_CaptureNegEdge3
	sub A,[_CaptureNegEdge3+1]
	mov REG[0xd0],>_PulseWidth3
	mov [_PulseWidth3+1],A
	mov REG[0xd0],>_CapturePosEdge3
	mov A,[_CapturePosEdge3]
	mov REG[0xd0],>_CaptureNegEdge3
	sbb A,[_CaptureNegEdge3]
	mov REG[0xd0],>_PulseWidth3
	mov [_PulseWidth3],A
	.dbline 229
;       
;       // Set the Data available flag
;       Flags3 |= DATA_AVAILABLE3;
	mov REG[0xd0],>_Flags3
	or [_Flags3],1
	.dbline 230
; 	  done = TRUE ;// 
	mov REG[0xd0],>_done
	mov [_done],1
	.dbline 231
;    }
	xjmp L13
L12:
	.dbline 233
;    else
;    {
	.dbline 235
;       // Read the count on positive edge
;       CapturePosEdge3 = Timer3_wReadCompareValue();
	push X
	xcall _Timer3_wReadCompareValue
	mov REG[0xd0],>__r0
	mov [__r0],X
	pop X
	push A
	mov A,[__r0]
	mov REG[0xd0],>_CapturePosEdge3
	mov [_CapturePosEdge3],A
	pop A
	mov [_CapturePosEdge3+1],A
	.dbline 238
;       
;       // Change the capture to negative edge and set flag
;       Timer3_FUNC_LSB_REG |= 0x80;
	or F,0x10  ; iopage = 1
	or REG[0x30],-128
	.dbline 239
;       Flags3 |= FALLING_EDGE3;
	and F,0xCF	; iopage = 0
	mov REG[0xd0],>_Flags3
	or [_Flags3],2
	.dbline 240
;    }
L13:
	.dbline -2
L11:
	mov REG[0xD0],>__r0
	pop A
	mov [__rZ],A
	pop A
	mov [__rY],A
	pop A
	mov [__rX],A
	pop A
	mov [__r11],A
	pop A
	mov [__r10],A
	pop A
	mov [__r9],A
	pop A
	mov [__r8],A
	pop A
	mov [__r7],A
	pop A
	mov [__r6],A
	pop A
	mov [__r5],A
	pop A
	mov [__r4],A
	pop A
	mov [__r3],A
	pop A
	mov [__r2],A
	pop A
	mov [__r1],A
	pop A
	mov [__r0],A
	pop A
	mov REG[213],A
	pop A
	mov REG[212],A
	pop A
	mov REG[211],A
	pop A
	mov REG[208],A
	pop A
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e motorControll1 _motorControll1 fV
_motorControll1::
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e motorControll2 _motorControll2 fV
_motorControll2::
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e ultrasoonSensor _ultrasoonSensor fV
_ultrasoonSensor::
	.dbline 0 ; func end
	ret
	.dbend
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_Flags3::
	.byte 0
	.dbsym e Flags3 _Flags3 c
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_PulseWidth3::
	.byte 0,0
	.dbsym e PulseWidth3 _PulseWidth3 i
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_CaptureNegEdge3::
	.byte 0,0
	.dbsym e CaptureNegEdge3 _CaptureNegEdge3 i
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_CapturePosEdge3::
	.byte 0,0
	.dbsym e CapturePosEdge3 _CapturePosEdge3 i
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_Flags2::
	.byte 0
	.dbsym e Flags2 _Flags2 c
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_PulseWidth2::
	.byte 0,0
	.dbsym e PulseWidth2 _PulseWidth2 i
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_CaptureNegEdge2::
	.byte 0,0
	.dbsym e CaptureNegEdge2 _CaptureNegEdge2 i
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_CapturePosEdge2::
	.byte 0,0
	.dbsym e CapturePosEdge2 _CapturePosEdge2 i
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_done::
	.byte 0
	.dbsym e done _done c
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_Flags::
	.byte 0
	.dbsym e Flags _Flags c
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_PulseWidth::
	.byte 0,0
	.dbsym e PulseWidth _PulseWidth i
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_CaptureNegEdge::
	.byte 0,0
	.dbsym e CaptureNegEdge _CaptureNegEdge i
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_CapturePosEdge::
	.byte 0,0
	.dbsym e CapturePosEdge _CapturePosEdge i
