//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules

#define PWM_PERIOD1     999
//#define PWM_Width1   332

void main(void)
{
	int t;
	// M8C_EnableGInt ; // Uncomment this line to enable Global Interrupts
	while (1)
	{
		for(t=0 ;t<1000;t++)
		{
			//PWM_Stop();
		    PWM_WritePeriod(PWM_PERIOD1);
			PWM_WritePulseWidth(t);  // Set pulse width to generate a 33%                                             //duty cycle
			PWM_Start();
   			
		}	
		
	}
}
