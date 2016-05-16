//----------------------------------------------------------------------------
// FILENAME: main.c
//
// DESCRIPTION:
//
//  This sample shows how to create a 33% duty cycle output pulse. 
//
// OVERVIEW:
//
//  The PWM output can be routed to any pin. 
//  In this example the PWM output is routed to P0[4]. 
//  The pin P0[4] has the 33% duty cycle output pulse with frequency = 1,5 kHz.
//
//	The following changes need to be made to the default settings in the Device Editor:
//
//   1. Select PWM16 user module.
//   2. The User Module will occupy the space in dedicated system resources.
//   3. Rename User Module's instance name to PWM16.
//   4. Set PWM16's Clock Parameter to VC1.
//   5. Set PWM16's Enable Parameter to High.
//   6. Set PWM16's CompareOut Parameter to Row_0_Output_0.
//   7. Set PWM16's CompareType Parameter to Less Than Or Equal.
//   8. Set PWM16's ClockSync Parameter to SyncSysClk.
//   9. Click on Row_0_Output_0 and connect Row_0_Output_0 to GlobalOutEven_4.
//   10.Select GlobalOutEven_4 for P0[4] in the Pinout.
//
// CONFIGURATION DETAILS:
//
//  1. The clock selected should be 1000 times the required period.
//  2. The UM's instance name must be shortened to PWM16.
//
// PROJECT SETTINGS:
//
//     IMO setting (SysClk)  = 24MHz       System clock is set to 24MHz
//     VC1=SysClk/1  = 16 (default)
//
// USER MODULE PARAMETER SETTINGS:
//
//  -------------------------------------------------------------------------------
//  UM         Parameter         Value                 Comments 
//  -------------------------------------------------------------------------------
//  PWM16      Name              PWM16                  UM's instance name
//             Clock             VC1
//             Enable            High
//             CompareOut        Row_0_Output_0
//             TerminalCountOut  Row_0_Output_1
//             Period            0                     The Code changes it.
//             PulseWidth        0                     The Code changes it. 
//             CompareType       Less Than Or Equal 
//             InterruptType     Terminal Count
//             ClockSync         SyncSysClk
//                                                    
//  -------------------------------------------------------------------------------
//
/* Code begins here */

#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules
#include "delay.h"
//#define PWM_PERIOD1 	//cte 
#define PWM_PULSEWIDTH1 500//sweetspot]
#define PWM2_PULSEWIDTH2 500//sweetspot

void main(void)
{
	
	//PWM_WritePeriod(PWM_PERIOD1);
	PWM_WritePulseWidth(PWM_PULSEWIDTH1);  
	PWM_Start();
	PWM2_WritePulseWidth(PWM2_PULSEWIDTH2);  
	PWM2_Start();
	while (TRUE)
	{
		//motor1
		PRT2DR &= ~0x80;  // P27 low AIN 1
		PRT2DR |=  0x20;  // P25 high AIN 2
		// motor 2
		PRT1DR &= ~0x10; // P16 low
		PRT1DR |=  0x80; // P17 high

	    Delay10msTimes(100);
		
		// Motor 1
		PRT2DR |=  0x80;  // P27 high
		PRT2DR &= ~ 0x20; // P25 low AIN 2
		// Motor 2
		PRT1DR |=  0x10; // P16 high
	    PRT1DR &= ~0x80; // P17 low
		
		Delay10msTimes(100);
    }
}
