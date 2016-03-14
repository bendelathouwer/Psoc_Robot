
#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules

void Motor_Control(void);
 BYTE Current_Fault(void);
#define DATA_AVAILABLE 0x01
#define FALLING_EDGE 0x02

WORD CapturePosEdge;
WORD CaptureNegEdge;
WORD PulseWidth;
WORD PWM_New;
WORD Period;
WORD Current;

BYTE Fault;
BYTE Flags;


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
	  
	PWM_WritePulseWidth(PulseWidth);
	PWM_Start();
  	LCD_Start();
	LCD_Position(1,0);
	LCD_PrCString("Beta Test 0.0");
	PRT1DR = 0x80;
   while(1)
   {
		Motor_Control();
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

BYTE Current_Fault(void)
{
	
}

void Motor_Control(void)
{
	{
      // Check if pulsewidth data is available
      if(Flags & DATA_AVAILABLE)
      {
         // Print the pulsewidth on the LCD
        
		 LCD_Position(0,0);
       // stick to te left  hex 00BF(dec 191 )stick to the right Hex 0073(dec 115) stick midel Hex 009A(dec 154)
		 LCD_PrHexInt(PulseWidth);
         Flags &= ~DATA_AVAILABLE;
		PWM_New = PulseWidth;
		Period = 5100; 
		PWM_WritePeriod(Period);
		PWM_WritePulseWidth(PWM_New);
		PWM_Start();
		 LCD_Position(5,0);
       	 LCD_PrHexInt(PWM_New);
      }
   }
}
	