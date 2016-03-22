//****************************************************************************
//*****************************************************************************
//  FILENAME: main.c
//   Made for project 2 in the second semester of school
//
//  DESCRIPTION: Main file of the Psoc_robot project.
//
//-----------------------------------------------------------------------------
// 
//*****************************************************************************
//*****************************************************************************
////***************************************************************************************

//------------------------------------------------------------------------------
// Name: Psoc_robot
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// For Device: CY8C29466
//------------------------------------------------------------------------------
// Required Software:  PSoC Designer 5.3

// Project Settings: 
//      
//      Power Setting [Vcc/SysClk Freq]:  5.0V/24MHz
//      CPU Clock:                        Sysclk/1  
//      VC1                               Sysclk/12
//      VC2                               VC1/2 = Sysclk/24
//      
//		Timer:				`			  For reading one joystick channel 	
//      Clock 							   VC2
//      Period                             65535
//      CompareValue                       0
//      CompareType                        Less than or equal to
//      Conected to port                   Port_0_0
//  	Timer2:				`			  For reading one joystick channel 	
//      Clock 							   VC2
//      Period                             65535
//      CompareValue                       0
//      CompareType                        Less than or equal to
//      Conected to port                   Port_0_1
//  	Timer3:				`			  For reading one joystick channel 	
//      Clock 							   VC2
//      Period                             65535
//      CompareValue                       0
//      CompareType                        Less than or equal to
//      Conected to port                   Port_0_3
//		
//		
//    Pwm conected to port                 Port_0_4
//    PWM:								   For contrlling one motor on one side
//      Clock                              VC2
//      Enable                             High
//      Period                             1000
//      PulseWidth                         0
//      CompareType                        Less than 
//      Interrupt Type                     Terminal count
//      LCD:
//      LCDPort                            Port_2
//      
//---------------------------------------------------------------------------------
//   Hardware Connections
// Connect P0.1 to P0.2 and press reset.
// You should note the Value of Pulse Width on the LCD.
//
//---------------------------------------------------------------------------------

#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules

// for timer 1 and motorcontrol 1
#define DATA_AVAILABLE 0x01
#define FALLING_EDGE 0x02
WORD CapturePosEdge;
WORD CaptureNegEdge;
WORD PulseWidth;
BYTE Flags;

// for timer 2 and motor controll 2
#define DATA_AVAILABLE2 0x01 // new for motorcontroll2
#define FALLING_EDGE2 0x02    // new for motorcontroll2
WORD CapturePosEdge2;// new for motorcontroll2
WORD CaptureNegEdge2;// new for motorcontroll2
WORD PulseWidth2;// new for motorcontroll2
BYTE Flags2;// new for motorcontroll2

// for timer 3 and ultrasoon sensor 1
#define DATA_AVAILABLE3 0x01 
#define FALLING_EDGE3 0x02    
WORD CapturePosEdge3;
WORD CaptureNegEdge3;
WORD PulseWidth3;
BYTE Flags3;


void motorControll1(void);
void motorControll2(void);
long ultrasoonSensor(void);


#pragma interrupt_handler TimerCaptureISR// for motorcontroll2
#pragma interrupt_handler Timer2CaptureISR// new for motorcontroll2
#pragma interupt_handler  Timer3CaptureISR// for ultrasoon sensor 


void main(void)
{
   // Enable Global Interrupt   
   M8C_EnableGInt;
   
   // Clear the flags
   Flags = 0;
   Flags2 = 0;// new for motorcontroll2
  
	// Start timer and enable interrupt
   Timer_Start();
   Timer2_Start();// new for motorcontroll2
   Timer_EnableInt();
   Timer2_EnableInt();// new for motorcontroll2
   Timer3_Start();
   Timer_EnableInt();
   
	
   LCD_Start();
	PRT1DR = 0x80;// wat is dit ?
   while(1)
   {
	motorControll1();
    motorControll2();
	ultrasoonSensor();
   }
}

void TimerCaptureISR(void)
{
   if(Flags & FALLING_EDGE)
   {
      // Read the count on negative edge
      CaptureNegEdge = Timer_wReadCompareValue();

      // Change the capture to positive edge and clear the FALLING_EDGE flag
      Timer_FUNC_LSB_REG &= ~0x80;
      Flags &= ~FALLING_EDGE;

      // Calculate the pulswidth by finding difference between positive edge
      // and negative edge counts.  As both the numbers are unsigned numbers
      // the result will be correct even if there is an underflow in the counter
      // The result will be accurate as long as the total pulsewidth is less than
      // 65535 timer ticks.
      PulseWidth = CapturePosEdge - CaptureNegEdge;
      
      // Set the Data available flag
      Flags |= DATA_AVAILABLE;
   }
   else
   {
      // Read the count on positive edge
      CapturePosEdge = Timer_wReadCompareValue();
      
      // Change the capture to negative edge and set flag
      Timer_FUNC_LSB_REG |= 0x80;
      Flags |= FALLING_EDGE;
   }
}

void Timer2CaptureISR(void)// new function for motorcontroll2
{
	 if(Flags2 & FALLING_EDGE2)
   {
      // Read the count on negative edge
      CaptureNegEdge2 = Timer2_wReadCompareValue();

      // Change the capture to positive edge and clear the FALLING_EDGE flag
      Timer2_FUNC_LSB_REG &= ~0x81;//0x80
      Flags2 &= ~FALLING_EDGE2;

      // Calculate the pulswidth by finding difference between positive edge
      // and negative edge counts.  As both the numbers are unsigned numbers
      // the result will be correct even if there is an underflow in the counter
      // The result will be accurate as long as the total pulsewidth is less than
      // 65535 timer ticks.
      PulseWidth2 = CapturePosEdge2 - CaptureNegEdge2;
      
      // Set the Data available flag
      Flags2 |= DATA_AVAILABLE2;
   }
   else
   {
      // Read the count on positive edge
      CapturePosEdge2 = Timer2_wReadCompareValue();
      
      // Change the capture to negative edge and set flag
      Timer2_FUNC_LSB_REG |= 0x80;//0x80
      Flags2 |= FALLING_EDGE2;
   }
}

void Timer3CaptureISR(void)
{
   if(Flags3 & FALLING_EDGE3)
   {
      // Read the count on negative edge
      CaptureNegEdge3 = Timer3_wReadCompareValue();

      // Change the capture to positive edge and clear the FALLING_EDGE flag
      Timer3_FUNC_LSB_REG &= ~0x80;
      Flags3 &= ~FALLING_EDGE3;

      // Calculate the pulswidth by finding difference between positive edge
      // and negative edge counts.  As both the numbers are unsigned numbers
      // the result will be correct even if there is an underflow in the counter
      // The result will be accurate as long as the total pulsewidth is less than
      // 65535 timer ticks.
      PulseWidth3 = CapturePosEdge3 - CaptureNegEdge3;
      
      // Set the Data available flag
      Flags3 |= DATA_AVAILABLE3;
   }
   else
   {
      // Read the count on positive edge
      CapturePosEdge3 = Timer3_wReadCompareValue();
      
      // Change the capture to negative edge and set flag
      Timer3_FUNC_LSB_REG |= 0x80;
      Flags3 |= FALLING_EDGE3;
   }
}

void motorControll1(void)
{
	 // Check if pulsewidth data is available
      if(Flags & DATA_AVAILABLE)
      {
         // Print the pulsewidth on the LCD
         LCD_Position(0,0);
         LCD_PrHexInt(PulseWidth);
         Flags &= ~DATA_AVAILABLE;
      }
	
}

void motorControll2(void)// new
{
	if(Flags2 & DATA_AVAILABLE2)
      {
         // Print the pulsewidth on the LCD
         LCD_Position(5,0);
         LCD_PrHexInt(PulseWidth2);
         Flags2 &= ~DATA_AVAILABLE2;
      }
	
}


long ultrasoonSensor(void)
{
	if(Flags3 & DATA_AVAILABLE3)
      {
         // Print the pulsewidth on the LCD
         LCD_Position(5,5);
         LCD_PrHexInt(PulseWidth3);
         Flags3 &= ~DATA_AVAILABLE3;
      }
	
}