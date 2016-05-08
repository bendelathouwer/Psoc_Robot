
#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules

#define DATA_AVAILABLE 0x01
#define FALLING_EDGE 0x02

WORD CapturePosEdge;
WORD CaptureNegEdge;
WORD PulseWidth;
BYTE Flags;

void TrigUltrasoonSensor(void );

#pragma interrupt_handler TimerCaptureISR

void main(void)
{
	// Enable Global Interrupt   
	M8C_EnableGInt;

	// Clear the flags
	Flags = 0;

	// Start timer and enable interrupt
	Timer_Start();
	Timer_EnableInt();

	// Start LCD and PWM.  The PWM generates a test signal

	LCD_Start();
	
	TrigUltrasoonSensor();

	while(1)
	{
		// Check if pulsewidth data is available
		if(Flags & DATA_AVAILABLE)
		{
			// Print the pulsewidth on the LCD
			LCD_Position(1,1);
			LCD_PrCString("Sensor werkt");
			LCD_Position(0,0);
			LCD_PrHexInt(PulseWidth);

			Flags &= ~DATA_AVAILABLE;

			TrigUltrasoonSensor();

		}
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

void TrigUltrasoonSensor(void )
{
	
		PRT1DR |= 0x01;// setting pin1[0]
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
		PRT1DR &= ~0x01;// clearing  pin P1[0]
	
}