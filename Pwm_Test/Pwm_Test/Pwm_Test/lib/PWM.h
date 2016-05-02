//*****************************************************************************
//*****************************************************************************
//  FILENAME: PWM.h
//   Version: 2.5, Updated on 2015/3/4 at 22:26:51
//  Generated by PSoC Designer 5.4.3191
//
//  DESCRIPTION: PWM16 User Module C Language interface file
//-----------------------------------------------------------------------------
//  Copyright (c) Cypress Semiconductor 2015. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************
#ifndef PWM_INCLUDE
#define PWM_INCLUDE

#include <m8c.h>

#pragma fastcall16 PWM_EnableInt
#pragma fastcall16 PWM_DisableInt
#pragma fastcall16 PWM_Start
#pragma fastcall16 PWM_Stop
#pragma fastcall16 PWM_wReadCounter              // Read  DR0
#pragma fastcall16 PWM_WritePeriod               // Write DR1
#pragma fastcall16 PWM_wReadPulseWidth           // Read  DR2
#pragma fastcall16 PWM_WritePulseWidth           // Write DR2

// The following symbols are deprecated.
// They may be omitted in future releases
//
#pragma fastcall16 wPWM_ReadCounter              // Read  DR0 (Deprecated)
#pragma fastcall16 wPWM_ReadPulseWidth           // Read  DR2 (Deprecated)


//-------------------------------------------------
// Prototypes of the PWM API.
//-------------------------------------------------

extern void PWM_EnableInt(void);                  // Proxy Class 1
extern void PWM_DisableInt(void);                 // Proxy Class 1
extern void PWM_Start(void);                      // Proxy Class 1
extern void PWM_Stop(void);                       // Proxy Class 1
extern WORD PWM_wReadCounter(void);               // Proxy Class 2
extern void PWM_WritePeriod(WORD wPeriod);        // Proxy Class 1
extern WORD PWM_wReadPulseWidth(void);            // Proxy Class 1
extern void PWM_WritePulseWidth(WORD wPulseWidth);// Proxy Class 1

// The following functions are deprecated.
// They may be omitted in future releases
//
extern WORD wPWM_ReadCounter(void);            // Deprecated
extern WORD wPWM_ReadPulseWidth(void);         // Deprecated


//-------------------------------------------------
// Constants for PWM API's.
//-------------------------------------------------

#define PWM_CONTROL_REG_START_BIT              ( 0x01 )
#define PWM_INT_REG_ADDR                       ( 0x0e1 )
#define PWM_INT_MASK                           ( 0x02 )


//--------------------------------------------------
// Constants for PWM user defined values
//--------------------------------------------------

#define PWM_PERIOD                             ( 0x0 )
#define PWM_PULSE_WIDTH                        ( 0x0 )


//-------------------------------------------------
// Register Addresses for PWM
//-------------------------------------------------

#pragma ioport  PWM_COUNTER_LSB_REG:    0x020              //DR0 Count register LSB
BYTE            PWM_COUNTER_LSB_REG;
#pragma ioport  PWM_COUNTER_MSB_REG:    0x024              //DR0 Count register MSB
BYTE            PWM_COUNTER_MSB_REG;
#pragma ioport  PWM_PERIOD_LSB_REG: 0x021                  //DR1 Period register LSB
BYTE            PWM_PERIOD_LSB_REG;
#pragma ioport  PWM_PERIOD_MSB_REG: 0x025                  //DR1 Period register MSB
BYTE            PWM_PERIOD_MSB_REG;
#pragma ioport  PWM_COMPARE_LSB_REG:    0x022              //DR2 Compare register LSB
BYTE            PWM_COMPARE_LSB_REG;
#pragma ioport  PWM_COMPARE_MSB_REG:    0x026              //DR2 Compare register MSB
BYTE            PWM_COMPARE_MSB_REG;
#pragma ioport  PWM_CONTROL_LSB_REG:    0x023              //Control register LSB
BYTE            PWM_CONTROL_LSB_REG;
#pragma ioport  PWM_CONTROL_MSB_REG:    0x027              //Control register MSB
BYTE            PWM_CONTROL_MSB_REG;
#pragma ioport  PWM_FUNC_LSB_REG:   0x120                  //Function register LSB
BYTE            PWM_FUNC_LSB_REG;
#pragma ioport  PWM_FUNC_MSB_REG:   0x124                  //Function register MSB
BYTE            PWM_FUNC_MSB_REG;
#pragma ioport  PWM_INPUT_LSB_REG:  0x121                  //Input register LSB
BYTE            PWM_INPUT_LSB_REG;
#pragma ioport  PWM_INPUT_MSB_REG:  0x125                  //Input register MSB
BYTE            PWM_INPUT_MSB_REG;
#pragma ioport  PWM_OUTPUT_LSB_REG: 0x122                  //Output register LSB
BYTE            PWM_OUTPUT_LSB_REG;
#pragma ioport  PWM_OUTPUT_MSB_REG: 0x126                  //Output register MSB
BYTE            PWM_OUTPUT_MSB_REG;
#pragma ioport  PWM_INT_REG:       0x0e1                   //Interrupt Mask Register
BYTE            PWM_INT_REG;


//-------------------------------------------------
// PWM Macro 'Functions'
//-------------------------------------------------

#define PWM_Start_M \
   ( PWM_CONTROL_LSB_REG |=  PWM_CONTROL_REG_START_BIT )

#define PWM_Stop_M  \
   ( PWM_CONTROL_LSB_REG &= ~PWM_CONTROL_REG_START_BIT )

#define PWM_EnableInt_M   \
   M8C_EnableIntMask(  PWM_INT_REG, PWM_INT_MASK )

#define PWM_DisableInt_M  \
   M8C_DisableIntMask( PWM_INT_REG, PWM_INT_MASK )

#endif
// end of file PWM.h