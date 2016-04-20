/******************************************************************************
*  Generated by PSoC Designer 5.4.3191
******************************************************************************/
/******************************************************************************
*	This file contains defines to support oscillator register initialization
*		for CY8C29466
******************************************************************************/

#define CPU_CLOCK              0x0     //CPU clock value
#define CPU_CLOCK_MASK         0x7     //CPU clock mask
#define CPU_CLOCK_JUST         0x0     //CPU clock value justified
#define SELECT_32K             0x0     //32K select value
#define SELECT_32K_MASK        0x80    //32K select mask
#define SELECT_32K_JUST        0x0     //32K select value justified
#define PLL_MODE               0x0     //PLL mode value
#define PLL_MODE_MASK          0x40    //PLL mode mask
#define PLL_MODE_JUST          0x0     //PLL mode value justified
#define SLEEP_TIMER            0x0     //Sleep Timer value
#define SLEEP_TIMER_MASK       0x18    //Sleep Timer mask
#define SLEEP_TIMER_JUST       0x0     //Sleep Timer value justified
#define SWITCH_MODE_PUMP       0x1     //Switch Mode Pump value
#define SWITCH_MODE_PUMP_MASK  0x80    //Switch Mode Pump mask
#define SWITCH_MODE_PUMP_JUST  0x80    //Switch Mode Pump value justified
#define TRIP_VOLTAGE           0x7     //Trip Voltage
#define POWER_SETTING          0x10    //Power Setting [ Vcc / SysClk freq ] 0x10 = 5.0V / 24MHz
										//				0x08 = 3.3V / 24MHz
										//				0x09 = 3.3V / 12MHz
#define WATCHDOG_ENABLE        0x0     //Watchdog Enable 1 = Enable

#define CLOCK_DIV_VC1          0xf     // VC1 clock divider 
#define CLOCK_DIV_VC1_MASK     0xf0    // VC1 clock divider mask
#define CLOCK_DIV_VC1_JUST     0xf0    // jVC1 clock divider ustified
#define CLOCK_DIV_VC2          0xf     // VC2 clock divider 
#define CLOCK_DIV_VC2_MASK     0xf     // VC2 clock divider mask
#define CLOCK_DIV_VC2_JUST     0xf     // VC2 clock divider justified
#define CLOCK_INPUT_VC3        0x2     // VC3 clock source
#define CLOCK_INPUT_VC3_MASK   0x3     // VC3 clock source mask
#define CLOCK_INPUT_VC3_JUST   0x2     // VC3 clock source justified
#define CLOCK_DIV_VC3          0xff    // VC3 clock divider
#define CLOCK_DIV_VC3_MASK     0xff    // VC3 clock divider mask
#define CLOCK_DIV_VC3_JUST     0xff    // VC3 clock divider justified
#define ANALOG_BUFFER_PWR      0x0     // Analog buffer power level
#define ANALOG_BUFFER_PWR_MASK 0x1     // Analog buffer power level mask
#define ANALOG_BUFFER_PWR_JUST 0x0     // Analog buffer power level justified
#define ANALOG_POWER           0x5     // Analog power control
#define ANALOG_POWER_MASK      0x7     // Analog power control mask
#define ANALOG_POWER_JUST      0x5     // Analog power control justified
#define OP_AMP_BIAS            0x0     // Op amp bias level
#define OP_AMP_BIAS_MASK       0x40    // Op amp bias level mask
#define OP_AMP_BIAS_JUST       0x0     // Op amp bias level justified
#define REF_MUX                0x0     // Ref mux setting
#define REF_MUX_MASK           0x38    // Ref mux setting mask
#define REF_MUX_JUST           0x0     // Ref mux setting justified
#define AGND_BYPASS            0x0     // AGndBypass setting
#define AGND_BYPASS_MASK       0x40    // AGndBypass setting mask
#define AGND_BYPASS_JUST       0x0     // AGndBypass setting justified
#define SYSCLK_SOURCE          0x0     // SysClk Source setting
#define SYSCLK_SOURCE_MASK     0x4     // SysClk Source setting mask
#define SYSCLK_SOURCE_JUST     0x0     // SysClk Source setting justified
#define SYSCLK_2_DISABLE       0x0     // SysClk*2 Disable setting
#define SYSCLK_2_DISABLE_MASK  0x1     // SysClk*2 Disable setting mask
#define SYSCLK_2_DISABLE_JUST  0x0     // SysClk*2 Disable setting justified
//
// register initial values
//
#define ANALOG_IO_CONTROL      0x0     //Analog IO Control register (ABF_CR)
#define PORT_0_GLOBAL_SELECT   0x7b    //Port 0 global select register (PRT0GS)
#define PORT_0_DRIVE_0         0x70    //Port 0 drive mode 0 register (PRT0DM0)
#define PORT_0_DRIVE_1         0x8f    //Port 0 drive mode 1 register (PRT0DM1)
#define PORT_0_DRIVE_2         0x84    //Port 0 drive mode 1 register (PRT0DM2)
#define PORT_0_INTENABLE       0x0     //Port 0 interrupt enable register (PRT0IE)
#define PORT_0_INTCTRL_0       0x0     //Port 0 interrupt control 0 register (PRT0IC0)
#define PORT_0_INTCTRL_1       0x0     //Port 0 interrupt control 1 register (PRT0IC1)
#define PORT_1_GLOBAL_SELECT   0x0     //Port 1 global select register (PRT1GS)
#define PORT_1_DRIVE_0         0x1     //Port 1 drive mode 0 register (PRT1DM0)
#define PORT_1_DRIVE_1         0xfe    //Port 1 drive mode 1 register (PRT1DM1)
#define PORT_1_DRIVE_2         0xfe    //Port 1 drive mode 2 register (PRT1DM2)
#define PORT_1_INTENABLE       0x0     //Port 1 interrupt enable register (PRT1IE)
#define PORT_1_INTCTRL_0       0x0     //Port 1 interrupt control 0 register (PRT1IC0)
#define PORT_1_INTCTRL_1       0x0     //Port 1 interrupt control 1 register (PRT1IC1)
#define PORT_2_GLOBAL_SELECT   0x0     //Port 2 global select register (PRT2GS)
#define PORT_2_DRIVE_0         0x7f    //Port 2 drive mode 0 register (PRT2DM0)
#define PORT_2_DRIVE_1         0x80    //Port 2 drive mode 1 register (PRT2DM1)
#define PORT_2_DRIVE_2         0x80    //Port 2 drive mode 2 register (PRT2DM2)
#define PORT_2_INTENABLE       0x0     //Port 2 interrupt enable register (PRT2IE)
#define PORT_2_INTCTRL_0       0x0     //Port 2 interrupt control 0 register (PRT2IC0)
#define PORT_2_INTCTRL_1       0x0     //Port 2 interrupt control 1 register (PRT2IC1)
#define PORT_3_GLOBAL_SELECT   0x0     //Port 3 global select register (PRT3GS)
#define PORT_3_DRIVE_0         0x0     //Port 3 drive mode 0 register (PRT3DM0)
#define PORT_3_DRIVE_1         0x0     //Port 3 drive mode 1 register (PRT3DM1)
#define PORT_3_DRIVE_2         0x0     //Port 3 drive mode 2 register (PRT3DM2)
#define PORT_3_INTENABLE       0x0     //Port 3 interrupt enable register (PRT3IE)
#define PORT_3_INTCTRL_0       0x0     //Port 3 interrupt control 0 register (PRT3IC0)
#define PORT_3_INTCTRL_1       0x0     //Port 3 interrupt control 1 register (PRT3IC1)
#define PORT_4_GLOBAL_SELECT   0x0     //Port 4 global select register (PRT4GS)
#define PORT_4_DRIVE_0         0x0     //Port 4 drive mode 0 register (PRT4DM0)
#define PORT_4_DRIVE_1         0x0     //Port 4 drive mode 1 register (PRT4DM1)
#define PORT_4_DRIVE_2         0x0     //Port 4 drive mode 2 register (PRT4DM2)
#define PORT_4_INTENABLE       0x0     //Port 4 interrupt enable register (PRT4IE)
#define PORT_4_INTCTRL_0       0x0     //Port 4 interrupt control 0 register (PRT4IC0)
#define PORT_4_INTCTRL_1       0x0     //Port 4 interrupt control 1 register (PRT4IC1)
#define PORT_5_GLOBAL_SELECT   0x0     //Port 5 global select register (PRT5GS)
#define PORT_5_DRIVE_0         0x0     //Port 5 drive mode 0 register (PRT5DM0)
#define PORT_5_DRIVE_1         0x0     //Port 5 drive mode 1 register (PRT5DM1)
#define PORT_5_DRIVE_2         0x0     //Port 5 drive mode 2 register (PRT5DM2)
#define PORT_5_INTENABLE       0x0     //Port 5 interrupt enable register (PRT5IE)
#define PORT_5_INTCTRL_0       0x0     //Port 5 interrupt control 0 register (PRT5IC0)
#define PORT_5_INTCTRL_1       0x0     //Port 5 interrupt control 1 register (PRT5IC1)
#define PORT_6_GLOBAL_SELECT   0x0     //Port 6 global select register (PRT6GS)
#define PORT_6_DRIVE_0         0x0     //Port 6 drive mode 0 register (PRT6DM0)
#define PORT_6_DRIVE_1         0x0     //Port 6 drive mode 1 register (PRT6DM1)
#define PORT_6_DRIVE_2         0x0     //Port 6 drive mode 2 register (PRT6DM2)
#define PORT_6_INTENABLE       0x0     //Port 6 interrupt enable register (PRT6IE)
#define PORT_6_INTCTRL_0       0x0     //Port 6 interrupt control 0 register (PRT6IC0)
#define PORT_6_INTCTRL_1       0x0     //Port 6 interrupt control 1 register (PRT6IC1)
#define PORT_7_GLOBAL_SELECT   0x0     //Port 7 global select register (PRT7GS)
#define PORT_7_DRIVE_0         0x0     //Port 7 drive mode 0 register (PRT7DM0)
#define PORT_7_DRIVE_1         0x0     //Port 7 drive mode 1 register (PRT7DM1)
#define PORT_7_DRIVE_2         0x0     //Port 7 drive mode 2 register (PRT7DM2)
#define PORT_7_INTENABLE       0x0     //Port 7 interrupt enable register (PRT7IE)
#define PORT_7_INTCTRL_0       0x0     //Port 7 interrupt control 0 register (PRT7IC0)
#define PORT_7_INTCTRL_1       0x0     //Port 7 interrupt control 1 register (PRT7IC1)
