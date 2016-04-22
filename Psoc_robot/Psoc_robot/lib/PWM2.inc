;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: PWM2.inc
;;   Version: 2.5, Updated on 2015/3/4 at 22:26:51
;;  Generated by PSoC Designer 5.4.3191
;;
;;  DESCRIPTION: Assembler declarations for the PWM16 user module interface
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2015. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "m8c.inc"


;--------------------------------------------------
; Constants for PWM2 API's.
;--------------------------------------------------

PWM2_CONTROL_REG_START_BIT:                equ 0x01    ; Control register start bit
PWM2_INT_REG:                              equ 0x0df
PWM2_INT_MASK:                             equ 0x08


;--------------------------------------------------
; Constants for PWM2 user defined values
;--------------------------------------------------

PWM2_PERIOD:                               equ 0x3e7
PWM2_PULSE_WIDTH:                          equ 0x0


;--------------------------------------------------
; Register Address Constants for PWM2
;--------------------------------------------------

PWM2_COUNTER_LSB_REG:                  equ 0x48   ; DR0 Count register
PWM2_COUNTER_MSB_REG:                  equ 0x4c
PWM2_PERIOD_LSB_REG:                   equ 0x49   ; DR1 Period register
PWM2_PERIOD_MSB_REG:                   equ 0x4d
PWM2_COMPARE_LSB_REG:                  equ 0x4a   ; DR2 Compare register
PWM2_COMPARE_MSB_REG:                  equ 0x4e
PWM2_CONTROL_LSB_REG:                  equ 0x4b   ; Control register
PWM2_CONTROL_MSB_REG:                  equ 0x4f
PWM2_FUNC_LSB_REG:                     equ 0x48   ; Function register
PWM2_FUNC_MSB_REG:                     equ 0x4c
PWM2_INPUT_LSB_REG:                    equ 0x49   ; Input register
PWM2_INPUT_MSB_REG:                    equ 0x4d
PWM2_OUTPUT_LSB_REG:                   equ 0x4a   ; Output register
PWM2_OUTPUT_MSB_REG:                   equ 0x4e


;--------------------------------------------------
; PWM2 Macro 'Functions'
;--------------------------------------------------

   macro PWM2_Start_M
   or    reg[PWM2_CONTROL_LSB_REG],  PWM2_CONTROL_REG_START_BIT
   endm

   macro PWM2_Stop_M
   and   reg[PWM2_CONTROL_LSB_REG], ~PWM2_CONTROL_REG_START_BIT
   endm

   macro PWM2_EnableInt_M
   M8C_EnableIntMask PWM2_INT_REG, PWM2_INT_MASK
   endm

   macro PWM2_DisableInt_M
   M8C_DisableIntMask PWM2_INT_REG, PWM2_INT_MASK
   endm


; end of file PWM2.inc
