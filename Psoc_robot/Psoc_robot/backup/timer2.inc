;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: Timer2.inc
;;   Version: 2.6, Updated on 2015/3/4 at 22:27:47
;;  Generated by PSoC Designer 5.4.3191
;;
;;  DESCRIPTION: Assembler declarations for the Timer16 user module interface
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2015. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "m8c.inc"


;--------------------------------------------------
; Constants for Timer2 API's.
;--------------------------------------------------

Timer2_CONTROL_REG_START_BIT:              equ 0x01    ; Control register start bit
Timer2_INT_REG:                            equ 0x0e1
Timer2_INT_MASK:                           equ 0x08


;--------------------------------------------------
; Constants for Timer2 user defined values
;--------------------------------------------------

Timer2_PERIOD:                             equ 0xffff
Timer2_COMPARE_VALUE:                      equ 0x0


;--------------------------------------------------
; Register Address Constants for Timer2
;--------------------------------------------------

Timer2_COUNTER_LSB_REG:                equ 0x28   ; DR0 Counter register
Timer2_COUNTER_MSB_REG:                equ 0x2c
Timer2_PERIOD_LSB_REG:                 equ 0x29   ; DR1 Period register
Timer2_PERIOD_MSB_REG:                 equ 0x2d
Timer2_COMPARE_LSB_REG:                equ 0x2a   ; DR2 CompareValue register
Timer2_COMPARE_MSB_REG:                equ 0x2e
Timer2_CONTROL_LSB_REG:                equ 0x2b   ; Control register
Timer2_CONTROL_MSB_REG:                equ 0x2f
Timer2_FUNC_LSB_REG:                   equ 0x28   ; Function register
Timer2_FUNC_MSB_REG:                   equ 0x2c
Timer2_INPUT_LSB_REG:                  equ 0x29   ; Input register
Timer2_INPUT_MSB_REG:                  equ 0x2d
Timer2_OUTPUT_LSB_REG:                 equ 0x2a   ; Output register
Timer2_OUTPUT_MSB_REG:                 equ 0x2e


;--------------------------------------------------
; Timer2 Macro 'Functions'
;--------------------------------------------------

   macro Timer2_Start_M
   or    reg[Timer2_CONTROL_LSB_REG],  Timer2_CONTROL_REG_START_BIT
   endm

   macro Timer2_Stop_M
   and   reg[Timer2_CONTROL_LSB_REG], ~Timer2_CONTROL_REG_START_BIT
   endm

   macro Timer2_EnableInt_M
   M8C_EnableIntMask Timer2_INT_REG, Timer2_INT_MASK
   endm

   macro Timer2_DisableInt_M
   M8C_DisableIntMask Timer2_INT_REG, Timer2_INT_MASK
   endm


; end of file Timer2.inc