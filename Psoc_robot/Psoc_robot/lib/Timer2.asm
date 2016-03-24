;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: Timer2.asm
;;   Version: 2.6, Updated on 2015/3/4 at 22:27:47
;;  Generated by PSoC Designer 5.4.3191
;;
;;  DESCRIPTION: Timer16 User Module software implementation file
;;
;;  NOTE: User Module APIs conform to the fastcall16 convention for marshalling
;;        arguments and observe the associated "Registers are volatile" policy.
;;        This means it is the caller's responsibility to preserve any values
;;        in the X and A registers that are still needed after the API functions
;;        returns. For Large Memory Model devices it is also the caller's 
;;        responsibility to perserve any value in the CUR_PP, IDX_PP, MVR_PP and 
;;        MVW_PP registers. Even though some of these registers may not be modified
;;        now, there is no guarantee that will remain the case in future releases.
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2015. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "m8c.inc"
include "memory.inc"
include "Timer2.inc"

;-----------------------------------------------
;  Global Symbols
;-----------------------------------------------
export  Timer2_EnableInt
export _Timer2_EnableInt
export  Timer2_DisableInt
export _Timer2_DisableInt
export  Timer2_Start
export _Timer2_Start
export  Timer2_Stop
export _Timer2_Stop
export  Timer2_WritePeriod
export _Timer2_WritePeriod
export  Timer2_WriteCompareValue
export _Timer2_WriteCompareValue
export  Timer2_wReadCompareValue
export _Timer2_wReadCompareValue
export  Timer2_wReadTimer
export _Timer2_wReadTimer
export  Timer2_wReadTimerSaveCV
export _Timer2_wReadTimerSaveCV

; The following functions are deprecated and subject to omission in future releases
;
export  wTimer2_ReadCompareValue  ; deprecated
export _wTimer2_ReadCompareValue  ; deprecated
export  wTimer2_ReadTimer         ; deprecated
export _wTimer2_ReadTimer         ; deprecated
export  wTimer2_ReadTimerSaveCV   ; deprecated
export _wTimer2_ReadTimerSaveCV   ; deprecated

export  wTimer2_ReadCounter       ; obsolete
export _wTimer2_ReadCounter       ; obsolete
export  wTimer2_CaptureCounter    ; obsolete
export _wTimer2_CaptureCounter    ; obsolete


AREA psoc_robot_RAM (RAM,REL)

;-----------------------------------------------
;  Constant Definitions
;-----------------------------------------------


;-----------------------------------------------
; Variable Allocation
;-----------------------------------------------


AREA UserModules (ROM, REL)

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Timer2_EnableInt
;
;  DESCRIPTION:
;     Enables this timer's interrupt by setting the interrupt enable mask bit
;     associated with this User Module. This function has no effect until and
;     unless the global interrupts are enabled (for example by using the
;     macro M8C_EnableGInt).
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    None.
;  RETURNS:      Nothing.
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 Timer2_EnableInt:
_Timer2_EnableInt:
   RAM_PROLOGUE RAM_USE_CLASS_1
   Timer2_EnableInt_M
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Timer2_DisableInt
;
;  DESCRIPTION:
;     Disables this timer's interrupt by clearing the interrupt enable
;     mask bit associated with this User Module.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    None
;  RETURNS:      Nothing
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 Timer2_DisableInt:
_Timer2_DisableInt:
   RAM_PROLOGUE RAM_USE_CLASS_1
   Timer2_DisableInt_M
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Timer2_Start
;
;  DESCRIPTION:
;     Sets the start bit in the Control register of this user module.  The
;     timer will begin counting on the next input clock.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    None
;  RETURNS:      Nothing
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 Timer2_Start:
_Timer2_Start:
   RAM_PROLOGUE RAM_USE_CLASS_1
   Timer2_Start_M
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Timer2_Stop
;
;  DESCRIPTION:
;     Disables timer operation by clearing the start bit in the Control
;     register of the LSB block.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    None
;  RETURNS:      Nothing
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 Timer2_Stop:
_Timer2_Stop:
   RAM_PROLOGUE RAM_USE_CLASS_1
   Timer2_Stop_M
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Timer2_WritePeriod
;
;  DESCRIPTION:
;     Write the 16-bit period value into the Period register (DR1). If the
;     Timer user module is stopped, then this value will also be latched
;     into the Count register (DR0).
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: fastcall16 WORD wPeriodValue (LSB in A, MSB in X)
;  RETURNS:   Nothing
;  SIDE EFFECTS:
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 Timer2_WritePeriod:
_Timer2_WritePeriod:
   RAM_PROLOGUE RAM_USE_CLASS_1
   mov   reg[Timer2_PERIOD_LSB_REG], A
   mov   A, X
   mov   reg[Timer2_PERIOD_MSB_REG], A
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Timer2_WriteCompareValue
;
;  DESCRIPTION:
;     Writes compare value into the Compare register (DR2).
;
;     NOTE! The Timer user module must be STOPPED in order to write the
;           Compare register. (Call Timer2_Stop to disable).
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    fastcall16 WORD wCompareValue (LSB in A, MSB in X)
;  RETURNS:      Nothing
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 Timer2_WriteCompareValue:
_Timer2_WriteCompareValue:
   RAM_PROLOGUE RAM_USE_CLASS_1
   mov   reg[Timer2_COMPARE_LSB_REG], A
   mov   A, X
   mov   reg[Timer2_COMPARE_MSB_REG], A
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Timer2_wReadCompareValue
;
;  DESCRIPTION:
;     Reads the Compare registers.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    None
;  RETURNS:      fastcall16 WORD wCompareValue (value of DR2 in the X & A registers)
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 Timer2_wReadCompareValue:
_Timer2_wReadCompareValue:
 wTimer2_ReadCompareValue:                       ; this name deprecated
_wTimer2_ReadCompareValue:                       ; this name deprecated
   RAM_PROLOGUE RAM_USE_CLASS_1
   mov   A, reg[Timer2_COMPARE_MSB_REG]
   mov   X, A
   mov   A, reg[Timer2_COMPARE_LSB_REG]
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Timer2_wReadTimerSaveCV
;
;  DESCRIPTION:
;     Returns the value in the Count register (DR0), preserving the
;     value in the compare register (DR2).
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: None
;  RETURNS:   fastcall16 WORD wCount (value of DR0 in the X & A registers)
;  SIDE EFFECTS:
;     1) May cause an interrupt, if interrupt on Compare is enabled.
;     2) If enabled, Global interrupts are momentarily disabled.
;     3) The user module is stopped momentarily while the compare value is
;        restored.  This may cause the Count register to miss one or more
;        counts depending on the input clock speed.
;     4) The A and X registers may be modified by this or future implementations
;        of this function.  The same is true for all RAM page pointer registers in
;        the Large Memory Model.  When necessary, it is the calling function's
;        responsibility to perserve their values across calls to fastcall16 
;        functions.
;
;  THEORY of OPERATION:
;     1) Read and save the Compare register.
;     2) Read the Count register, causing its data to be latched into
;        the Compare register.
;     3) Read and save the Counter value, now in the Compare register,
;        to the buffer.
;     4) Disable global interrupts
;     5) Halt the timer
;     6) Restore the Compare register values
;     7) Start the Timer again
;     8) Restore global interrupt state
;
 Timer2_wReadTimerSaveCV:
_Timer2_wReadTimerSaveCV:
 wTimer2_ReadTimerSaveCV:                        ; this name deprecated
_wTimer2_ReadTimerSaveCV:                        ; this name deprecated
 wTimer2_ReadCounter:                            ; this name deprecated
_wTimer2_ReadCounter:                            ; this name deprecated

CpuFlags:      equ   0
wCount_MSB:    equ   1
wCount_LSB:    equ   2

   RAM_PROLOGUE RAM_USE_CLASS_2
   mov   X, SP                                   ; X <- stack frame pointer
   add   SP, 3                                   ; Reserve space for flags, count
   mov   A, reg[Timer2_CONTROL_LSB_REG]          ; save the Control register
   push  A
   mov   A, reg[Timer2_COMPARE_LSB_REG]          ; save the Compare register
   push  A
   mov   A, reg[Timer2_COMPARE_MSB_REG]
   push  A
   mov   A, reg[Timer2_COUNTER_LSB_REG]          ; synchronous copy DR2 <- DR0
                                                 ; This may cause an interrupt!
   mov   A, reg[Timer2_COMPARE_MSB_REG]          ; Now grab DR2 (DR0) and save
   mov   [X+wCount_MSB], A
   mov   A, reg[Timer2_COMPARE_LSB_REG]
   mov   [X+wCount_LSB], A
   mov   A, 0                                    ; Guess the global interrupt state
   tst   reg[CPU_F], FLAG_GLOBAL_IE              ; Currently Disabled?
   jz    .SetupStatusFlag                        ;   Yes, guess was correct
   mov   A, FLAG_GLOBAL_IE                       ;    No, modify our guess
.SetupStatusFlag:                                ; and ...
   mov   [X+CpuFlags], A                         ;   StackFrame[0] <- Flag Reg image
   M8C_DisableGInt                               ; Disable interrupts globally
   Timer2_Stop_M                                 ; Disable (stop) the timer
   pop   A                                       ; Restore the Compare register
   mov   reg[Timer2_COMPARE_MSB_REG], A
   pop   A
   mov   reg[Timer2_COMPARE_LSB_REG], A
   pop   A                                       ; restore start state of the timer
   mov   reg[Timer2_CONTROL_LSB_REG], A
   pop   A                                       ; Return result stored in stack frame
   pop   X
   RAM_EPILOGUE RAM_USE_CLASS_2
   reti                                          ; Flag Reg <- StackFrame[0]

.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: Timer2_wReadTimer
;
;  DESCRIPTION:
;     Performs a software capture of the Count register.  A synchronous
;     read of the Count register is performed.  The timer is NOT stopped.
;
;     WARNING - this will cause loss of data in the Compare register.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    None
;  RETURNS:      fastcall16 WORD wCount, (value of DR0 in the X & A registers)
;  SIDE EFFECTS:
;    May cause an interrupt.
;
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
;  THEORY of OPERATION:
;     1) Read the Count register - this causes the count value to be
;        latched into the Compare registers.
;     2) Read and return the Count register values from the Compare
;        registers into the return buffer.
;
 Timer2_wReadTimer:
_Timer2_wReadTimer:
 wTimer2_ReadTimer:                              ; this name deprecated
_wTimer2_ReadTimer:                              ; this name deprecated
 wTimer2_CaptureCounter:                         ; this name deprecated
_wTimer2_CaptureCounter:                         ; this name deprecated

   RAM_PROLOGUE RAM_USE_CLASS_1
   mov   A, reg[Timer2_COUNTER_LSB_REG]          ; synchronous copy DR2 <- DR0
                                                 ; This may cause an interrupt!

   mov   A, reg[Timer2_COMPARE_MSB_REG]          ; Return DR2 (actually DR0)
   mov   X, A
   mov   A, reg[Timer2_COMPARE_LSB_REG]
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret

.ENDSECTION

; End of File Timer2.asm