//*****************************************************************************
//*****************************************************************************
//  FILENAME: Timer2.h
//   Version: 2.6, Updated on 2015/3/4 at 22:27:47
//  Generated by PSoC Designer 5.4.3191
//
//  DESCRIPTION: Timer16 User Module C Language interface file
//-----------------------------------------------------------------------------
//  Copyright (c) Cypress Semiconductor 2015. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************
#ifndef Timer2_INCLUDE
#define Timer2_INCLUDE

#include <m8c.h>

#pragma fastcall16 Timer2_EnableInt
#pragma fastcall16 Timer2_DisableInt
#pragma fastcall16 Timer2_Start
#pragma fastcall16 Timer2_Stop
#pragma fastcall16 Timer2_wReadTimer                // Read  DR0
#pragma fastcall16 Timer2_wReadTimerSaveCV          // Read  DR0      
#pragma fastcall16 Timer2_WritePeriod               // Write DR1
#pragma fastcall16 Timer2_wReadCompareValue         // Read  DR2
#pragma fastcall16 Timer2_WriteCompareValue         // Write DR2

// The following symbols are deprecated.
// They may be omitted in future releases
//
#pragma fastcall16 wTimer2_ReadCounter              // Read  DR0 "Obsolete"
#pragma fastcall16 wTimer2_CaptureCounter           // Read  DR0 "Obsolete"
#pragma fastcall16 wTimer2_ReadTimer                // Read  DR0 (Deprecated)
#pragma fastcall16 wTimer2_ReadTimerSaveCV          // Read  DR0 (Deprecated)
#pragma fastcall16 wTimer2_ReadCompareValue         // Read  DR2 (Deprecated)


//-------------------------------------------------
// Prototypes of the Timer2 API.
//-------------------------------------------------

extern void Timer2_EnableInt(void);                           // Proxy 1
extern void Timer2_DisableInt(void);                          // Proxy 1
extern void Timer2_Start(void);                               // Proxy 1
extern void Timer2_Stop(void);                                // Proxy 1
extern WORD Timer2_wReadTimer(void);                          // Proxy 1
extern WORD Timer2_wReadTimerSaveCV(void);                    // Proxy 2
extern void Timer2_WritePeriod(WORD wPeriod);                 // Proxy 1
extern WORD Timer2_wReadCompareValue(void);                   // Proxy 1
extern void Timer2_WriteCompareValue(WORD wCompareValue);     // Proxy 1

// The following functions are deprecated.
// They may be omitted in future releases
//
extern WORD wTimer2_ReadCompareValue(void);       // Deprecated
extern WORD wTimer2_ReadTimerSaveCV(void);        // Deprecated
extern WORD wTimer2_ReadCounter(void);            // Obsolete
extern WORD wTimer2_ReadTimer(void);              // Deprecated
extern WORD wTimer2_CaptureCounter(void);         // Obsolete


//--------------------------------------------------
// Constants for Timer2 API's.
//--------------------------------------------------

#define Timer2_CONTROL_REG_START_BIT           ( 0x01 )
#define Timer2_INT_REG_ADDR                    ( 0x0e1 )
#define Timer2_INT_MASK                        ( 0x08 )


//--------------------------------------------------
// Constants for Timer2 user defined values
//--------------------------------------------------

#define Timer2_PERIOD                          ( 0xffff )
#define Timer2_COMPARE_VALUE                   ( 0x0 )


//-------------------------------------------------
// Register Addresses for Timer2
//-------------------------------------------------

#pragma ioport  Timer2_COUNTER_LSB_REG: 0x028              //Count register LSB
BYTE            Timer2_COUNTER_LSB_REG;
#pragma ioport  Timer2_COUNTER_MSB_REG: 0x02c              //Count register MSB
BYTE            Timer2_COUNTER_MSB_REG;
#pragma ioport  Timer2_PERIOD_LSB_REG:  0x029              //Period register LSB
BYTE            Timer2_PERIOD_LSB_REG;
#pragma ioport  Timer2_PERIOD_MSB_REG:  0x02d              //Period register MSB
BYTE            Timer2_PERIOD_MSB_REG;
#pragma ioport  Timer2_COMPARE_LSB_REG: 0x02a              //Compare register LSB
BYTE            Timer2_COMPARE_LSB_REG;
#pragma ioport  Timer2_COMPARE_MSB_REG: 0x02e              //Compare register MSB
BYTE            Timer2_COMPARE_MSB_REG;
#pragma ioport  Timer2_CONTROL_LSB_REG: 0x02b              //Control register LSB
BYTE            Timer2_CONTROL_LSB_REG;
#pragma ioport  Timer2_CONTROL_MSB_REG: 0x02f              //Control register MSB
BYTE            Timer2_CONTROL_MSB_REG;
#pragma ioport  Timer2_FUNC_LSB_REG:    0x128              //Function register LSB
BYTE            Timer2_FUNC_LSB_REG;
#pragma ioport  Timer2_FUNC_MSB_REG:    0x12c              //Function register MSB
BYTE            Timer2_FUNC_MSB_REG;
#pragma ioport  Timer2_INPUT_LSB_REG:   0x129              //Input register LSB
BYTE            Timer2_INPUT_LSB_REG;
#pragma ioport  Timer2_INPUT_MSB_REG:   0x12d              //Input register MSB
BYTE            Timer2_INPUT_MSB_REG;
#pragma ioport  Timer2_OUTPUT_LSB_REG:  0x12a              //Output register LSB
BYTE            Timer2_OUTPUT_LSB_REG;
#pragma ioport  Timer2_OUTPUT_MSB_REG:  0x12e              //Output register MSB
BYTE            Timer2_OUTPUT_MSB_REG;
#pragma ioport  Timer2_INT_REG:       0x0e1                //Interrupt Mask Register
BYTE            Timer2_INT_REG;


//-------------------------------------------------
// Timer2 Macro 'Functions'
//-------------------------------------------------

#define Timer2_Start_M \
   ( Timer2_CONTROL_LSB_REG |=  Timer2_CONTROL_REG_START_BIT )

#define Timer2_Stop_M  \
   ( Timer2_CONTROL_LSB_REG &= ~Timer2_CONTROL_REG_START_BIT )

#define Timer2_EnableInt_M   \
   M8C_EnableIntMask(  Timer2_INT_REG, Timer2_INT_MASK )

#define Timer2_DisableInt_M  \
   M8C_DisableIntMask( Timer2_INT_REG, Timer2_INT_MASK )

#endif
// end of file Timer2.h