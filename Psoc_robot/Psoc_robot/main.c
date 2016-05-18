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
//		Timer1:				`			  For reading one joystick channel aileron puls with 
//      Clock 							   VC2
//      Period                             65535
//      CompareValue                       0
//      CompareType                        Less than or equal to
//      Conected to port                   Port_0_0


//  	Timer2:				`			  For reading one joystick channel 	elevation puls with 1
//      Clock 							   VC2
//      Period                             65535
//      CompareValue                       0
//      CompareType                        Less than or equal to
//      Conected to port                   Port_0_1
//  	
//      Timer3:				`			  For reading the  ultrasonic sensor
//      Clock 							   VC2
//      Period                             65535
//      CompareValue                       0
//      CompareType                        Less than or equal to
//      Conected to port                   Port_0_2
//		
//		
//    Pwm conected to port                 Port_0_4
//    PWM:								   For controlling one motor on one side
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

#include <m8c.h>        // part specific constants and macros
#include <math.h>      
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules

#define DEBUG_LCD 1

//volatile BOOL ultrasoonInitDone;//dit gedaan om compiler te verplichten waarde terug in te lezen (Caching tegen te gaan )

#define MAX_POWER 1000
#define MIN_POWER 0

//
#define DATA_AVAILABLE_AILERON 0x01//staat in de eerste bit van de flag 
#define FALLING_EDGE_AILERON 0x02 // staat in de 2de bit van de flag 
WORD CapturePosEdgeAileron;
WORD CaptureNegEdgeAileron;
WORD PulseWidthAileron;
BYTE FlagsAileron;
#define MARGIN_AILERON 2
#define MIN_AILERON 0x60
#define CENTER_AILERON 0x8C
#define MAX_AILERON 0xB9

// 
#define DATA_AVAILABLE_ELEVATOR 0x01 // new for motorcontroll2
#define FALLING_EDGE_ELEVATOR 0x02    // new for motorcontroll2
WORD CapturePosEdgeElevator;
WORD CaptureNegEdgeElevator;
WORD PulseWidthElevator;
BYTE FlagsElevator;
#define MARGIN_ELEVATOR 2
#define MIN_ELEVATOR 0x60
#define CENTER_ELEVATOR 0x8C
#define MAX_ELEVATOR 0xB9

// for timer 3 and ultrasoon sensor 1
#define DATA_AVAILABLE_ULTRASOON 0x01 
#define FALLING_EDGE_ULTRASOON 0x02    
#define MIN_SAFE_DISTANCE  0x50


WORD CapturePosEdgeUltrasoon;
WORD CaptureNegEdgeUltrasoon;
WORD PulseWidthUltrasoon;
BYTE FlagUltrasoon;

void ultrasoonSensor(void);//long ultrasoon sensor(void);

#pragma interrupt_handler Timer1CaptureISR
#pragma interrupt_handler Timer2CaptureISR
#pragma interrupt_handler Timer3CaptureISR


BOOL Within(WORD value, WORD border, WORD margin)
{
	WORD lower = border - margin;
	WORD upper = border + margin;
	
	if (value >= lower
	&&  value <= upper)
		return TRUE;
	else
		return FALSE;
}

// normalization function for Aileron (Timer1)
float EvaluateAileron(DWORD value)
{	
	// Check if pulsewidth data is available
	if(FlagsAileron & DATA_AVAILABLE_AILERON)
	{
#if (DEBUG_LCD)
		LCD_Position(0,0);
		LCD_PrHexInt(value);
#endif	
		// stick in center 
		if (Within(value, CENTER_AILERON, MARGIN_AILERON))
		{
#if (DEBUG_LCD)
			LCD_Position(0,5);
			LCD_PrCString("C");
#endif		
			return 0;
		}
		else if (value < CENTER_AILERON) // stick left
		{
#if (DEBUG_LCD)
			LCD_Position(0,5);
			LCD_PrCString("L");
#endif	
			return ((float)value - CENTER_AILERON) / (float)(MAX_AILERON - CENTER_AILERON);
		}
		else if (value > CENTER_AILERON) // stick right
		{			
#if (DEBUG_LCD)
			LCD_Position(0,5);
			LCD_PrCString("R");
#endif			
			return -(CENTER_AILERON - (float)value) / (float)(CENTER_AILERON - MIN_AILERON);
		}
		
		// action finished, clear flag to avoid doing it again
		FlagsAileron &= ~DATA_AVAILABLE_AILERON;
	}
	
	return 0;
}
// normalization function for Elevator(Timer2)
float EvaluateElevator(DWORD value)
{
	// Check if pulsewidth data is available
	if(FlagsElevator & DATA_AVAILABLE_ELEVATOR)
	{
#if (DEBUG_LCD)
		LCD_Position(1,0);
		LCD_PrHexInt(value);
#endif 	
		// stick in center 
		if (Within(value, CENTER_ELEVATOR, MARGIN_ELEVATOR))
		{
#if (DEBUG_LCD)
			LCD_Position(1,5);
			LCD_PrCString("C");
#endif 	
			return 0;
		}
		else if (value > CENTER_ELEVATOR) // stick up
		{
#if (DEBUG_LCD)
			LCD_Position(1,5);
			LCD_PrCString("U");
#endif			
			return ((float)value - CENTER_ELEVATOR) / (float)(MAX_ELEVATOR - CENTER_ELEVATOR);
		}
		else if (value < CENTER_ELEVATOR) // stick down
		{			
#if (DEBUG_LCD)
			LCD_Position(1,5);
			LCD_PrCString("D");
#endif			
			return -(CENTER_ELEVATOR - (float)value) / (float)(CENTER_ELEVATOR - MIN_ELEVATOR);
		}
		
		// action finished, clear flag to avoid doing it again
		FlagsElevator &= ~DATA_AVAILABLE_ELEVATOR;
	}
	
	return 0;
}

void TriggerUltrasoon(void)
{
	PRT1DR |= 0x10;// setting p1[4]
    asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	PRT1DR &= ~0x10;// clearing   P1[4]
}

float EvaluateUltrasoonSensor(void)//(Timer3)
{
	if (FlagUltrasoon & DATA_AVAILABLE_ULTRASOON)// do if databit is set 
    {    
		WORD pulseWidthUltrasoon = PulseWidthUltrasoon;

#if (DEBUG_LCD)
		LCD_Position(1,12);
		LCD_PrHexInt(pulseWidthUltrasoon);
#endif
		FlagUltrasoon &= ~DATA_AVAILABLE_ULTRASOON;
		
		// als meting gebeurt is trigger sensor opnieuw en we disablen timer1
		TriggerUltrasoon();	
		
		return pulseWidthUltrasoon;
    }  
	
	return MIN_SAFE_DISTANCE + 1;
}

void main(void)
{
	// Enable Global Interrupt   
	M8C_EnableGInt;

	// Clear the flags
	FlagsElevator = 0;
	FlagsAileron = 0;// new for motorcontroll2
	FlagUltrasoon = 0;

	// Start timers and enable interrupt
	Timer1_Start();
	Timer1_EnableInt();

	Timer2_Start();// new for motorcontroll2
	Timer2_EnableInt();// new for motorcontroll2

	Timer3_Start();
	Timer3_EnableInt();
   
	TriggerUltrasoon();	

	// Init motors
	PWM1_Start();
	PWM2_Start();

#if (DEBUG_LCD)
	LCD_Start();
#endif  
	
	while (TRUE)
	{
		float aileronNormalized,
			  elevatorNormalized;
		float distance;
		float speed, direction;
		float motorLeft, motorRight;
		BOOL forward;
		
		aileronNormalized = EvaluateAileron(PulseWidthAileron);
		direction  = fabs(aileronNormalized);

		elevatorNormalized = EvaluateElevator(PulseWidthElevator);
		speed  = fabs(elevatorNormalized);
		forward = (elevatorNormalized >= 0);
		
		distance = EvaluateUltrasoonSensor();
		if (distance < MIN_SAFE_DISTANCE)
		{
			if (forward)
				speed = 0;
		}
		
		motorLeft  = speed; // default is straight forward
		motorRight = speed;
		
		if (aileronNormalized < 0) // turning left
		{
			motorRight = speed;
			motorLeft  = speed * (1 - direction);
		}
		else if (aileronNormalized > 0) // turning right
		{
			motorLeft  = speed;
			motorRight = speed * (1 - direction);
		}
				
		if (forward)
		{
			// ccw
			PRT1DR |=  0x08; // AIN1
			PRT1DR &= ~0x02; // AIN2
			
			PRT1DR |=  0x20; // BIN1
			PRT1DR &= ~0x80; // BIN2
		}
		else 
		{
			//cw
			PRT1DR &= ~0x08; // AIN1
			PRT1DR |=  0x02; // AIN2
			
			PRT1DR &= ~0x20; // BIN1
			PRT1DR |=  0x80; // BIN2
		}
	
		// Denormalize to Engine
		motorLeft *= (MAX_POWER - MIN_POWER);
		motorLeft += MIN_POWER;
		motorRight *= (MAX_POWER - MIN_POWER);
		motorRight += MIN_POWER;

		PWM1_WritePulseWidth(motorLeft);
		PWM2_WritePulseWidth(motorRight);

#if (DEBUG_LCD)
		LCD_Position(0,7);
		LCD_PrHexInt(motorLeft);
		LCD_Position(1,7);
		LCD_PrHexInt(motorRight);
		
		LCD_Position(0,12);
		LCD_PrCString(forward ? "F" : "B");
#endif 	

   }
}

void Timer1CaptureISR(void)
{
   if (FlagsAileron & FALLING_EDGE_AILERON)
   {
      // Read the count on negative edge
      CaptureNegEdgeAileron = Timer1_wReadCompareValue();

      // Change the capture to positive edge and clear the FALLING_EDGE flag
      Timer1_FUNC_LSB_REG &= ~0x80;
      FlagsAileron &= ~FALLING_EDGE_AILERON;

      // Calculate the pulswidth by finding difference between positive edge
      // and negative edge counts.  As both the numbers are unsigned numbers
      // the result will be correct even if there is an underflow in the counter
      // The result will be accurate as long as the total pulsewidth is less than
      // 65535 timer ticks.
      PulseWidthAileron = CapturePosEdgeAileron - CaptureNegEdgeAileron;
      
      // Set the Data available flag
      FlagsAileron |= DATA_AVAILABLE_AILERON;
   }
   else
   {
      // Read the count on positive edge
      CapturePosEdgeAileron = Timer1_wReadCompareValue();
      
      // Change the capture to negative edge and set flag
      Timer1_FUNC_LSB_REG |= 0x80;
      FlagsAileron |= FALLING_EDGE_AILERON;
   }
}

void Timer2CaptureISR(void)// new function for motorcontroll2
{
	if(FlagsElevator & FALLING_EDGE_ELEVATOR)//
	{
		// Read the count on negative edge
		CaptureNegEdgeElevator = Timer2_wReadCompareValue();

		// Change the capture to positive edge and clear the FALLING_EDGE flag
		Timer2_FUNC_LSB_REG &= ~0x80;
		FlagsElevator &= ~FALLING_EDGE_ELEVATOR;// clearing faling edge bit in flags
	

		// Calculate the pulswidth by finding difference between positive edge
		// and negative edge counts.  As both the numbers are unsigned numbers
		// the result will be correct even if there is an underflow in the counter
		// The result will be accurate as long as the total pulsewidth is less than
		// 65535 timer ticks.
		PulseWidthElevator = CapturePosEdgeElevator - CaptureNegEdgeElevator;

		// Set the Data available flag
		FlagsElevator |= DATA_AVAILABLE_ELEVATOR; // BEN: set the correct bit on or off
	}
	else
	{
		// Read the count on positive edge
		CapturePosEdgeElevator = Timer2_wReadCompareValue();

		// Change the capture to negative edge and set flag
		Timer2_FUNC_LSB_REG |= 0x80;
		FlagsElevator |= FALLING_EDGE_ELEVATOR;
	}
}

void Timer3CaptureISR(void)
{	
   if(FlagUltrasoon & FALLING_EDGE_ULTRASOON)
   {
      // Read the count on negative edge
      CaptureNegEdgeUltrasoon = Timer3_wReadCompareValue();

      // Change the capture to positive edge and clear the FALLING_EDGE flag
      Timer3_FUNC_LSB_REG &= ~0x80;
      FlagUltrasoon &= ~FALLING_EDGE_ULTRASOON;

      // Calculate the pulswidth by finding difference between positive edge
      // and negative edge counts.  As both the numbers are unsigned numbers
      // the result will be correct even if there is an underflow in the counter
      // The result will be accurate as long as the total pulsewidth is less than
      // 65535 timer ticks.
      PulseWidthUltrasoon = CapturePosEdgeUltrasoon - CaptureNegEdgeUltrasoon;

      // Set the Data available flag
      FlagUltrasoon |= DATA_AVAILABLE_ULTRASOON;
   }
   else
   {
      // Read the count on positive edge
      CapturePosEdgeUltrasoon = Timer3_wReadCompareValue();
      
      // Change the capture to negative edge and set flag
      Timer3_FUNC_LSB_REG |= 0x80;
      FlagUltrasoon |= FALLING_EDGE_ULTRASOON;
   }
}


